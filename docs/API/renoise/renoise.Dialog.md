# renoise.Dialog<a name="renoise.Dialog"></a>  
> A custom dialog created via the scripting API. Dialogs can be created
> via `renoise.app():show_custom_dialog`.
> 
> See `create custom views` on top of the renoise.ViewBuilder docs on how to
> create views for the dialog.  

<!-- toc -->
  

---  
## Properties
### visible : [`boolean`](../../API/builtins/boolean.md)<a name="visible"></a>
>  **READ-ONLY** Check if a dialog is alive and visible.

### focused : [`boolean`](../../API/builtins/boolean.md)<a name="focused"></a>
>  **READ-ONLY** Check if a dialog is visible and is the key window.

  

---  
## Functions
### show([*self*](../../API/builtins/self.md))<a name="show"></a>
>  Bring an already visible dialog to front and make it the key window.
### close([*self*](../../API/builtins/self.md))<a name="close"></a>
>  Close a visible dialog.  

