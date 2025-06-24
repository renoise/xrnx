# renoise.Views.Canvas.Context<a name="renoise.Views.Canvas.Context"></a>  
> Drawing context for a canvas view.<br>
> 
> The context is *similar* to the HTML5 canvas 2d drawing context, with the
> following differences and limitations:
> 
> * no text drawing: layer a renoise.Views.Text on top of this view instead.
> * no image and pattern drawing: layer a renoise.Views.Bitmap on top of this
>   view, if you need to draw bitmaps in the canvas.
> * no shadow rendering: that would be awful slow
> * colors can be specified as strings or rgba tables in range [0-255]. when
>   specifying strings, only renoise theme colors are supported (e.g. "button_back").
> * to create gradients use the available `start_XXX` gradient functions
>   instead of creating gradient objects.
> * to set a new fill or stroke color, use the `fill_color` and `stroke_color`
>   properties instead of `fill/strokeStyle`
> 
> This canvas implementation is based on 'canvas_ity' by Andrew Kensler
> https://github.com/a-e-k/canvas_ity
> 
>  [HTML5 Canvas Documentation](https://www.w3schools.com/tags/ref_canvas.asp)  

<!-- toc -->
  

---  
## Properties
### pixel_size : { height : [`integer`](../../API/builtins/integer.md), width : [`integer`](../../API/builtins/integer.md) }<a name="pixel_size"></a>
> **READ_ONLY** Size of the render context backend **in raw pixel resolution**.
> This is the view ports size, multiplied with the global UI scaling factor.
> It does not change with transformations.

### size : { height : [`integer`](../../API/builtins/integer.md), width : [`integer`](../../API/builtins/integer.md) }<a name="size"></a>
> **READ_ONLY** Size of the render context **with transformations applied**.
> This initially will be the view's size. Calls to `transform` or `scale`
> may change the size further.

### global_alpha : [`number`](../../API/builtins/number.md)<a name="global_alpha"></a>
> The degree of opacity applied to all drawing operations.<br>
> 
> If an operation already uses a transparent color, this can make it
> yet more transparent. It must be in the range from 0 for fully transparent
> to 255 for fully opaque. Defaults to 255 (opaque).

### global_composite_operation : `"source_atop"` | `"source_copy"` | `"source_in"` | `"source_out"` | `"source_over"` | `"destination_atop"` | `"destination_in"` | `"destination_out"` | `"destination_over"` | `"exclusive_or"` | `"lighter"`<a name="global_composite_operation"></a>
> Compositing operation for blending new drawing and old pixels.<br>
> 
> The source_copy, source_in, source_out, destination_atop, and
> destination_in operations may clear parts of the canvas outside the
> new drawing but within the clip region. Defaults to "source_over".

### fill_color : [`RGBColor`](#RGBColor) | [`RGBAColor`](#RGBAColor) | [`ThemeColor`](#ThemeColor)<a name="fill_color"></a>
> Set filling to use a constant color and opacity.<br>
> 
> Defaults a constant color with 0,0,0,255 (opaque black).

### stroke_color : [`RGBColor`](#RGBColor) | [`RGBAColor`](#RGBAColor) | [`ThemeColor`](#ThemeColor)<a name="stroke_color"></a>
> Set stroking to use a constant color and opacity.<br>
> 
> Defaults a constant color with 0,0,0,255 (opaque black).

### line_cap : `"butt"` | `"square"` | `"circle"`<a name="line_cap"></a>
> Cap style for the ends of open subpaths and dash segments.<br>
> 
> The actual shape may be affected by the current transform at the time
> of drawing. Only affects stroking.  Defaults to "butt".

### line_join : `"miter"` | `"bevel"` | `"rounded"`<a name="line_join"></a>
> Join style for connecting lines within the paths.<br>
> 
> The actual shape may be affected by the current transform at the time
> of drawing. Only affects stroking. Defaults to "miter".

### line_width : [`number`](../../API/builtins/number.md)<a name="line_width"></a>
> The width of the lines when stroking.<br>
> 
> Initially this is measured in pixels, though the current transform
> at the time of drawing can affect this. Must be positive. Defaults to 1.0.

### miter_limit : [`number`](../../API/builtins/number.md)<a name="miter_limit"></a>
> Limit on maximum pointiness allowed for miter joins.<br>
> 
> If the distance from the point where the lines intersect to the
> point where the outside edges of the join intersect exceeds this
> ratio relative to the line width, then a bevel join will be used
> instead, and the miter will be lopped off. Larger values allow
> pointier miters. Only affects stroking and only when the line join
> style is miter. Defaults to 10.0.

### line_dash_offset : [`number`](../../API/builtins/number.md)<a name="line_dash_offset"></a>
> Offset where each subpath starts the dash pattern.<br>
> 
> Changing this shifts the location of the dashes along the path and
> animating it will produce a marching ants effect. Only affects
> stroking and only when a dash pattern is set. May be negative or
> exceed the length of the dash pattern, in which case it will wrap.
> Defaults to 0.0.

  

---  
## Functions
### clip([*self*](../../API/builtins/self.md))<a name="clip"></a>
> Restrict the clip region by the current path.<br>
> 
> Intersects the current clip region with the interior of the current
> path (the region that would be filled), and replaces the current
> clip region with this intersection. Subsequent calls to clip can
> only reduce this further. When filling or stroking, only pixels
> within the current clip region will change. The current path is
> left unchanged by updating the clip region; begin a new path to
> clear it. Defaults to the entire canvas.
> 
> Tip: to be able to reset the current clip region, save the canvas
> state first before clipping then restore the state to reset it.
### save([*self*](../../API/builtins/self.md))<a name="save"></a>
> Save the current state as though to a stack.<br>
> 
> The full state of the canvas is saved, except for the pixels in the
> canvas buffer, and the current path.
> 
> Tip: to be able to reset the current clip region, save the canvas
> state first before clipping then restore the state to reset it.
### restore([*self*](../../API/builtins/self.md))<a name="restore"></a>
> Restore a previously saved state as though from a stack.<br>
> 
> This does not affect the pixels in the canvas buffer or the current
> path.  If the stack of canvas states is empty, this does nothing.
### fill_rect([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md), width : [`number`](../../API/builtins/number.md), height : [`number`](../../API/builtins/number.md))<a name="fill_rect"></a>
> Fill a rectangular area.<br>
> 
> This behaves as though the current path were reset to a single
> rectangle and then filled as usual. However, the current path is
> not actually changed. The current transform at the time that this is
> called will affect the given point and rectangle. The width and/or
> the height may be negative but not zero. If either is zero, or the
> current transform is not invertible, this does nothing.
### stroke_rect([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md), width : [`number`](../../API/builtins/number.md), height : [`number`](../../API/builtins/number.md))<a name="stroke_rect"></a>
> Stroke a rectangular area.<br>
> 
> This behaves as though the current path were reset to a single
> rectangle and then stroked as usual. However, the current path is
> not actually changed. The current transform at the time that this
> is called will affect the given point and rectangle. The width
> and/or the height may be negative or zero. If both are zero, or
> the current transform is not invertible, this does nothing. If only
> one is zero, this behaves as though it strokes a single horizontal or
> vertical line.
### clear_rect([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md), width : [`number`](../../API/builtins/number.md), height : [`number`](../../API/builtins/number.md))<a name="clear_rect"></a>
> Clear a rectangular area back to transparent black.<br>
> 
> The clip region may limit the area cleared. The current path is not
> affected by this clearing. The current transform at the time that
> this is called will affect the given point and rectangle. The width
> and/or the height may be negative or zero. If either is zero, or the
> current transform is not invertible, this does nothing.
### begin_path([*self*](../../API/builtins/self.md))<a name="begin_path"></a>
> Reset the current path.<br>
> 
> The current path and all subpaths will be cleared after this, and a
> new path can be built.
### close_path([*self*](../../API/builtins/self.md))<a name="close_path"></a>
> Close the current subpath.<br>
> 
> Adds a straight line from the end of the current subpath back to its
> first point and marks the subpath as closed so that this line will
> join with the beginning of the path at this point. A new, empty
> subpath will be started beginning with the same first point.  If the
> current path is empty, this does nothing.
### move_to([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md))<a name="move_to"></a>
> Create a new subpath.<br>
> 
> The given point will become the first point of the new subpath and
> is subject to the current transform at the time this is called.
### line_to([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md))<a name="line_to"></a>
> Extend the current subpath with a straight line.<br>
> 
> The line will go from the current end point (if the current path is
> not empty) to the given point, which will become the new end point.
> Its position is affected by the current transform at the time that
> this is called. If the current path was empty, this is equivalent
> to just a move.
### fill([*self*](../../API/builtins/self.md))<a name="fill"></a>
> Draw the interior of the current path using the fill style.<br>
> 
> Interior pixels are determined by the non-zero winding rule, with
> all open subpaths implicitly closed by a straight line beforehand.
> If shadows have been enabled by setting the shadow color with any
> opacity and either offsetting or blurring the shadows, then the
> shadows of the filled areas will be drawn first, followed by the
> filled areas themselves. Both will be blended into the canvas
> according to the global alpha, the global compositing operation,
> and the clip region. If the fill style is a gradient or a pattern,
> it will be affected by the current transform. The current path is
> left unchanged by filling; begin a new path to clear it. If the
> current transform is not invertible, this does nothing.
### stroke([*self*](../../API/builtins/self.md))<a name="stroke"></a>
> Draw the edges of the current path using the stroke style.<br>
> 
> Edges of the path will be expanded into strokes according to the
> current dash pattern, dash offset, line width, line join style
> (and possibly miter limit), line cap, and transform. If shadows
> have been enabled by setting the shadow color with any opacity and
> either offsetting or blurring the shadows, then the shadow will be
> drawn for the stroked lines first, then the stroked lines themselves.
> Both will be blended into the canvas according to the global alpha,
> the global compositing operation, and the clip region. If the stroke
> style is a gradient or a pattern, it will be affected by the current
> transform.  The current path is left unchanged by stroking; begin a
> new path to clear it. If the current transform is not invertible,
> this does nothing.
> 
> Tip: to draw with a calligraphy-like angled brush effect, add a
>      non-uniform scale transform just before stroking.
### set_line_dash([*self*](../../API/builtins/self.md), segments : [`number`](../../API/builtins/number.md)[])<a name="set_line_dash"></a>
> Set or clear the line dash pattern.<br>
> 
> Takes an array with entries alternately giving the lengths of dash
> and gap segments. All must be non-negative; if any are not, this
> does nothing. These will be used to draw with dashed lines when
> stroking, with each subpath starting at the length along the dash
> pattern indicated by the line dash offset. Initially these lengths
> are measured in pixels, though the current transform at the time of
> drawing can affect this. The count must be non-negative. If it is
> odd, the array will be appended to itself to make an even count. If
> it is zero, or the pointer is null, the dash pattern will be cleared
> and strokes will be drawn as solid lines. The array is copied and
> it is safe to change or destroy it after this call. Defaults to
> solid lines.
### set_fill_linear_gradient([*self*](../../API/builtins/self.md), start_x : [`number`](../../API/builtins/number.md), start_y : [`number`](../../API/builtins/number.md), end_x : [`number`](../../API/builtins/number.md), end_y : [`number`](../../API/builtins/number.md))<a name="set_fill_linear_gradient"></a>
> Set filling to use a linear gradient.<br>
> 
> Positions the start and end points of the gradient and clears all
> color stops to reset the gradient to transparent black. Color stops
> can then be added again. When drawing, pixels will be painted with
> the color of the gradient at the nearest point on the line segment
> between the start and end points. This is affected by the current
> transform at the time of drawing.
### set_stroke_linear_gradient([*self*](../../API/builtins/self.md), start_x : [`number`](../../API/builtins/number.md), start_y : [`number`](../../API/builtins/number.md), end_x : [`number`](../../API/builtins/number.md), end_y : [`number`](../../API/builtins/number.md))<a name="set_stroke_linear_gradient"></a>
> Set filling to use a linear gradient.<br>
> See: `renoise.Views.Canvas.Context` set_fill_linear_gradient
### set_fill_radial_gradient([*self*](../../API/builtins/self.md), start_x : [`number`](../../API/builtins/number.md), start_y : [`number`](../../API/builtins/number.md), start_radius : [`number`](../../API/builtins/number.md), end_x : [`number`](../../API/builtins/number.md), end_y : [`number`](../../API/builtins/number.md), end_radius : [`number`](../../API/builtins/number.md))<a name="set_fill_radial_gradient"></a>
> Set filling to use a radial gradient.<br>
> 
> Positions the start and end circles of the gradient and clears all
> color stops to reset the gradient to transparent black. Color stops
> can then be added again. When drawing, pixels will be painted as
> though the starting circle moved and changed size linearly to match
> the ending circle, while sweeping through the colors of the gradient.
> Pixels not touched by the moving circle will be left transparent
> black. The radial gradient is affected by the current transform
> at the time of drawing. The radii must be non-negative.
### set_stroke_radial_gradient([*self*](../../API/builtins/self.md), start_x : [`number`](../../API/builtins/number.md), start_y : [`number`](../../API/builtins/number.md), start_radius : [`number`](../../API/builtins/number.md), end_x : [`number`](../../API/builtins/number.md), end_y : [`number`](../../API/builtins/number.md), end_radius : [`number`](../../API/builtins/number.md))<a name="set_stroke_radial_gradient"></a>
> Set stroke to use a radial gradient.<br>
> See: `renoise.Views.Canvas.Context` set_fill_radial_gradient
### add_fill_color_stop([*self*](../../API/builtins/self.md), offset : [`number`](../../API/builtins/number.md), color : [`RGBAColor`](#RGBAColor) | [`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor))<a name="add_fill_color_stop"></a>
> Add a color stop to a linear or radial gradient fill.<br>
> 
> Each color stop has an offset which defines its position from 0.0 at
> the start of the gradient to 1.0 at the end. Colors and opacity are
> linearly interpolated along the gradient between adjacent pairs of
> stops without premultiplying the alpha. If more than one stop is
> added for a given offset, the first one added is considered closest
> to 0.0 and the last is closest to 1.0. If no stop is at offset 0.0
> or 1.0, the stops with the closest offsets will be extended. If no
> stops are added, the gradient will be fully transparent black. Set a
> new linear or radial gradient to clear all the stops and redefine the
> gradient colors. Color stops may be added to a gradient at any time.
> The color and opacity values will be clamped to the 0.0 to 1.0 range,
> inclusive. The offset must be in the 0.0 to 1.0 range, inclusive.
> If it is not, or if chosen style type is not currently set to a
> gradient, this does nothing.
> 
> ```lua
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- A table of 4 bytes (ranging from 0 to 255)
> -- representing the red, green, blue, alpha channels of a color.
> -- {0xFF, 0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35, 0x80} is the red from the Renoise logo, half opaque.
> -- The application theme's colors
> color:
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
### add_stroke_color_stop([*self*](../../API/builtins/self.md), offset : [`number`](../../API/builtins/number.md), color : [`RGBAColor`](#RGBAColor) | [`RGBColor`](#RGBColor) | [`ThemeColor`](#ThemeColor))<a name="add_stroke_color_stop"></a>
> Add a color stop to a linear or radial gradient stroke.<br>
> 
> 
> ```lua
> -- A table of 3 bytes (ranging from 0 to 255)
> -- representing the red, green and blue channels of a color.
> -- {0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35} is the red from the Renoise logo
> -- A table of 4 bytes (ranging from 0 to 255)
> -- representing the red, green, blue, alpha channels of a color.
> -- {0xFF, 0xFF, 0xFF, 0xFF} is white
> -- {165, 73, 35, 0x80} is the red from the Renoise logo, half opaque.
> -- The application theme's colors
> color:
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
> See: `renoise.Views.Canvas.Context` add_fill_color_stop
### rect([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md), width : [`number`](../../API/builtins/number.md), height : [`number`](../../API/builtins/number.md))<a name="rect"></a>
> Add a closed subpath in the shape of a rectangle.<br>
> 
> The rectangle has one corner at the given point and then goes in the
> direction along the width before going in the direction of the height
> towards the opposite corner. The current transform at the time that
> this is called will affect the given point and rectangle. The width
> and/or the height may be negative or zero, and this can affect the
> winding direction.
### bezier_curve_to([*self*](../../API/builtins/self.md), control_1_x : [`number`](../../API/builtins/number.md), control_1_y : [`number`](../../API/builtins/number.md), control_2_x : [`number`](../../API/builtins/number.md), control_2_y : [`number`](../../API/builtins/number.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md))<a name="bezier_curve_to"></a>
> Extend the current subpath with a cubic Bezier curve.<br>
> 
> The curve will go from the current end point (or the first control
> point if the current path is empty) to the given point, which will
> become the new end point. The curve will be tangent toward the first
> control point at the beginning and tangent toward the second control
> point at the end. The current transform at the time that this is
> called will affect all points passed in.
> 
> Tip: to make multiple curves join smoothly, ensure that each new end
> point is on a line between the adjacent control points.
### arc([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md), radius : [`number`](../../API/builtins/number.md), start_angle : [`number`](../../API/builtins/number.md), end_angle : [`number`](../../API/builtins/number.md), counter_clockwise : [`boolean`](../../API/builtins/boolean.md)[`?`](../../API/builtins/nil.md))<a name="arc"></a>
> Extend the current subpath with an arc between two angles.<br>
> 
> The arc is from the circle centered at the given point and with the
> given radius. A straight line will be added from the current end
> point to the starting point of the arc (unless the current path is
> empty), then the arc along the circle from the starting angle to the
> ending angle in the given direction will be added. If they are more
> than two pi radians apart in the given direction, the arc will stop
> after one full circle. The point at the ending angle will become
> the new end point of the path. Initially, the angles are clockwise
> relative to the x-axis. The current transform at the time that
> this is called will affect the passed in point, angles, and arc.
> The radius must be non-negative.
### arc_to([*self*](../../API/builtins/self.md), vertex_x : [`number`](../../API/builtins/number.md), vertex_y : [`number`](../../API/builtins/number.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md), radius : [`number`](../../API/builtins/number.md))<a name="arc_to"></a>
> Extend the current subpath with an arc tangent to two lines.<br>
> 
> The arc is from the circle with the given radius tangent to both
> the line from the current end point to the vertex, and to the line
> from the vertex to the given point. A straight line will be added
> from the current end point to the first tangent point (unless the
> current path is empty), then the shortest arc from the first to the
> second tangent points will be added. The second tangent point will
> become the new end point.  If the radius is large, these tangent
> points may fall outside the line segments. The current transform
> at the time that this is called will affect the passed in points
> and the arc. If the current path was empty, this is equivalent to
> a move. If the arc would be degenerate, it is equivalent to a line
> to the vertex point. The radius must be non-negative. If it is not,
> or if the current transform is not invertible, this does nothing.
> 
> Tip: to draw a polygon with rounded corners, call this once for each
> vertex and pass the midpoint of the adjacent edge as the second
> point; this works especially well for rounded boxes.
### quadratic_curve_to([*self*](../../API/builtins/self.md), control_x : [`number`](../../API/builtins/number.md), control_y : [`number`](../../API/builtins/number.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md))<a name="quadratic_curve_to"></a>
> Extend the current subpath with a quadratic Bezier curve.<br>
> 
> The curve will go from the current end point (or the control point
> if the current path is empty) to the given point, which will become
> the new end point. The curve will be tangent toward the control
> point at both ends. The current transform at the time that this
> is called will affect both points passed in.
> 
> Tip: to make multiple curves join smoothly, ensure that each new end
> point is on a line between the adjacent control points.
### scale([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md))<a name="scale"></a>
> Scale the current transform.<br>
> 
> Scaling may be non-uniform if the x and y scaling factors are
> different.  When a scale factor is less than one, things will be
> shrunk in that direction. When a scale factor is greater than
> one, they will grow bigger. Negative scaling factors will flip or
> mirror it in that direction. The scaling factors must be non-zero.
> If either is zero, most drawing operations will do nothing.
### rotate([*self*](../../API/builtins/self.md), angle : [`number`](../../API/builtins/number.md))<a name="rotate"></a>
> Rotate the current transform.<br>
> 
> The rotation is applied clockwise in a direction around the origin.
> 
> Tip: to rotate around another point, first translate that point to
> the origin, then do the rotation, and then translate back.
### translate([*self*](../../API/builtins/self.md), x : [`number`](../../API/builtins/number.md), y : [`number`](../../API/builtins/number.md))<a name="translate"></a>
> Translate the current transform.<br>
> 
> By default, positive x values shift that many pixels to the right,
> while negative y values shift left, positive y values shift up, and
> negative y values shift down.
### transform([*self*](../../API/builtins/self.md), a : [`number`](../../API/builtins/number.md), b : [`number`](../../API/builtins/number.md), c : [`number`](../../API/builtins/number.md), d : [`number`](../../API/builtins/number.md), e : [`number`](../../API/builtins/number.md), f : [`number`](../../API/builtins/number.md))<a name="transform"></a>
> Add an arbitrary transform to the current transform.<br>
> 
> This takes six values for the upper two rows of a homogenous 3x3
> matrix (i.e., {{a, c, e}, {b, d, f}, {0.0, 0.0, 1.0}}) describing an
> arbitrary affine transform and appends it to the current transform.
> The values can represent any affine transform such as scaling,
> rotation, translation, or skew, or any composition of affine
> transforms. The matrix must be invertible. If it is not, most
> drawing operations will do nothing.
### set_transform([*self*](../../API/builtins/self.md), a : [`number`](../../API/builtins/number.md), b : [`number`](../../API/builtins/number.md), c : [`number`](../../API/builtins/number.md), d : [`number`](../../API/builtins/number.md), e : [`number`](../../API/builtins/number.md), f : [`number`](../../API/builtins/number.md))<a name="set_transform"></a>
> Replace the current transform.<br>
> 
> This takes six values for the upper two rows of a homogenous 3x3
> matrix (i.e., {{a, c, e}, {b, d, f}, {0.0, 0.0, 1.0}}) describing
> an arbitrary affine transform and replaces the current transform
> with it. The values can represent any affine transform such as
> scaling, rotation, translation, or skew, or any composition of
> affine transforms. The matrix must be invertible. If it is not,
> most drawing operations will do nothing.
> 
> Tip: to reset the current transform back to the default, use
> 1.0, 0.0, 0.0, 1.0, 0.0, 0.0.  



---  
## Aliases  
### RGBAColor<a name="RGBAColor"></a>
{ 1 : [`integer`](../../API/builtins/integer.md), 2 : [`integer`](../../API/builtins/integer.md), 3 : [`integer`](../../API/builtins/integer.md), 4 : [`integer`](../../API/builtins/integer.md) }  
> A table of 4 bytes (ranging from 0 to 255)
> representing the red, green, blue, alpha channels of a color.
> {0xFF, 0xFF, 0xFF, 0xFF} is white
> {165, 73, 35, 0x80} is the red from the Renoise logo, half opaque.  
  
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
  

