# Anatomy of a tool

There are a few things that all tools must conform to for Renoise to successfully recognize and load them.

* A tool is either a folder or a zip file with the extension `.xrnx`
* It has a lua script named `main.lua` which contains the tool's program
* And a `manifest.xml` file that has version info, description and more

```sh
com.name_of_creator.name_of_tool.xrnx
├── manifest.xml
└── main.lua
```

> Note: You'll see that names of folders for most tools follow [reverse domain notation](https://en.wikipedia.org/wiki/Reverse_domain_name_notation), but don't worry, you don't have to actually own a domain to create and share your tools. Just use whatever nickname you want, just make sure it's not already taken by other devs to avoid confusion.

If needed, you can split your tool into multiple files and use the ["require" function](https://www.lua.org/pil/8.1.html) to load them inside your main script, but first you will be fine just using a single main script.

Some tools will also make use of other resources like icons, text files or audio samples, these should all be placed in the same folder (or any subfolders inside it).

Let's look at a basic tool to see what goes into these two files. You can find more elaborate examples by browsing the [examples directory here](../examples).

## Manifest

The manifest is a short [XML](https://www.w3schools.com/XML/xml_whatis.asp) file with the name `manifest.xml`. It contains a few tag pairs like `<Tag>...</Tag>` and some text between them, Renoise reads these and loads your tool based on the information it finds inside.

Here is an entire manifest file from our [HelloWorld](../guide/TODO.md#helloworld-folder) example

<!-- TODO copy data from the actual tool folder here -->
```xml
<?xml version="1.0" encoding="UTF-8"?>
<RenoiseScriptingTool doc_version="0">
  <ApiVersion>6</ApiVersion>
  <Id>com.renoise.HelloWorld</Id>
  <Version>1.0</Version>
  <Author>your name [your_email@address.com]</Author>
  <Name>Hello World</Name>
  <Category>Tool Development</Category>
  <Description>
    This tool is for printing "Hello World!" to the terminal when loaded.
  </Description>
  <Homepage>http://scripting.renoise.com</Homepage>
  <Icon>icon.png</Icon>
  <Platform>Windows, Mac, Linux</Platform>
</RenoiseScriptingTool>
```

Let's go through what each of these tags mean and what you should put inside them.
* `<?xml>` is the header for the XML file, this will stay the same across all tools
* `<RenoiseScriptionTool doc_version="0">` tells Renoise that this XML describes a tool, this won't change either
* `<ApiVersion>` is the version of the Renoise API your tool is using, this should be `6` for the latest version
* `<Id>` should match the folder name of your tool **exactly** without the `.xrnx` at the end
* `<Version>` is the version of your tool, whenever you release a new update you should increase this. It is best to follow standard [semantic versioning](https://semver.org/) conventions here.
* `<Author>` contains your name and contact information, whenever your tool crashes, this information is going to be provided for the user alongside the crash message, you should use some contact where you can accept possbile bug reports or questions
* `<Name>` the human readable name of your tool, it can be anything you want and you can change it anytime you feel like it
* `<Category>` the category for your tool, see the [categories you can choose from](../guide/TODO.md#tool-categories), this will be used to sort your tool on the [official Tools page](https://www.renoise.com/tools) if you ever decide to submit it there
* `<Description>` a short description of your tool which will be displayed inside the *Tool Browser* in Renoise and on the Tools page
* `<Homepage>` your website's address if you have any, you could also put your forum topic or git repository here if you want
* `<Icon>` the path to an optional icon to your tool
* `<Platform>` a list of platforms your tool supports, as long as you're only using the Renoise API, your tools will be automatically cross-platform, but once you do something OS specific you should communicate that here

## main.lua

Now that we have a manifest file, we can get to the exciting part of printing a message to the Renoise console. The contents of the `main.lua` file will just have a single line for now.

```lua
print("Hello world!")
```

Done! Now that you wrote your first tool you probably want to install and test it.