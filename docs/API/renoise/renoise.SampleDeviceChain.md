# renoise.SampleDeviceChain  

---  
## Properties
### available_device_infos : [`AudioDeviceInfo`](#audiodeviceinfo)`[]` {#available_device_infos}
**READ-ONLY** Returns a list of tables containing more information about
the devices.

### available_devices : [`string`](/API/builtins/string.md)`[]` {#available_devices}
**READ-ONLY** Allowed, available devices for 'insert_device_at'.

### available_output_routings : [`string`](/API/builtins/string.md)`[]` {#available_output_routings}
**READ-ONLY** Output routing.

### devices : [`renoise.AudioDevice`](/API/renoise/renoise.AudioDevice.md)`[]` {#devices}
**READ-ONLY** Device access.

### devices_observable : [`renoise.Document.ObservableList`](/API/renoise/renoise.Document.ObservableList.md) {#devices_observable}
Track changes to document lists by attaching listener functions to it.
NB: Notifiers will not broadcast changes made to list items, but only changes
to the lists **layout** (items got added, removed, swapped).

### name : [`string`](/API/builtins/string.md) {#name}
Name of the audio effect chain.

### name_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#name_observable}
Track changes to document properties or general states by attaching listener
functions to it.

### output_routing : [`string`](/API/builtins/string.md) {#output_routing}
One of 'available_output_routings'

### output_routing_observable : [`renoise.Document.Observable`](/API/renoise/renoise.Document.Observable.md) {#output_routing_observable}
Track changes to document properties or general states by attaching listener
functions to it.

  

---  
## Functions
### `delete_device_at`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#delete_device_at}
Delete an existing device from a chain. The mixer device at index 1 can not
be deleted.
### `device`([*self*](/API/builtins/self.md), index : [`integer`](/API/builtins/integer.md)) {#device}
`->`[`renoise.AudioDevice`](/API/renoise/renoise.AudioDevice.md)  

Access to a single device in the chain.
### `insert_device_at`([*self*](/API/builtins/self.md), device_path : [`string`](/API/builtins/string.md), index : [`integer`](/API/builtins/integer.md)) {#insert_device_at}
`->`new_device : [`renoise.AudioDevice`](/API/renoise/renoise.AudioDevice.md)  

Insert a new device at the given position. "device_path" must be an available device
See: [renoise.SampleDeviceChain.available_devices](file:///c%3A/Users/emuell/Development/Renoise-XRNX/definitions/library/renoise/song/instrument/sample_device_chain.lua#24#10)
### `swap_devices_at`([*self*](/API/builtins/self.md), index1 : [`integer`](/API/builtins/integer.md), index2 : [`integer`](/API/builtins/integer.md)) {#swap_devices_at}
Swap the positions of two devices in the device chain. The mixer device at
index 1 can not be swapped or moved.  



---  
## Structs  
# AudioDeviceInfo  
Audio device info  

---  
## Properties
### favorite_name : [`string`](/API/builtins/string.md) {#favorite_name}
The device's name as displayed in favorites

### is_bridged : [`boolean`](/API/builtins/boolean.md) {#is_bridged}
true if the device is a bridged plugin

### is_favorite : [`boolean`](/API/builtins/boolean.md) {#is_favorite}
true if the device is a favorite

### name : [`string`](/API/builtins/string.md) {#name}
The device's name

### path : [`string`](/API/builtins/string.md) {#path}
The device's path used by `renoise.Track:insert_device_at`

### short_name : [`string`](/API/builtins/string.md) {#short_name}
The device's name as displayed in shortened lists

  

  

