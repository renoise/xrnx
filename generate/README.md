# Renoise API Documentation Generator

This is a rust app that generates the API definition chapters in the [Renoise XRNX book](https://renoise.github.io/xrnx/) from the [Renoise API definition](https://github.com/renoise/definitions) files.

It is based on [matt-allan's](https://github.com/matt-allan) [mdbook-luacat](https://github.com/matt-allan/mdbook-luacats)  tool.


## Building 

### Requirements

- [rust](https://www.rust-lang.org/tools/install) v1.56 or higher
- [LuaLS](https://github.com/luals/lua-language-server) installation

> [!NOTE]
> The LuaLS installation must be placed into the folder [./lua-language-server](./lua-language-server) folder and **must be patched**. 

See [build.sh](./build.sh) for details.

### Building

To create or update the API definitions chapter, build and run the app, then build the book:

```bash
# in the XRNX root directory
cd XRNX 
# build and run the generate app to create the API definition
cargo run -- ./definitions/library ./docs 
# serve or build the book
mdbook serve 
```

---

Alternatively, if you have vscode installed, open the XRNX repository folder and use the provided build task to build the API and the book:

- `build: API Docs`: compiles and runs the API docs generator
- `build: book`: compiles the mdbook
- `serve: book`: serve and live update the book at //localhost:3000 


## Debugging

If you have vscode installed, open the XRNX root repository folder in vscode and use the `Debug: 'Generate API'` launch action.

By default, this will not use the full Renoise API definitions, but only a small test definition located in [test/definitions/](./test/definitions/)  

To debug and build the full API definition, change the launch arguments in the file [.vscode/launch.json](../.vscode/launch.json).
