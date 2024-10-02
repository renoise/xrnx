use std::{collections::HashMap, path::Path};

use itertools::Itertools;

use crate::{error::Error, json::JsonDoc, types::*};

#[derive(Clone)]
pub struct Library {
    pub classes: HashMap<String, Class>,
    pub enums: HashMap<String, Enum>,
    pub aliases: HashMap<String, Alias>,
}

impl Library {
    /// generate a library from a given root directory or lua file
    pub fn from_path(path: &Path) -> Result<Self, Error> {
        println!("Parsing definitions: '{}'", path.to_string_lossy());
        let mut defs: Vec<Def> = vec![];
        let definitions = JsonDoc::get(path)?;
        defs.append(
            &mut definitions
                .iter()
                .filter_map(Def::from_definition)
                .collect::<Vec<Def>>(),
        );
        Ok(Self::from_defs(defs))
    }

    // a list of classes that correspond to lua types
    pub fn builtin_classes() -> Vec<Class> {
        let self_example =
            "```lua\nlocal song = renoise.song()\nlocal first_pattern = song:pattern(1)\n```";
        vec![
            Self::builtin_class_desc(
                "self",
                &format!("A type that represents an instance that you call a function on. When you see a function signature starting with this type, you should use `:` to call the function on the instance, this way you can omit this first argument.\n{}", self_example),
            ),
            Self::builtin_class_desc(
                "nil",
                "A built-in type representing a non-existant value, [see details](https://www.lua.org/pil/2.1.html). When you see `?` at the end of types, it means they can be nil.",
            ),
            Self::builtin_class_desc(
                "boolean",
                "A built-in type representing a boolean (true or false) value, [see details](https://www.lua.org/pil/2.2.html)",
            ),
            Self::builtin_class_desc(
                "number",
                "A built-in type representing floating point numbers, [see details](https://www.lua.org/pil/2.3.html)",
            ),
            Self::builtin_class_desc(
                "string",
                "A built-in type representing a string of characters, [see details](https://www.lua.org/pil/2.4.html)",
            ),
            Self::builtin_class_desc("function", "A built-in type representing functions, [see details](https://www.lua.org/pil/2.6.html)"),
            Self::builtin_class_desc("table", "A built-in type representing associative arrays, [see details](https://www.lua.org/pil/2.5.html)"),
            Self::builtin_class_desc("userdata", "A built-in type representing array values, [see details](https://www.lua.org/pil/28.1.html)."),
            Self::builtin_class_desc(
                "lightuserdata",
                "A built-in type representing a pointer, [see details](https://www.lua.org/pil/28.5.html)",
            ),

            Self::builtin_class_desc("integer", "A helper type that represents whole numbers, a subset of [number](number.md)"),
            Self::builtin_class_desc(
                "any",
                "A type for a dynamic argument, it can be anything at run-time.",
            ),
            Self::builtin_class_desc(
                "unknown",
                "A dummy type for something that cannot be inferred before run-time.",
            ),
        ]
    }

    fn resolve_string(&self, s: &str) -> Option<Kind> {
        #[allow(clippy::manual_map)]
        if let Some(class) = self.classes.get(s) {
            Some(Kind::Class(class.clone()))
        } else if let Some(alias) = self.aliases.get(s) {
            Some(Kind::Alias(Box::new(alias.clone())))
        } else if let Some(enumref) = self.enums.get(s) {
            Some(Kind::EnumRef(Box::new(enumref.clone())))
        } else {
            None
        }
    }

    // cross-reference parsed Kinds as existing classes, enums and aliases
    fn resolve_kind(&self, kind: &Kind) -> Kind {
        match kind.clone() {
            Kind::Unresolved(s) => self.resolve_string(&s).unwrap_or(kind.clone()),
            Kind::Array(bk) => Kind::Array(Box::new(self.resolve_kind(bk.as_ref()))),
            Kind::Nullable(bk) => Kind::Nullable(Box::new(self.resolve_kind(bk.as_ref()))),
            Kind::Table(key, value) => Kind::Table(
                Box::new(self.resolve_kind(key.as_ref())),
                Box::new(self.resolve_kind(value.as_ref())),
            ),
            Kind::Enum(kinds) => Kind::Enum(kinds.iter().map(|k| self.resolve_kind(k)).collect()),
            Kind::Function(f) => {
                let mut fun = f.clone();
                self.resolve_function(&mut fun);
                Kind::Function(fun)
            }
            Kind::Variadic(v) => Kind::Variadic(Box::new(self.resolve_kind(v.as_ref()))),
            Kind::Object(hm) => {
                let mut obj = hm.clone();
                for (key, value) in hm.iter() {
                    obj.insert(key.clone(), Box::new(self.resolve_kind(value.as_ref())));
                }
                Kind::Object(obj)
            }
            _ => kind.clone(),
        }
    }

    fn resolve_function(&self, f: &mut Function) {
        for p in f.params.iter_mut() {
            p.kind = self.resolve_kind(&p.kind)
        }
        for r in f.returns.iter_mut() {
            r.kind = self.resolve_kind(&r.kind)
        }
    }

    fn resolve_classes(&mut self) {
        let l = self.clone();
        for (_, c) in self.classes.iter_mut() {
            for f in c.fields.iter_mut() {
                f.kind = l.resolve_kind(&f.kind)
            }
            for f in c.functions.iter_mut() {
                l.resolve_function(f)
            }
        }
    }

    // helper to create built-in dummy classes
    fn builtin_class_desc(name: &str, desc: &str) -> Class {
        Class {
            file: None,
            line_number: None,
            scope: Scope::Modules,
            name: name.to_string(),
            desc: desc.to_string(),
            fields: vec![],
            functions: vec![],
            constants: vec![],
            enums: vec![],
        }
    }

    // generate Library from a list of Defs
    fn from_defs(defs: Vec<Def>) -> Self {
        // sort defs into hasmaps of classes, enums and aliases
        let mut classes = HashMap::new();
        let mut enums = HashMap::new();
        let mut aliases = HashMap::new();
        let mut dangling_functions = vec![];
        for d in defs.iter() {
            match d {
                Def::Alias(a) => {
                    aliases.insert(a.name.clone(), a.clone());
                }
                Def::Enum(e) => {
                    enums.insert(e.name.clone(), e.clone());
                }
                Def::Class(c) => {
                    classes.insert(c.name.clone(), c.clone());
                }
                Def::Function(f) => dangling_functions.push(f.clone()),
            }
        }

        let mut library = Self {
            classes,
            enums,
            aliases,
        };

        // transform any unresolved Kind to the appropriate classe or alias
        // by cross referencing the hashmaps of the library
        library.resolve_classes();
        let mut aliases = library.aliases.clone();
        aliases
            .iter_mut()
            .for_each(|(_, a)| a.kind = library.resolve_kind(&a.kind));
        library.aliases = aliases;
        dangling_functions
            .iter_mut()
            .for_each(|f| library.resolve_function(f));

        // assign enums to their respective classes
        for (k, e) in library.enums.iter() {
            let base = Class::get_base(k);
            if let Some(base) = base {
                if let Some(class) = library.classes.get_mut(base) {
                    class.enums.push(e.clone())
                }
            }
        }

        // create dummy classes for global functions and those without a parent class (in module exensions)
        for f in dangling_functions.iter_mut() {
            let name = &f.name.clone().unwrap_or_default();
            let base = Class::get_base(name).unwrap_or("global");
            if let Some((_, class)) = library.classes.iter_mut().find(|(k, _)| *k == base) {
                if class
                    .functions
                    .iter()
                    .any(|fun| fun.name == f.strip_base().name)
                {
                    // skip class function as it was already added by Def::from_definition to its class
                } else {
                    class.functions.push(f.strip_base())
                }
            } else {
                library.classes.insert(
                    base.to_string(),
                    Class {
                        file: None,
                        line_number: None,
                        scope: Scope::from_name(base),
                        name: base.to_string(),
                        functions: vec![f.strip_base()],
                        fields: vec![],
                        enums: vec![],
                        constants: vec![],
                        // TODO the description should end up here from bit, os etc
                        desc: String::new(),
                    },
                );
            }
        }

        // extract constants, make functions, fields and constants unique and sort them
        for (_, c) in library.classes.iter_mut() {
            let mut functions = c
                .functions
                .iter()
                .unique_by(|f| f.to_string())
                .cloned()
                .collect::<Vec<_>>();
            functions.sort_by_key(|f| (f.file.clone(), f.line_number));

            let mut enums = c
                .enums
                .clone()
                .into_iter()
                .unique_by(|e| e.name.clone())
                .collect::<Vec<_>>();
            enums.sort_by_key(|e| (e.file.clone(), e.line_number));

            let mut fields = c
                .fields
                .clone()
                .into_iter()
                .filter(Var::is_not_constant)
                // HACK: remove table properties from classes, assuming they are nested classes
                .filter(|v| !matches!(v.kind, Kind::Lua(LuaKind::Table)))
                .unique_by(|f| f.name.clone())
                .collect::<Vec<_>>();
            fields.sort_by_key(|f| (f.file.clone(), f.line_number));

            let mut constants = c
                .fields
                .clone()
                .into_iter()
                .filter(Var::is_constant)
                .unique_by(|f| f.name.clone())
                .collect::<Vec<_>>();
            constants.sort_by_key(|c| (c.file.clone(), c.line_number));

            c.functions = functions;
            c.fields = fields;
            c.enums = enums;
            c.constants = constants;
        }

        // debug print everything that includes some unresolved Kind or is empty
        println!("classes:");
        for c in library.classes.values() {
            let is_empty = library.classes.get(&c.name).is_some_and(|v| v.is_empty());
            let unresolved = c.has_unresolved();

            if is_empty || unresolved {
                println!("  {}", c.name);
            }
            if unresolved {
                println!("{}\n", c.show());
            }
            if is_empty {
                println!("  \x1b[33m^--- has no fields, methods or enums\x1b[0m")
            }
        }
        println!("aliases:");
        for a in library.aliases.values() {
            if a.kind.has_unresolved() {
                println!("  {}", a.name);
                println!("\n{}\n", a.show());
            }
        }
        // println!("enums");
        // for e in l.enums.values() {
        //     println!("  {}", e.name);
        // }

        library
    }
}
