use crate::error::Error;
use std::{fs, path::PathBuf};

/// helper to crawl directories and collect lua files
#[derive(Debug, Clone)]
pub enum Source {
    File(PathBuf),
    Folder(Vec<Source>),
}

impl Source {
    /// recursively crawl a path to build a source tree with folders and files
    pub fn from_path(path: PathBuf) -> Result<Option<Source>, Error> {
        if path.is_dir() {
            let sources: Vec<Source> = fs::read_dir(&path)?
                .filter_map(|entry| {
                    entry
                        .map_err(Error::Io)
                        .and_then(|e| Self::from_path(e.path()))
                        .ok()
                })
                .flatten()
                .collect();
            if sources.is_empty() {
                Ok(None)
            } else {
                Ok(Some(Source::Folder(sources)))
            }
        } else {
            path.clone().extension().map_or(Ok(None), |ext| {
                Ok(if ext == "lua" {
                    Some(Source::File(path))
                } else {
                    None
                })
            })
        }
    }

    /// flatten the source tree into a list of file paths
    pub fn file_paths(&self, paths: Vec<PathBuf>) -> Vec<PathBuf> {
        match self {
            Self::File(path) => [paths, vec![path.clone()]].concat(),
            Self::Folder(sources) => sources.iter().fold(paths, |a, s| s.file_paths(a)),
        }
    }
}
