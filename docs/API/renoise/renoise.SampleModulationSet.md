# renoise.SampleModulationSet  

<!-- toc -->
  

---  
## Properties
### available_devices : [`string`](../../API/builtins/string.md)[] {#available_devices}
> **READ-ONLY** All available devices, to be used in 'insert_device_at'.

### available_filter_types : [`FilterTypes`](#FilterTypes)[] {#available_filter_types}
> **READ-ONLY** List of available filter types depending on the filter_version.

### cutoff_input : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#cutoff_input}
> Input value for the cutoff domain

### devices : [`renoise.SampleModulationDevice`](../../API/renoise/renoise.SampleModulationDevice.md)[] {#devices}
> **READ-ONLY** Device list access.

### devices_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md) {#devices_observable}
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### drive_input : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#drive_input}
> Input value for the drive domain

### filter_type : [`FilterTypes`](#FilterTypes) {#filter_type}
> The type of the filter selected for the modulation set. 
> Songs made with previous versions of Renoise may use old filter types. 

### filter_type_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#filter_type_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### filter_version : `1` | `2` | `3` {#filter_version}
> **READ-ONLY** Filter version, 3 is the latest.

### filter_version_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#filter_version_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### name : [`string`](../../API/builtins/string.md) {#name}
> Name of the modulation set.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#name_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### panning_input : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#panning_input}
> Input value for the panning domain

### pitch_input : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#pitch_input}
> Input value for the pitch domain

### pitch_range : [`integer`](../../API/builtins/integer.md) {#pitch_range}
> Range: (1 - 96)

### pitch_range_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md) {#pitch_range_observable}
> Track changes to document properties or general states by attaching listener
> functions to it.

### resonance_input : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#resonance_input}
> Input value for the resonance domain

### volume_input : [`renoise.DeviceParameter`](../../API/renoise/renoise.DeviceParameter.md) {#volume_input}
> Input value for the volume domain

  

---  
## Functions
### copy_from([*self*](../../API/builtins/self.md), other_set : [`renoise.SampleModulationSet`](../../API/renoise/renoise.SampleModulationSet.md)) {#copy_from}
> Copy all devices from another SampleModulationSet object.
### delete_device_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#delete_device_at}
> Delete a device at the given index.
### device([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md)) {#device}
`->`[`renoise.SampleModulationDevice`](../../API/renoise/renoise.SampleModulationDevice.md)  

> Access a single device by index.
### init([*self*](../../API/builtins/self.md)) {#init}
> Reset all chain back to default initial state. Removing all devices too.
### insert_device_at([*self*](../../API/builtins/self.md), device_path : [`string`](../../API/builtins/string.md), target_type : [`renoise.SampleModulationDevice.TargetType`](renoise.SampleModulationDevice.md#TargetType), index : [`integer`](../../API/builtins/integer.md)) {#insert_device_at}
`->`new_sample_modulation_device : [`renoise.SampleModulationDevice`](../../API/renoise/renoise.SampleModulationDevice.md)  

> Insert a new device at the given position. "device_path" must be one of
> renoise.song().instruments[].sample_modulation_sets[].available_devices.
### upgrade_filter_version([*self*](../../API/builtins/self.md)) {#upgrade_filter_version}
> Upgrade filter to the latest version. Tries to find a somewhat matching
> filter in the new version, but things quite likely won't sound the same.  



---  
## Local Aliases  
### FilterTypes {#FilterTypes}
[`FilterTypes1`](#FilterTypes1) | [`FilterTypes2`](#FilterTypes2) | [`FilterTypes3`](#FilterTypes3)  
> ```lua
> -- Available filter types when filter_version = 3
> -- Available filter types when filter_version = 3
> -- Available filter types when filter_version = 2
> -- Available filter types when filter_version = 1
> FilterTypes:
>     | "None"
>     | "LP Clean"
>     | "LP K35"
>     | "LP Moog"
>     | "LP Diode"
>     | "HP Clean"
>     | "HP K35"
>     | "HP Moog"
>     | "BP Clean"
>     | "BP K35"
>     | "BP Moog"
>     | "BandPass"
>     | "BandStop"
>     | "Vowel"
>     | "Comb"
>     | "Decimator"
>     | "Dist Shape"
>     | "Dist Fold"
>     | "AM Sine"
>     | "AM Triangle"
>     | "AM Saw"
>     | "AM Pulse"
>     | "None"
>     | "LP 2x2 Pole"
>     | "LP 2 Pole"
>     | "LP Biquad"
>     | "LP Moog"
>     | "LP Single"
>     | "HP 2x2 Pole"
>     | "HP 2 Pole"
>     | "HP Moog"
>     | "Band Reject"
>     | "Band Pass"
>     | "EQ -15 dB"
>     | "EQ -6 dB"
>     | "EQ +6 dB"
>     | "EQ +15 dB"
>     | "EQ Peaking"
>     | "Dist. Low"
>     | "Dist. Mid"
>     | "Dist. High"
>     | "Dist."
>     | "RingMod"
>     | "None"
>     | "LP -12 dB"
>     | "LP -24 dB"
>     | "LP -48 dB"
>     | "Moog LP"
>     | "Single Pole"
>     | "HP -12 dB"
>     | "HP -24 dB"
>     | "Moog HP"
>     | "Band Reject"
>     | "Band Pass"
>     | "EQ -15 dB"
>     | "EQ -6 dB"
>     | "EQ +6 dB"
>     | "EQ +15 dB"
>     | "Peaking EQ"
>     | "Dist. Low"
>     | "Dist. Mid"
>     | "Dist. High"
>     | "Dist."
>     | "AMod"
> ```  
  
### FilterTypes1 {#FilterTypes1}
`"AMod"` | `"Band Pass"` | `"Band Reject"` | `"Dist. High"` | `"Dist. Low"` | `"Dist. Mid"` | `"Dist."` | `"EQ +15 dB"` | `"EQ +6 dB"` | `"EQ -15 dB"` | `"EQ -6 dB"` | `"HP -12 dB"` | `"HP -24 dB"` | `"LP -12 dB"` | `"LP -24 dB"` | `"LP -48 dB"` | `"Moog HP"` | `"Moog LP"` | `"None"` | `"Peaking EQ"` | `"Single Pole"`  
> ```lua
> -- Available filter types when filter_version = 1
> FilterTypes1:
>     | "None"
>     | "LP -12 dB"
>     | "LP -24 dB"
>     | "LP -48 dB"
>     | "Moog LP"
>     | "Single Pole"
>     | "HP -12 dB"
>     | "HP -24 dB"
>     | "Moog HP"
>     | "Band Reject"
>     | "Band Pass"
>     | "EQ -15 dB"
>     | "EQ -6 dB"
>     | "EQ +6 dB"
>     | "EQ +15 dB"
>     | "Peaking EQ"
>     | "Dist. Low"
>     | "Dist. Mid"
>     | "Dist. High"
>     | "Dist."
>     | "AMod"
> ```  
  
### FilterTypes2 {#FilterTypes2}
`"Band Pass"` | `"Band Reject"` | `"Dist. High"` | `"Dist. Low"` | `"Dist. Mid"` | `"Dist."` | `"EQ +15 dB"` | `"EQ +6 dB"` | `"EQ -15 dB"` | `"EQ -6 dB"` | `"EQ Peaking"` | `"HP 2 Pole"` | `"HP 2x2 Pole"` | `"HP Moog"` | `"LP 2 Pole"` | `"LP 2x2 Pole"` | `"LP Biquad"` | `"LP Moog"` | `"LP Single"` | `"None"` | `"RingMod"`  
> ```lua
> -- Available filter types when filter_version = 2
> FilterTypes2:
>     | "None"
>     | "LP 2x2 Pole"
>     | "LP 2 Pole"
>     | "LP Biquad"
>     | "LP Moog"
>     | "LP Single"
>     | "HP 2x2 Pole"
>     | "HP 2 Pole"
>     | "HP Moog"
>     | "Band Reject"
>     | "Band Pass"
>     | "EQ -15 dB"
>     | "EQ -6 dB"
>     | "EQ +6 dB"
>     | "EQ +15 dB"
>     | "EQ Peaking"
>     | "Dist. Low"
>     | "Dist. Mid"
>     | "Dist. High"
>     | "Dist."
>     | "RingMod"
> ```  
  
### FilterTypes3 {#FilterTypes3}
`"AM Pulse"` | `"AM Saw"` | `"AM Sine"` | `"AM Triangle"` | `"BP Clean"` | `"BP K35"` | `"BP Moog"` | `"BandPass"` | `"BandStop"` | `"Comb"` | `"Decimator"` | `"Dist Fold"` | `"Dist Shape"` | `"HP Clean"` | `"HP K35"` | `"HP Moog"` | `"LP Clean"` | `"LP Diode"` | `"LP K35"` | `"LP Moog"` | `"None"` | `"Vowel"`  
> ```lua
> -- Available filter types when filter_version = 3
> FilterTypes3:
>     | "None"
>     | "LP Clean"
>     | "LP K35"
>     | "LP Moog"
>     | "LP Diode"
>     | "HP Clean"
>     | "HP K35"
>     | "HP Moog"
>     | "BP Clean"
>     | "BP K35"
>     | "BP Moog"
>     | "BandPass"
>     | "BandStop"
>     | "Vowel"
>     | "Comb"
>     | "Decimator"
>     | "Dist Shape"
>     | "Dist Fold"
>     | "AM Sine"
>     | "AM Triangle"
>     | "AM Saw"
>     | "AM Pulse"
> ```  
  

