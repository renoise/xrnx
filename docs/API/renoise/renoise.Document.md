# renoise.Document  
renoise.Document classes are wrappers for Renoise's internal document
classes.

**Please note**: the Lua wrappers are not really "the Lua way" of solving and
expressing things. e.g: there's no support for mixed types in lists, tuples
at the moment.

Documents can be serialized from/to XML, just like Renoise's internal
document and are observable.

An empty document (node) object can be created via
```renoise.Document.create("MyDoc"){}```

Such document objects can then be extended with the document's
`add_property` function. Existing properties can also be removed again with the
`remove_property` function.

### example:
```lua
-- Creates an empty document, using "MyDoc" as the model name (a type name)
local my_document = renoise.Document.create("MyDoc"){ }
-- adds a number to the document with the initial value 1
my_document:add_property("value1", 1)
-- adds a string
my_document:add_property("value2", "bla")
-- create another document and adds it
local node = renoise.Document.create("MySubDoc"){ }
node:add_property("another_value", 1)
-- add another already existing node
my_document:add_property("nested_node", node)
-- removes a previously added node
my_document:remove_property(node)
-- access properties
local value1 = my_document.value1
value1 = my_document:property("value1")
```
As an alternative to `renoise.Document.create`, you can also inherit from
renoise.Document.DocumentNode in order to create your own document classes.
This is especially recommended when dealing with more complex docs, because
you can also use additional methods to deal with your properties, the data.

### example:
```lua
class "MyDocument" (renoise.Document.DocumentNode)
  function MyDocument:__init()
    -- important! call super first
    renoise.Document.DocumentNode.__init(self)
    -- add properties to construct the document model
    self:add_property("age", 1)
    self:add_property("name", renoise.Document.ObservableString("value"))
    -- other doc renoise.Document.DocumentNode object
    self:add_property("sub_node", MySubNode())
    -- list of renoise.Document.DocumentNode objects
    self:add_property("doc_list", renoise.Document.DocumentList())
    -- or the create() way:
    self:add_properties {
      something = "else"
    }
  end
```
Instantiating such custom document objects can then be done by simply
calling the constructor:
```lua
my_document = MyDocument()
-- do something with my_document, load/save, add/remove more properties
```  

---  
## Functions
### `create`(model_name : [`string`](/API/builtins/string.md)) {#create}
`->`(properties : [`ObservableProperties`](#ObservableProperties)) `->` [`renoise.Document.DocumentNode`](/API/renoise/renoise.Document.DocumentNode.md)  

Create an empty DocumentNode or a DocumentNode that is modeled after the
passed key value table. "model_name" will be used to identify the documents
type when loading/saving. It also allows you to instantiate new document
objects (see renoise.Document.instantiate).

### example:
```lua
my_document = renoise.Document.create("MyDoc") {
  age = 1,
  name = "bla", -- implicitly specify a property type
  is_valid = renoise.Document.ObservableBoolean(false), -- or explicitly
  age_list = {1, 2, 3},
  another_list = renoise.Document.ObservableNumberList(),
  sub_node = {
    sub_value1 = 2,
    sub_value2 = "bla2"
  }
}
```
This will create a document node which is !modeled! after the the passed table.
The table is not used internally by the document after construction, and will
only be referenced to construct new instances. Also note that you need to assign
values for all passed table properties in order to automatically determine it's
type, or specify the types explicitly -> renoise.Document.ObservableXXX().

The passed name ("MyDoc" in the example above) is used to identify the document
when loading/saving it (loading a XML file which was saved with a different
model will fail) and to generally specify the "type".

Additionally, once "create" is called, you can use the specified model name to
create new instances.

### example:
```lua
-- create a new instance of "MyDoc"
my_other_document = renoise.Document.instantiate("MyDoc")
```
### `instantiate`(model_name : [`string`](/API/builtins/string.md)) {#instantiate}
`->`[`renoise.Document.DocumentNode`](/API/renoise/renoise.Document.DocumentNode.md)  

Create a new instance of the given document model. Given `model_name` must
have been registered with `renoise.Document.create` before.  



---  
## Aliases  
# alias ObservableProperties {#ObservableProperties}
table<[`string`](/API/builtins/string.md), [`ObservableTypes`](#ObservableTypes) | [`renoise.Document.DocumentList`](/API/renoise/renoise.Document.DocumentList.md) | [`renoise.Document.DocumentNode`](/API/renoise/renoise.Document.DocumentNode.md)>  
  
  
# alias ObservableTypes {#ObservableTypes}
[`boolean`](/API/builtins/boolean.md) | [`string`](/API/builtins/string.md) | [`number`](/API/builtins/number.md) | [`boolean`](/API/builtins/boolean.md)`[]` | [`number`](/API/builtins/number.md)`[]` | [`string`](/API/builtins/string.md)`[]`  
  
  

