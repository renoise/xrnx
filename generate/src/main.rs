use luals_docs_gen::*;

fn main() -> Result<(), Error> {
    // run from the `generate` dir
    std::env::set_current_dir(env!("CARGO_MANIFEST_DIR"))?;
    // set option and generate...
    let options = Options {
        library: "../definitions/library".into(),
        output: "../docs".into(),
        excluded_classes: vec![],
        order: OutputOrder::ByClass,
        namespace: "renoise".into(),
    };
    generate_docs(&options)
}
