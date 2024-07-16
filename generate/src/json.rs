use crate::{error::Error, types::LuaKind};
use serde::{Deserialize, Deserializer, Serialize};
use std::{
    fmt, fs,
    path::{Path, PathBuf},
    process::Command,
};
use tempdir::TempDir;

pub struct JsonDoc {}
impl JsonDoc {
    /// Generate a list of definitions from a file
    pub fn get(path: &Path) -> Result<Vec<Definition>, Error> {
        let defs = Self::export(path)?;
        Ok(Self::strip(path, defs))
    }

    /// Export and parse the JSON docs from lua-language-server
    fn export(path: &Path) -> Result<Vec<Definition>, Error> {
        let tmp_dir = TempDir::new("docs")?;
        let tmp_path = tmp_dir.path();

        let output = Command::new("./lua-language-server/bin/lua-language-server")
            .arg("--doc")
            .arg(path)
            .arg("--doc_out_path")
            .arg(tmp_path)
            .arg("--logpath")
            .arg(tmp_path)
            .output()?;

        if !output.status.success() {
            Err(Error::Exec)
        } else {
            let json_doc_path = tmp_dir.path().join("doc.json");
            let json_doc = fs::read_to_string(json_doc_path)?;
            Ok(serde_json::from_str(&json_doc)?)
        }
    }

    fn file_matches(file: &str, path: &Path) -> bool {
        PathBuf::from(file)
            .file_name()
            .map(|p| p == path.file_name().unwrap_or_default())
            .unwrap_or_default()
    }

    /// Exclude standard lua
    fn strip(path: &Path, defs: Vec<Definition>) -> Vec<Definition> {
        defs.into_iter()
            .filter(|def| {
                def.defines
                    .iter()
                    .any(|define| Self::file_matches(&define.file, path))
            })
            .map(|d| {
                // remove standard define from the list of defines (for type())
                let mut def = d.clone();
                def.defines
                    .retain(|define| Self::file_matches(&define.file, path));
                def
            })
            .collect()
    }
}

#[derive(Debug, PartialEq, Serialize, Clone, Eq, PartialOrd, Ord, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum VisibleType {
    Public,
    Private,
    Package,
    Protected,
}

#[derive(Debug, Serialize, PartialEq, Deserialize, Clone, Eq, PartialOrd, Ord)]

pub enum Doc {
    #[serde(rename = "doc.field")]
    Field,
    #[serde(rename = "doc.enum")]
    Enum,
    #[serde(rename = "doc.alias")]
    Alias,
    #[serde(rename = "doc.class")]
    Class,
    #[serde(rename = "doc.extends.name")]
    ExtendsName,
    #[serde(rename = "doc.type")]
    Type,
    #[serde(rename = "doc.type.name")]
    TypeName,
    #[serde(rename = "doc.type.integer")]
    TypeInteger,
    #[serde(rename = "doc.type.number")]
    TypeNumber,
    #[serde(rename = "doc.type.array")]
    TypeArray,
    #[serde(rename = "doc.type.boolean")]
    TypeBoolean,
    #[serde(rename = "doc.type.string")]
    TypeString,
    #[serde(rename = "doc.type.table")]
    TypeTable,
    #[serde(rename = "doc.type.sign")]
    TypeSign,
    #[serde(rename = "doc.type.function")]
    TypeFunction,
}

#[derive(Debug, PartialEq, Serialize, Clone, Eq, PartialOrd, Ord)]
#[serde(rename_all = "lowercase")]
pub enum Type {
    Doc(Doc),
    // fields, defines
    SetField,
    SetMethod,
    // definitions
    Def,
    Variable,
    #[serde(rename = "luals.config")]
    LuaLsConfig,
    // defines
    TableField,
    SetGlobal,
    // extends
    Lua(LuaKind),
}

impl<'de> Deserialize<'de> for Type {
    fn deserialize<D>(deserializer: D) -> Result<Type, D::Error>
    where
        D: Deserializer<'de>,
    {
        let s: &str = Deserialize::deserialize(deserializer)?;
        match s {
            "type" => Ok(Type::Def),
            "variable" => Ok(Type::Variable),
            "setfield" => Ok(Type::SetField),
            "setmethod" => Ok(Type::SetMethod),
            "setglobal" => Ok(Type::SetGlobal),
            "tablefield" => Ok(Type::TableField),
            "luals.config" => Ok(Type::LuaLsConfig),
            _ => {
                let quoted = format!("\"{}\"", s);
                match serde_json::from_str::<LuaKind>(quoted.as_str()) {
                    Ok(lk) => Ok(Type::Lua(lk)),
                    Err(_) => match serde_json::from_str::<Doc>(quoted.as_str()) {
                        Ok(d) => Ok(Type::Doc(d)),
                        Err(_) => Err(serde::de::Error::unknown_variant(s, &[])),
                    },
                }
            }
        }
    }
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct Field {
    pub desc: Option<String>,
    pub rawdesc: Option<String>,
    pub name: String,
    #[serde(rename = "type")]
    pub lua_type: Type,
    pub file: String,
    pub visible: VisibleType,
    #[serde(default)]
    #[serde(deserialize_with = "deserialize_extends")]
    pub extends: Option<Extend>,
}

impl fmt::Display for Field {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{} : {:?}",
            self.name,
            self.lua_type,
            // self.extends.clone().map(|e| e.view).unwrap_or_default()
        )
    }
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct Definition {
    pub desc: Option<String>,
    pub rawdesc: Option<String>,
    pub name: String,
    #[serde(rename = "type")]
    pub lua_type: Type,
    pub defines: Vec<Define>,
    pub fields: Option<Vec<Field>>,
}

impl fmt::Display for Definition {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{} : {:?} d[{}] f[{}]{}{}",
            self.name,
            self.lua_type,
            self.defines.len(),
            self.fields.clone().map(|fs| fs.len()).unwrap_or(0),
            // "",
            if !self.defines.is_empty() {
                format!(
                    "\n{}",
                    self.defines
                        .iter()
                        .enumerate()
                        .map(|(i, d)| format!("    <{}> - {}", i, d))
                        .collect::<Vec<String>>()
                        .join("\n")
                )
            } else {
                String::from("")
            },
            if !self.fields.clone().unwrap_or_default().is_empty() {
                format!(
                    "\n{}",
                    self.fields
                        .clone()
                        .unwrap_or_default()
                        .iter()
                        .enumerate()
                        .map(|(i, f)| format!("    [{}] - {}", i, f))
                        .collect::<Vec<String>>()
                        .join("\n")
                )
            } else {
                String::from("")
            },
        )
    }
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct Define {
    #[serde(rename = "type")]
    pub lua_type: Type,
    pub file: String,
    #[serde(default)]
    #[serde(deserialize_with = "deserialize_extends")]
    pub extends: Option<Extend>,
}

impl fmt::Display for Define {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:?}", self.lua_type,)
    }
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct ExtendType {
    #[serde(rename = "type")]
    pub lua_type: Type,
    pub view: String,
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct Extend {
    #[serde(rename = "type")]
    pub lua_type: Type,
    pub types: Option<Vec<ExtendType>>,
    pub view: String,
    pub desc: Option<String>,
    pub rawdesc: Option<String>,
    /// Only present for functions (type = "function") with args
    pub args: Option<Vec<ArgDef>>,
    /// Only present for functions (type = "function") with returns
    pub returns: Option<Vec<ReturnDef>>,
}

/// Extends can be either null, an object or an array of objects
fn deserialize_extends<'de, D>(deserializer: D) -> Result<Option<Extend>, D::Error>
where
    D: Deserializer<'de>,
{
    #[derive(Deserialize, Debug)]
    #[serde(untagged)]
    enum ExtendInput {
        None(),
        Map(Extend),
        Array(Vec<Extend>),
    }

    impl From<ExtendInput> for Option<Extend> {
        fn from(input: ExtendInput) -> Self {
            match input {
                ExtendInput::None() => None,
                ExtendInput::Map(extend) => Some(extend),
                // there is only one possible extends per define in the renoise API
                ExtendInput::Array(vec) => vec.first().cloned(),
            }
        }
    }
    let input = ExtendInput::deserialize(deserializer)?;
    Ok(input.into())
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub enum ArgType {
    #[serde(rename = "self")]
    SelfArg,
    #[serde(rename = "local")]
    Local,
    #[serde(rename = "...")]
    Variadic,
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct ArgDef {
    pub name: Option<String>,
    #[serde(rename = "type")]
    pub lua_type: ArgType,
    pub view: String,
}

#[derive(Clone, Debug, Eq, PartialEq, PartialOrd, Ord, Serialize, Deserialize)]
pub struct ReturnDef {
    pub name: Option<String>,
    pub view: String,
    // the type for returns will always be "function.return" so we can skip parsing it
    // #[serde(rename = "type")]
    // pub lua_type: LuaType,
}

/*
TODO
UNHANDLED EXTEND doc.type -> "types" doc.type.function -> args -> name is an object
  {
    "defines": [
      {
        "extends": {
          "finish": 9500057,
          "start": 9500034,
          "type": "doc.type",
          "types": [
            {
              "args": [
                {
                  "finish": 9500056,
                  "name": {
                    "[1]": "value",
                    "finish": 9500043,
                    "start": 9500038,
                    "type": "doc.type.arg.name",
                    "view": "value"
                  },
                  "start": 9500038,
                  "type": "doc.type.arg",
                  "view": "{ x: number, y: number }"
                }
              ],
              "finish": 9500057,
              "returns": {
                "view": "unknown"
              },
              "start": 9500034,
              "type": "doc.type.function",
              "view": "fun(value: { x: number, y: number })"
            }
          ],
          "view": "fun(value: { x: number, y: number })"
        },
        "file": "file://library/renoise/view_builder.lua",
        "finish": 9500057,
        "start": 9500010,
        "type": "doc.alias"
      }
    ],
    "fields": [],
    "name": "XYValueNotifierFunction",
    "type": "type"
  },

 */
