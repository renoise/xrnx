# renoise  
Holds all renoise related API functions and classes.  

---  
## Properties
### API_VERSION : [`number`](../API/builtins/number.md) {#API_VERSION}
Currently 6.1. Any changes in the API which are not backwards compatible,
will increase the internal API's major version number (e.g. from 1.4 -> 2.0).
All other backwards compatible changes, like new functionality, new functions
and classes which do not break existing scripts, will increase only the minor
version number (e.g. 1.0 -> 1.1).

### RENOISE_VERSION : [`string`](../API/builtins/string.md) {#RENOISE_VERSION}
Renoise Version "Major.Minor.Revision[AlphaBetaRcVersion][Demo]"

  

---  
## Functions
### `ViewBuilder()` {#ViewBuilder}
`->`[`renoise.ViewBuilder`](../API/renoise/renoise.ViewBuilder.md)  

Construct a new viewbuilder instance you can use to create views.
### `app()` {#app}
`->`[`renoise.Application`](../API/renoise/renoise.Application.md)  

Global access to the Renoise Application.
### `song()` {#song}
`->`[`renoise.Song`](../API/renoise/renoise.Song.md)[`?`](../API/builtins/nil.md)  

Global access to the Renoise Song.

NB: The song instance changes when a new song is loaded or created in Renoise,
so tools can not memorize the song instance globally once, but must instead
react on the application's `new_document_observable`
observable.
### `tool()` {#tool}
`->`[`renoise.ScriptingTool`](../API/renoise/renoise.ScriptingTool.md)  

Global access to the Renoise Scripting Tool (your XRNX tool).

This is only valid when getting called from a tool and not when e.g. using the
scripting terminal and editor in Renoise.  

