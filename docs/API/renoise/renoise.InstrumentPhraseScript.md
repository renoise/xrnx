# renoise.InstrumentPhraseScript<a name="renoise.InstrumentPhraseScript"></a>  

<!-- toc -->
  

---  
## Properties
### editor_visible : [`boolean`](../../API/builtins/boolean.md)<a name="editor_visible"></a>
> When false, a preview of the script is shown instead of a text editor.

### editor_visible_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="editor_visible_observable"></a>
> fired, when the editor visibility changed.

### parameters : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)[]<a name="parameters"></a>
>  **READ-ONLY** List of script input parameters, if any.

### parameters_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="parameters_observable"></a>
> fired, when the input parameter set changed.

### paragraphs : [`string`](../../API/builtins/string.md)[]<a name="paragraphs"></a>
> Script content. When changing paragraphs, changes are visible in the
> script editor, but are not applied for playback until they get committed.
> See also @function `commit` and @field `committed_observable`.

### paragraphs_observable : [`renoise.Document.DocumentList`](../../API/renoise/renoise.Document.DocumentList.md)<a name="paragraphs_observable"></a>
> Notifier which is called when a paragraph got added or removed.

### paragraphs_assignment_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="paragraphs_assignment_observable"></a>
> Notifier which is called when existing paragraph content changed.

### compile_error : [`string`](../../API/builtins/string.md)<a name="compile_error"></a>
> **READ-ONLY** When not empty, the script failed to compile.
> This error text is also visible to the user in the script preview.

### compile_error_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="compile_error_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### runtime_error : [`string`](../../API/builtins/string.md)<a name="runtime_error"></a>
> **READ-ONLY** When not empty, script compiled successfully, but caused an
> error while running. This error text is also visible to the user in the
> script editor.

### runtime_error_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="runtime_error_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### pending_changes : [`integer`](../../API/builtins/integer.md)<a name="pending_changes"></a>
> **READ-ONLY** Number of changes since the last commit() or auto-commit call,
> that have been applied to the parapgraphs.
> Note: `auto-commit` only is applied for scripts which are currently edited.

### pending_changes_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="pending_changes_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### committed_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="committed_observable"></a>
> Fired when script paragraph changes got committed: Either by an explicit
> `commit` call or via `auto-commit` in the editor when the script currently is
> edited. Script compile errors will be set or cleared *after* the observable
> fires as the commit & compilation happens asynchroniously in the player engine.

  

---  
## Functions
### parameter([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="parameter"></a>
`->`[`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md)  

> Access to a single input parameter by index. Use properties 'parameters'
> to iterate over all parameters and to query the parameter count.
### commit([*self*](../../API/builtins/self.md))<a name="commit"></a>
> Commit paragraph changes for playback.
### render_to_pattern([*self*](../../API/builtins/self.md), options : [`RenderScriptOptions`](#renderscriptoptions), rendering_done_callback : [`RenderingDoneCallback`](#RenderingDoneCallback))<a name="render_to_pattern"></a>
> Render script content with the given options to the phrase pattern.
> Only committed content will be rendered, so make sure to commit changes first.
> Parameter `rendering_done_callback` is called with the results:
>  * `error`: nil when the rendering succeeded, otherwise a string describing the error
>  * `rendered_events`: number of successfully rendered raw events (not pattern lines) or 0
>  * `skipped_events`: number of skipped raw events, in case the pattern couldn't fit all events, or 0
### render_to_clipboard([*self*](../../API/builtins/self.md), options : [`RenderScriptOptions`](#renderscriptoptions), rendering_done_callback : [`RenderingDoneCallback`](#RenderingDoneCallback))<a name="render_to_clipboard"></a>
> Same as `render_to_pattern`, but rendering into a temporary phrase object in the clipboard,
> which can then be pasted by the user somewhere.  



---  
## Structs  
# RenderScriptOptions<a name="RenderScriptOptions"></a>  
> Options for the render functions. All undefined properties will fall back to the
> user preferences values from the script preview  

---  
## Properties
### lpb : [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)<a name="lpb"></a>
> Lines per beat of the target phrase.

### max_events : [`number`](../../API/builtins/number.md)[`?`](../../API/builtins/nil.md)<a name="max_events"></a>
> Maximum events (not pattern lines) that will be rendered

  

  



---  
## Aliases  
### RenderingDoneCallback<a name="RenderingDoneCallback"></a>
(error : [`string`](../../API/builtins/string.md)[`?`](../../API/builtins/nil.md), rendered_events : [`integer`](../../API/builtins/integer.md), skipped_events : [`integer`](../../API/builtins/integer.md))  
  
  

