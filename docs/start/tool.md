# Anatomy of a tool

There are a few things that all tools must conform to for Renoise to successfully recognize and load them.

```sh
com.domain_of_developer.name_of_tool.xrnx
├── manifest.xml
├── main.lua
├── cover.png
├── thumbnail.png
├── LICENSE
└── README.md
```

A tool is a folder or a *zip file* with the extension `.xrnx`.

#### Required files:
* `main.lua` contains the tool's program.
* `manifest.xml` is an XML file which describes your tool.

#### Optional files:
* `cover.png` **600x350 px** is a large image, used on the tools page overview and on the pages of individual tools.
* `thumbnail.png` **120x45 px** is a small capsule image, used when tools are shown in a list on the tools website.
* `README.md` is a markdown-formatted file that the website will render on the tool's page.
* `LICENSE` is a raw text license file.

The paths to the cover, thumbnail, readme, and license files can be customized using the `...Path` tags in the manifest. See below for more info.


> [!NOTE] 
> You'll see that the names of tool folders (and `Id` field) follow [reverse domain notation](https://en.wikipedia.org/wiki/Reverse_domain_name_notation), but don't worry, you don't have to actually own a domain to create and share your tools. Just use whatever nickname you want, but make sure it's not already taken by other developers to avoid confusion.

If needed, you can split your tool into multiple files and use the ["require" function](https://www.lua.org/pil/8.1.html) to load them inside your main script, but to start with, you will be fine just using a single main script.

Some tools will also make use of other resources like bitmaps or audio samples; these should all be placed in the same folder (or any subfolders inside it).

Let's look at a basic tool to see what goes into these two files. You can find more elaborate examples by browsing the example tools.

## Manifest

The manifest is a short [XML](https://www.w3schools.com/XML/xml_whatis.asp) file with the name `manifest.xml`. It contains a few tag pairs like `<Tag>...</Tag>` and some text between them. Renoise reads these and loads your tool based on the information it finds within.

Here is an entire manifest file from a HelloWorld tool:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RenoiseScriptingTool doc_version="0">
  <!-- REQUIRED -->
  <Id>com.yourDomain.HelloWorld</Id>
  <ApiVersion>6.2</ApiVersion>
  <Version>1.02</Version>
  <Author>Your Name [your@email.com]</Author>
  <Name>Hello World</Name>
  <!-- OPTIONAL -->
  <Category>Development, Workflow</Category>
  <Description>
    This tool is for printing &quot;Hello World!&quot; to the terminal when loaded.
  </Description>
  <Platform>Windows, Mac, Linux</Platform>
  <License>MIT</License>
  <LicensePath>LICENSE.md</LicensePath>
  <ThumbnailPath>images/thumbnail.png</ThumbnailPath>
  <CoverPath>images/cover.png</CoverPath>
  <DocumentationPath>docs/README.md</DocumentationPath>
  <Homepage>https://some.url/my-tool</Homepage>
  <Documentation>https://some.url/my-tool-docs</Documentation>
  <Discussion>https://some.url/my-tool</Discussion>
  <Repository>https://git.some.url/my-tool</Repository>
  <Donate>https://some.url/donate</Donate>
</RenoiseScriptingTool>
```

Let's go through what each of these tags means and what you should put inside them.

`<?xml>` is the header for the XML file; this will stay the same across all tools.<br>
`<RenoiseScriptingTool>` tells Renoise that this XML describes a tool. Don't change this.<br>
`<!-- ... -->` is a XML comment, which will be ignored by Renoise.

### Required Properties

* `<Id>` Should match the folder name of your tool **exactly**, without the `.xrnx` at the end.
* `<ApiVersion>` The version of the Renoise API your tool is using. This should be `6.2` for the latest version.
* `<Version>` The version of your tool. Whenever you release a new update, you should increase the version. Note that this is a **number value** and not a semantic version. So `1.02` is a valid version, while `1.0.2` **is not**.
* `<Author>` Your name and contact information. Whenever your tool crashes, this information is going to be provided for the user alongside the crash message. You should provide a contact method where you can receive bug reports or questions.
* `<Name>` The human-readable name of your tool. It can be anything you want, and you can change it anytime you feel like it.

### Optional Properties

* `<Category>` One or more categories for your tool, separated via `,`, which will be used to categorize your tool on the [official Tools page](https://www.renoise.com/tools) if you ever decide to submit it there. See below for a valid list of categories.
* `<Description>` A short description of your tool which will be displayed inside the *Tool Browser* in Renoise and on the official Tools page.
* `<License>` The type of license, e.g., *MIT* or *AGPL*.
* `<LicensePath>` Relative path to the license file within the XRNX bundle.
* `<ThumbnailPath>` Relative path to the thumbnail icon file for the Tools page.
* `<CoverPath>` Relative path to the cover image file for the Tools page.
* `<DocumentationPath>` Relative path to a plain text or markdown documentation file.
* `<Homepage>` The URL of your tool's homepage.
* `<Discussion>` The URL of your tool's discussion page, e.g., on the Renoise forums.
* `<Repository>` The URL of your tool's source code repository.
* `<Donate>` A URL to a website where donations can be made to support your tool.
* `<Documentation>` A URL to a website where your tool's documentation can be viewed.

#### Tool Categories
Valid categories are: `Analysis`,`Automation`,`Bridge`,`Coding`,`Control`,`Development`,`DSP`,`Editing`,`Export`,`Game`,`Generator`,`Hardware`,`Import`,`Instrument`,`Integration`,`Live`,`MIDI`,`Mixing`,`Modulation`,`Networking`,`OSC`,`Pattern`,`Phrase`,`Plugin`,`Recording`,`Rendering`,`Sample`,`Sequencer`,`Slicing`,`Tuning`,`Workflow`

#### XML Text Encoding

When writing the XML file in a regular text editor, ensure that text content is encoded correctly. Otherwise, the XML file will be invalid.

- `"` ->  `&quot;`
- `'` ->  `&apos;`
- `<` ->  `&lt;`
- `>` ->  `&gt;`
- `&` ->  `&amp;`

## main.lua

Now that we have a manifest file, we can get to the exciting part of printing a message to the Renoise console. The contents of the `main.lua` file will just have a single line for now:

```lua
print("Hello world!")
```

Done! Now that you have written your first tool, you probably want to install and test it.
