<img src="https://www.renoise.com/sites/default/files/renoise_logo_0.png" alt="Renoise" height="100"/>

# Renoise Scripting Docs

This repository contains the documentation for tool scripting in Renoise.

You can read the docs at [https://renoise.github.io/xrnx](https://renoise.github.io/xrnx) or by browsing the `docs` directory here.

## Development

### Install mdBook

The docs are generated using [mdBook](https://github.com/rust-lang/mdBook). To preview the pages locally you will need [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html) to install mdbook and mdbook-linkcheck (which is used to make sure there are no broken links in the book). 

```sh
cargo install mdbook
cargo install mdbook-linkcheck
```
### Generate API reference

There is a dirty [build script](generate/build.sh) that will download a given lua-language-server version from github, patch the necessary files so the doc output is somewhat usable and then run the API generator.

```sh
cd xrnx
./generate/build.sh "3.9.3"
```

Afterwards you can serve the docs at `localhost:3000` using mdbook, this will automatically refresh the browser tab whenever you change markdown files.

```sh
mdbook serve --open
```

# Acknowledgements

Thanks to Matt Allan and his [mdbook-luacats repo](https://github.com/matt-allan/) that served as a starting point for the API generation.
