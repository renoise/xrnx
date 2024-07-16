use serde::{Deserialize, Serialize};
use std::{collections::HashMap, fmt};

/// enum for possible lua-ls built-in types
#[derive(Debug, PartialEq, Serialize, Deserialize, Clone, Eq, PartialOrd, Ord)]
#[serde(rename_all = "lowercase")]
pub enum LuaKind {
    Nil,
    Unknown,
    Any,
    Boolean,
    String,
    Number,
    Integer,
    Function,
    Table,
    Thread,
    UserData,
    Binary,
    LightUserData,
}

/// enum for complex custom types
#[derive(Debug, Clone, PartialEq)]
pub enum Kind {
    Unresolved(String),
    Lua(LuaKind),
    Array(Box<Kind>),
    Nullable(Box<Kind>),
    Table(Box<Kind>, Box<Kind>),
    Object(HashMap<String, Box<Kind>>),
    Alias(String),
    Class(String),
    Function(Function),
    Enum(Vec<Kind>),
    EnumRef(String),
    SelfArg,
    Variadic(Box<Kind>),
    Literal(Box<LuaKind>, String),
}

/// a definition alias, rendered as a doc page
#[derive(Debug, Clone, PartialEq)]
pub struct Alias {
    pub name: String,
    pub kind: Kind,
    pub desc: Option<String>,
}

/// variable definition used in fields and params and returns of functions
#[derive(Debug, Clone, PartialEq)]
pub struct Var {
    pub name: Option<String>,
    pub kind: Kind,
    pub desc: Option<String>,
    // pub default: String,
    // pub range: String
}

/// function definition for methods, functions and lambdas
#[derive(Debug, Clone, PartialEq, Default)]
pub struct Function {
    pub name: Option<String>,
    pub params: Vec<Var>,
    pub returns: Vec<Var>,
    pub desc: Option<String>,
    // pub overloads: ?
}

/// enumeration attached to classes
/// self.desc contains a code block string with the values
#[derive(Debug, Clone, PartialEq)]
pub struct Enum {
    pub name: String,
    pub desc: String,
}

/// class definition, rendered as a doc page
#[derive(Debug, Clone, PartialEq)]
pub struct Class {
    pub name: String,
    pub fields: Vec<Var>,
    pub methods: Vec<Function>,
    pub enums: Vec<Enum>,
    pub constants: Vec<Var>,
    pub desc: String,
}

/// a wrapper for all top-level types coming from the json
#[derive(Debug, Clone, PartialEq)]
pub enum Def {
    Class(Class),
    Enum(Enum),
    Alias(Alias),
    Function(Function),
}

impl Var {
    pub fn is_constant(&self) -> bool {
        self.name
            .clone()
            .map(|name| name == name.to_uppercase())
            .unwrap_or(false)
    }
}

impl Function {
    pub fn strip_base(&self) -> Self {
        if let Some(name) = self.name.clone() {
            Self {
                name: Some(
                    Class::get_end(&name)
                        .map(|n| n.to_string())
                        .unwrap_or(self.name.clone().unwrap_or_default()),
                ),
                ..self.clone()
            }
        } else {
            self.clone()
        }
    }
}

impl Class {
    pub fn get_base(s: &str) -> Option<&str> {
        s.rfind('.').map(|pos| &s[..pos])
    }
    pub fn get_end(s: &str) -> Option<&str> {
        s.rfind('.').map(|pos| &s[pos + 1..])
    }
}

// ---------------------------------------- debug helpers to show types

impl LuaKind {
    pub fn show(&self) -> String {
        let s = serde_json::to_string(self).unwrap();
        s.trim_matches('"').to_string()
    }
}

impl Kind {
    pub fn has_unresolved(&self) -> bool {
        let s = format!("{}", self);
        s.contains("\x1b[33m")
    }
}

impl Var {
    pub fn has_unresolved(&self) -> bool {
        self.kind.has_unresolved()
    }
    pub fn show(&self) -> String {
        format!(
            "Var {} : {}",
            self.name.clone().unwrap_or_default(),
            self.kind
        )
    }
}

impl Enum {
    pub fn show(&self) -> String {
        format!("Enum {}", self.name)
    }
}

impl Function {
    pub fn has_unresolved(&self) -> bool {
        for p in &self.params {
            if p.has_unresolved() {
                return true;
            }
        }
        for r in &self.returns {
            if r.has_unresolved() {
                return true;
            }
        }
        false
    }
}

impl Alias {
    pub fn show(&self) -> String {
        format!("Alias {} {}", self.name, self.kind)
    }
}

impl fmt::Display for Kind {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::Unresolved(_) => write!(f, "\x1b[33m{:?}\x1b[0m", self),
            Self::Nullable(b) => write!(f, "Nullable({})", b.as_ref()),
            Self::Array(b) => write!(f, "Array({})", b.as_ref()),
            Self::Table(k, v) => write!(f, "Table({}, {})", k.as_ref(), v.as_ref()),
            Self::Enum(ks) => write!(
                f,
                "Enum({})",
                ks.iter()
                    .map(|k| format!("{}", k))
                    .collect::<Vec<String>>()
                    .join(", ")
            ),
            Self::Object(hm) => {
                write!(
                    f,
                    "Object({})",
                    hm.iter()
                        .map(|(k, v)| format!("{} : {}", k, v))
                        .collect::<Vec<String>>()
                        .join(", ")
                )
            }
            Self::Function(fun) => write!(f, "{}", fun),
            Self::Variadic(v) => write!(f, "Variadic({})", v.as_ref()),
            _ => write!(f, "{:?}", self),
        }
    }
}

impl fmt::Display for Var {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        if let Some(name) = self.name.clone() {
            write!(f, "{} : {}", name, self.kind)
        } else {
            write!(f, "{}", self.kind)
        }
    }
}

impl fmt::Display for Function {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let params = self
            .params
            .iter()
            .map(|p| format!("{}", p))
            .collect::<Vec<String>>()
            .join(", ");
        let returns = self
            .returns
            .iter()
            .map(|r| format!("{}", r))
            .collect::<Vec<String>>()
            .join(", ");
        write!(
            f,
            "Function {}({}){}",
            self.name.clone().unwrap_or_default(),
            params,
            if returns.is_empty() {
                String::default()
            } else {
                format!(" -> {}", returns)
            }
        )
    }
}

impl Class {
    pub fn has_unresolved(&self) -> bool {
        for v in &self.fields {
            if v.has_unresolved() {
                return true;
            }
        }
        for f in &self.methods {
            if f.has_unresolved() {
                return true;
            }
        }
        false
    }
    pub fn is_empty(&self) -> bool {
        self.fields.is_empty() && self.enums.is_empty() && self.methods.is_empty()
    }

    fn with_new_line(s: &str) -> String {
        if s.is_empty() {
            s.to_string()
        } else {
            format!("\n{}", s)
        }
    }
    pub fn show(&self) -> String {
        format!(
            "  Class {}{}{}{}",
            self.name,
            Self::with_new_line(
                &self
                    .enums
                    .iter()
                    .map(|e| format!("    {}", Enum::show(e)))
                    .collect::<Vec<String>>()
                    .join("\n")
            ),
            Self::with_new_line(
                &self
                    .fields
                    .iter()
                    .map(|v| format!("    {}", Var::show(v)))
                    .collect::<Vec<String>>()
                    .join("\n")
            ),
            Self::with_new_line(
                &self
                    .methods
                    .iter()
                    .map(|f| format!("    {}", f))
                    .collect::<Vec<String>>()
                    .join("\n")
            )
        )
    }
}

// impl Def {
//     pub fn show(&self) -> String {
//         match self {
//             Self::Alias(d) => d.show(),
//             Self::Function(d) => format!("{}", d),
//             Self::Class(d) => d.show(),
//             Self::Enum(e) => e.show(),
//         }
//     }
// }
