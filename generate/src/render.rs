use crate::library::Library;
use crate::types::*;

impl Library {
    /// render each page inside the library as a list of string tuples (name, content)
    pub fn export_docs(&self) -> Vec<(String, String)> {
        let mut docs: Vec<(String, String)> = self
            .classes
            .iter()
            .map(|(name, class)| (name.clone(), class.render()))
            .collect();
        let mut aliases: Vec<(String, String)> = self
            .aliases
            .iter()
            .map(|(name, alias)| (name.clone(), alias.render()))
            .collect();
        docs.append(&mut aliases);
        Self::sort(&mut docs);
        docs
    }

    // sort the list of docs so that lowercase names come first
    // and classes starting with "renoise" come before built-in class pages
    fn sort(docs: &mut [(String, String)]) {
        docs.sort_by(
            |(a, _), (b, _)| match (a.chars().next(), b.chars().next()) {
                (Some(ac), Some(bc)) => {
                    if ac.is_lowercase() && bc.is_lowercase() {
                        if a.starts_with("renoise") && !b.starts_with("renoise") {
                            std::cmp::Ordering::Less
                        } else if b.starts_with("renoise") && !a.starts_with("renoise") {
                            std::cmp::Ordering::Greater
                        } else {
                            a.cmp(b)
                        }
                    } else if ac.is_uppercase() && bc.is_uppercase() {
                        a.cmp(b)
                    } else if ac.is_lowercase() && bc.is_uppercase() {
                        std::cmp::Ordering::Less
                    } else {
                        std::cmp::Ordering::Greater
                    }
                }
                _ => a.cmp(b),
            },
        )
    }
}

fn heading(text: &str, level: usize) -> String {
    format!("{} {}", "#".repeat(level), text)
}

fn h1(text: &str) -> String {
    heading(text, 1)
}

fn h2(text: &str) -> String {
    heading(text, 2)
}

fn h3(text: &str) -> String {
    heading(text, 3)
}

fn link(text: &str, url: &str) -> String {
    format!("[`{}`]({}.md)", text, url)
}
fn sublink(text: &str, url: &str, hash: &str) -> String {
    format!("[`{}`]({}.md#{})", text, url, hash)
}
// fn quote(text: &str) -> String {
//     format!("> {}", text)
// }

// fn item(text: &str) -> String {
//     format!("* {}", text)
// }
// fn italic(text: &str) -> String {
//     format!("*{}*", text)
// }

fn hash(text: &str, hash: &str) -> String {
    format!("{} {{#{}}}", text, hash)
}

impl LuaKind {
    fn link(&self) -> String {
        let text = self.show();
        link(&text, &text)
    }
}

impl Kind {
    fn link(&self) -> String {
        match self {
            Kind::Lua(lk) => lk.link(),
            Kind::Literal(k, s) => match k.as_ref() {
                LuaKind::String => format!("`\"{}\"`", s),
                LuaKind::Integer | LuaKind::Number => format!("`{}`", s.clone()),
                _ => s.clone(),
            },
            Kind::Class(name) => link(name, name),
            Kind::Enum(kinds) => kinds
                .iter()
                .map(|k| k.link())
                .collect::<Vec<String>>()
                .join(" | "),
            Kind::EnumRef(name) => sublink(
                name,
                Class::get_base(name).unwrap_or(name),
                Class::get_end(name).unwrap_or_default(),
            ),
            Kind::SelfArg => "[*self*](self.md)".to_string(),
            Kind::Array(k) => format!("{}`[]`", k.as_ref().link()),
            Kind::Nullable(k) => format!("{}{}", k.as_ref().link(), link("?", "nil")),
            Kind::Alias(name) => link(name, name),
            Kind::Function(f) => f.short(),
            Kind::Table(k, v) => format!("table<{}, {}>", k.as_ref().link(), v.as_ref().link()),
            Kind::Object(hm) => {
                let mut keys = hm.iter().map(|(k, _)| k.clone()).collect::<Vec<String>>();
                keys.sort();
                let fields = keys
                    .iter()
                    .map(|k| format!("{} : {}", k, hm.get(k).unwrap().as_ref().link()))
                    .collect::<Vec<String>>()
                    .join(", "); // TODO print on newlines?
                format!("{{ {} }}", fields)
            }
            Kind::Variadic(k) => format!("...{}", k.as_ref().link()),
            Kind::Unresolved(s) => s.clone(),
        }
    }
}

impl Var {
    fn short(&self) -> String {
        if matches!(self.kind, Kind::SelfArg) {
            self.kind.link()
        } else if let Some(name) = self.name.clone() {
            format!("{} : {}", name, self.kind.link())
        } else {
            self.kind.link()
        }
    }
    fn long(&self) -> String {
        let desc = self.desc.clone().unwrap_or_default();
        format!(
            "{}{}",
            hash(&h3(&self.short()), &self.name.clone().unwrap_or_default()),
            if desc.is_empty() {
                desc
            } else {
                format!("\n{}\n", desc.trim_matches('\n'))
            }
        )
    }
}

impl Alias {
    fn render(&self) -> String {
        format!(
            "{}\n{}  \n{}",
            hash(&h1(&format!("alias {}", &self.name)), &self.name),
            self.kind.link(),
            self.desc.clone().unwrap_or_default()
        )
    }
}

impl Function {
    fn long(&self) -> String {
        let name = self.name.clone().unwrap_or("fun".to_string());
        if self.params.is_empty() {
            let name = hash(&h3(&format!("`{}()`", &name)), &name);
            self.with_desc(&self.with_returns(&name))
        } else {
            let params = self
                .params
                .iter()
                .map(Var::short)
                .collect::<Vec<String>>()
                .join(", ");

            self.with_desc(
                &self.with_returns(&hash(&format!("### `{}`({})", &name, params), &name)),
            )
        }
    }
    fn short(&self) -> String {
        if self.params.is_empty() && self.returns.is_empty() {
            return self.empty();
        }
        let returns = Self::render_vars(&self.returns);
        format!(
            "{}({}){}",
            &self.name.clone().unwrap_or_default(),
            Self::render_vars(&self.params),
            if returns.is_empty() {
                returns
            } else {
                format!(" `->` {}", returns)
            }
        )
    }
    fn empty(&self) -> String {
        format!("{}()", &self.name.clone().unwrap_or("fun".to_string()))
    }
    fn render_vars(vars: &[Var]) -> String {
        vars.iter()
            .map(Var::short)
            .collect::<Vec<String>>()
            .join(", ")
    }
    fn with_desc(&self, head: &str) -> String {
        let desc = self.desc.clone().unwrap_or_default();
        if desc.is_empty() {
            head.to_string()
        } else {
            format!("{}\n{}", head, desc)
        }
    }
    fn with_returns(&self, head: &str) -> String {
        let returns = self
            .returns
            .iter()
            .map(Var::short)
            .collect::<Vec<String>>()
            .join(", ");
        if returns.is_empty() {
            head.to_string()
        } else {
            format!("{}\n`->`{}  \n", head, returns)
        }
    }
}

impl Class {
    fn render(&self) -> String {
        let mut m = vec![h1(&self.name)];

        if !self.desc.is_empty() {
            m.push(self.desc.clone())
        }

        if !self.enums.is_empty() || !self.constants.is_empty() {
            m.push(format!(
                "{}\n{}\n{}",
                h2("Constants"),
                self.enums
                    .iter()
                    .map(|e| {
                        let name = e.name.clone();
                        let end = Class::get_end(&name).unwrap_or(&name);
                        format!("{}\n{}", hash(&h3(end), end), e.desc)
                    })
                    .collect::<Vec<String>>()
                    .join("\n"),
                self.constants
                    .iter()
                    .map(Var::long)
                    .collect::<Vec<String>>()
                    .join("\n")
            ))
        }

        if !self.fields.is_empty() {
            m.push("\n---".to_string());
            m.push(format!(
                "{}\n{}\n",
                h2("Properties"),
                self.fields
                    .iter()
                    .map(Var::long)
                    .collect::<Vec<String>>()
                    .join("\n")
            ))
        }

        let mut methods = self.methods.clone();
        methods.sort_by(|a, b| a.name.cmp(&b.name));
        if !methods.is_empty() {
            m.push("\n---".to_string());
            m.push(format!(
                "{}\n{}",
                h2("Functions"),
                methods
                    .iter()
                    .map(Function::long)
                    .collect::<Vec<String>>()
                    .join("\n")
            ))
        }
        m.push("\n".to_string());
        m.join("  \n")
    }
}
