## Documentation Development

### Requirements

The docs are generated using [mdBook](https://github.com/rust-lang/mdBook). To preview the pages locally you will need [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html) to install mdbook and mdbook-linkcheck (which is used to make sure there are no broken links in the book). 

```sh
cargo install mdbook
cargo install mdbook-linkcheck
```

### Building

Afterwards you can serve the docs at `localhost:3000` using mdbook, this will automatically refresh the browser tab whenever you change markdown files.

```sh
mdbook serve --open
```

### Generate API reference

See [generate/README.md](./generate/README.md)