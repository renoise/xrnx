# renoise.Document.DocumentNode  
A document node is a sub component in a document which contains other
documents or observables.  

---  
## Functions
### `__init`([*self*](../../API/builtins/self.md)) {#__init}
Base constructor, only necessary to be called in your custom class constructor,
when inheriting from renoise.Document.DocumentNode.
### `add_properties`([*self*](../../API/builtins/self.md), properties : [`ObservableProperties`](#ObservableProperties)) {#add_properties}
Add a batch of properties in one go, similar to renoise.Document.create.
### `add_property`([*self*](../../API/builtins/self.md), name : [`string`](../../API/builtins/string.md), value : [`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md)) {#add_property}
`->`[`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md)  

Add a new property. Name must be unique: overwriting already existing
properties with the same name is not allowed and will fire an error.
If you want to replace a property, remove it first, then add it again.
### `from_string`([*self*](../../API/builtins/self.md), string : [`string`](../../API/builtins/string.md)) {#from_string}
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

Parse document tree from the given string data.
See renoise.Document.DocumentNode:load_from for details about how properties
are parsed and errors are handled.
### `has_property`([*self*](../../API/builtins/self.md), property_name : [`string`](../../API/builtins/string.md)) {#has_property}
`->`[`boolean`](../../API/builtins/boolean.md)  

Check if the given property exists.
### `load_from`([*self*](../../API/builtins/self.md), file_name : [`string`](../../API/builtins/string.md)) {#load_from}
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

Load the document tree from an XML file. This will NOT create new properties,
except for list items, but will only assign existing property values in the
document node with existing property values from the XML.
This means: nodes that only exist in the XML will silently be ignored.
Nodes that only exist in the document, will not be altered in any way.
The loaded document's type must match the document type that saved the XML
data.
A document's type is specified in the renoise.Document.create() function
as "model_name". For classes which inherit from renoise.Document.DocumentNode
it's the class name.
### `property`([*self*](../../API/builtins/self.md), property_name : [`string`](../../API/builtins/string.md)) {#property}
`->`[`DocumentMember`](#DocumentMember)[`?`](../../API/builtins/nil.md)  

Access a property by name. Returns the property, or nil when there is no
such property.
### `remove_property`([*self*](../../API/builtins/self.md), value : [`DocumentMember`](#DocumentMember)) {#remove_property}
Remove a previously added property. Property must exist.

In order to remove a value by it's key, use
`my_document:remove_property(my_document["some_member"])`
### `save_as`([*self*](../../API/builtins/self.md), file_name : [`string`](../../API/builtins/string.md)) {#save_as}
`->`success : [`boolean`](../../API/builtins/boolean.md), error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md)  

Save the whole document tree to an XML file. Overwrites all contents of the
file when it already exists.
### `to_string`([*self*](../../API/builtins/self.md)) {#to_string}
`->`[`string`](../../API/builtins/string.md)  

Serialize the whole document tree to a XML string.  



---  
## Aliases  
# alias DocumentMember {#DocumentMember}
[`renoise.Document.DocumentList`](../../API/renoise/renoise.Document.DocumentList.md) | [`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md) | [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) | [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)  
Track changes to document properties or general states by attaching listener
functions to it.  
  
# alias ObservableProperties {#ObservableProperties}
table<[`string`](../../API/builtins/string.md), [`ObservableTypes`](#ObservableTypes) | [`renoise.Document.DocumentList`](../../API/renoise/renoise.Document.DocumentList.md) | [`renoise.Document.DocumentNode`](../../API/renoise/renoise.Document.DocumentNode.md)>  
  
  
# alias ObservableTypes {#ObservableTypes}
[`boolean`](../../API/builtins/boolean.md) | [`string`](../../API/builtins/string.md) | [`number`](../../API/builtins/number.md) | [`boolean`](../../API/builtins/boolean.md)`[]` | [`number`](../../API/builtins/number.md)`[]` | [`string`](../../API/builtins/string.md)`[]`  
  
  

