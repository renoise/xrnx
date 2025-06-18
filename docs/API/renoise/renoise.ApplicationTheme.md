# renoise.ApplicationTheme<a name="renoise.ApplicationTheme"></a>  
> Application's theme colors and other general color theme properties.
> 
> Note: All properties and functions of the app theme are **read-only**, so the 
> theme can't be modified here. Use the app's `renoise.Application:load_theme`
> function to load and apply new themes instead.
> 
> Accessing colors and theme properties can be useful in custom viewbuilder
> widgets.  

<!-- toc -->
  

---  
## Properties
### colors : { [ThemeColor]: RGBColor }<a name="colors"></a>
> **READ-ONLY** Get all theme colors in a flat list of RGBColors. 
> Color table keys are string identifiers as used in the theme XML file,
> but in lower case.
> 
> Note that if you only need to access a single color from the theme, 
> use `renoise.app().theme.color(color_name)` instead.
> 
> To get notified of color changes, use `renoise.app().theme_observable`

### knob_shade : [`number`](../../API/builtins/number.md)<a name="knob_shade"></a>
> **READ-ONLY** Get theme's knob shade setting. Range: (1 - 2)

### knob_shade_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="knob_shade_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### body_shade : [`number`](../../API/builtins/number.md)<a name="body_shade"></a>
> **READ-ONLY** Get theme's body shade setting. Range: (1 - 2)

### body_shade_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="body_shade_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### contrast : [`number`](../../API/builtins/number.md)<a name="contrast"></a>
> **READ-ONLY** Get theme's contrast setting. Range: (-0.5 - 0.5)

### contrast_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="contrast_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### texture_set : [`string`](../../API/builtins/string.md)<a name="texture_set"></a>
> **READ-ONLY** Get theme's texture set name

### texture_set_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="texture_set_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### color([*self*](../../API/builtins/self.md), color_name : [`ThemeColor`](#ThemeColor))<a name="color"></a>
`->`[`RGBColor`](#RGBColor)  

> Get a single color from the theme using a color identifier as used 
> in the theme XML file - but in lower case.
> 
> e.g. to access the button background color from the theme, use 
> `renoise.app().theme.color("button_back")` 
> 
> To get notified of color changes, use `renoise.app().theme_observable`
> 
> ```lua
> -- The application theme's colors
> color_name:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  



---  
## Aliases  
### RGBColor<a name="RGBColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md) }  
> A table of 3 bytes (ranging from 0 to 255)
> representing the red, green and blue channels of a color.
> {0xFF, 0xFF, 0xFF} is white
> {165, 73, 35} is the red from the Renoise logo  
  
### ThemeColor<a name="ThemeColor"></a>
`"alternate_main_back"` | `"alternate_main_font"` | `"automation_grid"` | `"automation_line_edge"` | `"automation_line_fill"` | `"automation_marker_diamond"` | `"automation_marker_pair"` | `"automation_marker_play"` | `"automation_marker_single"` | `"automation_point"` | `"body_back"` | `"body_font"` | `"button_back"` | `"button_font"` | `"button_highlight_font"` | `"default_color_01"` | `"default_color_02"` | `"default_color_03"` | `"default_color_04"` | `"default_color_05"` | `"default_color_06"` | `"default_color_07"` | `"default_color_08"` | `"default_color_09"` | `"default_color_10"` | `"default_color_11"` | `"default_color_12"` | `"default_color_13"` | `"default_color_14"` | `"default_color_15"` | `"default_color_16"` | `"folder"` | `"main_back"` | `"main_font"` | `"midi_mapping_back"` | `"midi_mapping_font"` | `"pattern_centerbar_back"` | `"pattern_centerbar_back_standby"` | `"pattern_centerbar_font"` | `"pattern_centerbar_font_standby"` | `"pattern_default_back"` | `"pattern_default_font"` | `"pattern_default_font_delay"` | `"pattern_default_font_dspfx"` | `"pattern_default_font_global"` | `"pattern_default_font_other"` | `"pattern_default_font_panning"` | `"pattern_default_font_pitch"` | `"pattern_default_font_unused"` | `"pattern_default_font_volume"` | `"pattern_highlighted_back"` | `"pattern_highlighted_font"` | `"pattern_highlighted_font_delay"` | `"pattern_highlighted_font_dspfx"` | `"pattern_highlighted_font_global"` | `"pattern_highlighted_font_other"` | `"pattern_highlighted_font_panning"` | `"pattern_highlighted_font_pitch"` | `"pattern_highlighted_font_unused"` | `"pattern_highlighted_font_volume"` | `"pattern_mute_state"` | `"pattern_playposition_back"` | `"pattern_playposition_font"` | `"pattern_selection"` | `"pattern_standby_selection"` | `"scrollbar"` | `"selected_button_back"` | `"selected_button_font"` | `"selection_back"` | `"selection_font"` | `"slider"` | `"standby_selection_back"` | `"standby_selection_font"` | `"strong_body_font"` | `"tooltip_back"` | `"tooltip_font"` | `"valuebox_back"` | `"valuebox_font"` | `"valuebox_font_icons"` | `"vumeter_back_clipped"` | `"vumeter_back_normal"` | `"vumeter_meter"` | `"vumeter_meter_high"` | `"vumeter_meter_low"` | `"vumeter_meter_middle"` | `"vumeter_peak"`  
> ```lua
> -- The application theme's colors
> ThemeColor:
>     | "main_back"
>     | "main_font"
>     | "alternate_main_back"
>     | "alternate_main_font"
>     | "body_back"
>     | "body_font"
>     | "strong_body_font"
>     | "button_back"
>     | "button_font"
>     | "button_highlight_font"
>     | "selected_button_back"
>     | "selected_button_font"
>     | "selection_back"
>     | "selection_font"
>     | "standby_selection_back"
>     | "standby_selection_font"
>     | "midi_mapping_back"
>     | "midi_mapping_font"
>     | "tooltip_back"
>     | "tooltip_font"
>     | "valuebox_back"
>     | "valuebox_font"
>     | "valuebox_font_icons"
>     | "scrollbar"
>     | "slider"
>     | "folder"
>     | "pattern_default_back"
>     | "pattern_default_font"
>     | "pattern_default_font_volume"
>     | "pattern_default_font_panning"
>     | "pattern_default_font_pitch"
>     | "pattern_default_font_delay"
>     | "pattern_default_font_global"
>     | "pattern_default_font_other"
>     | "pattern_default_font_dspfx"
>     | "pattern_default_font_unused"
>     | "pattern_highlighted_back"
>     | "pattern_highlighted_font"
>     | "pattern_highlighted_font_volume"
>     | "pattern_highlighted_font_panning"
>     | "pattern_highlighted_font_pitch"
>     | "pattern_highlighted_font_delay"
>     | "pattern_highlighted_font_global"
>     | "pattern_highlighted_font_other"
>     | "pattern_highlighted_font_dspfx"
>     | "pattern_highlighted_font_unused"
>     | "pattern_playposition_back"
>     | "pattern_playposition_font"
>     | "pattern_centerbar_back"
>     | "pattern_centerbar_font"
>     | "pattern_centerbar_back_standby"
>     | "pattern_centerbar_font_standby"
>     | "pattern_selection"
>     | "pattern_standby_selection"
>     | "pattern_mute_state"
>     | "automation_grid"
>     | "automation_line_edge"
>     | "automation_line_fill"
>     | "automation_point"
>     | "automation_marker_play"
>     | "automation_marker_single"
>     | "automation_marker_pair"
>     | "automation_marker_diamond"
>     | "vumeter_meter"
>     | "vumeter_meter_low"
>     | "vumeter_meter_middle"
>     | "vumeter_meter_high"
>     | "vumeter_peak"
>     | "vumeter_back_normal"
>     | "vumeter_back_clipped"
>     | "default_color_01"
>     | "default_color_02"
>     | "default_color_03"
>     | "default_color_04"
>     | "default_color_05"
>     | "default_color_06"
>     | "default_color_07"
>     | "default_color_08"
>     | "default_color_09"
>     | "default_color_10"
>     | "default_color_11"
>     | "default_color_12"
>     | "default_color_13"
>     | "default_color_14"
>     | "default_color_15"
>     | "default_color_16"
> ```  
  

