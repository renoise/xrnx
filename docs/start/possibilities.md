# Possibilities

Before you delve into writing your own scripts and tools, it worth considering what is even possible to do with them. In general, you can automate and manage different aspects Renoise, add or modify song data using algorithms or create interfaces to connect with other software or hardware. You can see some examples below about what you can access inside Renoise, for a complete reference, check out the [API](https://github.com/renoise/definitions/). 

### Process song data
* Generate, modify or filter notes, patterns or phrases
* Access volume, delays and panning values
* Write effect commands and automation
* Rearrange the pattern matrix and more

### Manage tracks and instruments
* Create and modify instruments or tracks
* Add built-in DSP devices to tracks or FX chains and set their parameters
* Generate modulation chains on instruments
* Load samples and configure them
* Manage slices and keyzones

### Sample generation and mangling
* Generate new samples and change existing ones
* Chop samples and create slices and intruments based on custom rules
* Implement offline audio effects

### Custom graphical interfaces
* Use built-in sliders, buttons, switches and more to compose a GUI
* Listen to keyboard and mouse events to define custom behaviour
* Use bitmaps to create unique buttons
* Hook up the interface to the rest of your tool

### Controller support
* Write logic for bidirectional communication between Renoise and MIDI controllers
* Implement custom functionality for MIDI control surfaces
* Control Renoise via customized [OSC](https://en.wikipedia.org/wiki/Open_Sound_Control) messages
* Exchange information with other software like VJ tools or web services

### Interactions

There are a few ways tool creators can make the functionality they provide available for users, below is a brief summary of the most used methods.

* [Define keybindings](../guide/TODO.md#keybindings) that can be assigned to shortcuts and executed from certain contexts in Renoise
* [Add new entries to menus](../guide/TODO.md#menus) like the *Tools* menu or one of the right-click context menus
* [Create custom views](../guide/TODO.md#views) that do things on button presses, slider drags and so on
* [Listen to MIDI, OSC or WebSocket messages](../guide/TODO.md#midi) to execute actions
* [React to events inside Renoise](../guide/observables_and_preferences.md) like "do something any time a new song is loaded"

<!-- 
  TODO more

- Run scripts and commands via a terminal in realtime using the
  "Scripting Console & Editor". 

  + Nibbles ;)
-->

## Limitations

Finally, let's look at what is **not** possible via tools.

* You cannot override the existing behaviour of Renoise. You can add functionality *on top* of what's already there, but you can't disable or change how the built-in features work.  
  For example, you can create a completely custom GUI to compose patterns in a novel way but you cannot change how the built-in pattern editor works or looks like. Similarly, you can add a new shortcut that does something extra to the selected sample block or places new slices but you can't modify how the built-in autoslicing works.

* You cannot write real-time DSP code like synths, effects or modulators (except for scripts inside the [Formula device](../guide/TODO.md#formula-docs)). If you want to design your own synths and effects you should look into plugin development (using [DISTRHO](https://distrho.kx.studio/), [nih-plug](https://github.com/robbert-vdh/nih-plug) etc.), you could also use existing plugins that allow you to build your own DSP patches (like [plugdata](https://plugdata.org/) or [Cardinal](https://cardinal.kx.studio/)). Of course you can [generate and modify samples](../guide/TODO.md#samples) using your tool, but it will have to be implemented as offline rendering instead of real-time processing.
