# These are just commands: https://github.com/casey/just

default: docs-serve

install-mdbook:
    cargo binstall -y mdbook mdbook-linkcheck mdbook-toc mdbook-alerts

update-definitions:
    cd definitions && git checkout master

docs-generate-api:
    cargo run

docs-build: docs-generate-api
    mdbook build
    
docs-serve: docs-generate-api
    mdbook serve
