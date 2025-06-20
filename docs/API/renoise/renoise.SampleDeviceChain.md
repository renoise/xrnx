# renoise.SampleDeviceChain<a name="renoise.SampleDeviceChain"></a>  

<!-- toc -->
  

---  
## Properties
### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> Name of the audio effect chain.

### name_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="name_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

### available_devices : [`string`](../../API/builtins/string.md)[]<a name="available_devices"></a>
> **READ-ONLY** Allowed, available devices for 'insert_device_at'.

### available_device_infos : [`AudioDeviceInfo`](#audiodeviceinfo)[]<a name="available_device_infos"></a>
> **READ-ONLY** Returns a list of tables containing more information about
> the devices.

### devices : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)[]<a name="devices"></a>
> **READ-ONLY** Device access.

### devices_observable : [`renoise.Document.ObservableList`](../../API/renoise/renoise.Document.ObservableList.md)<a name="devices_observable"></a>
> Track changes to document lists by attaching listener functions to it.
> NB: Notifiers will not broadcast changes made to list items, but only changes
> to the lists **layout** (items got added, removed, swapped).

### available_output_routings : [`string`](../../API/builtins/string.md)[]<a name="available_output_routings"></a>
> **READ-ONLY** Output routing.

### output_routing : [`string`](../../API/builtins/string.md)<a name="output_routing"></a>
> One of 'available_output_routings'

### output_routing_observable : [`renoise.Document.Observable`](../../API/renoise/renoise.Document.Observable.md)<a name="output_routing_observable"></a>
> Track changes to document properties or general states by attaching listener
> functions to it.

  

---  
## Functions
### insert_device_at([*self*](../../API/builtins/self.md), device_path : [`string`](../../API/builtins/string.md), index : [`integer`](../../API/builtins/integer.md))<a name="insert_device_at"></a>
`->`new_device : [`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)  

> Insert a new device at the given position. "device_path" must be an available device
> See: `renoise.SampleDeviceChain.available_devices`
### delete_device_at([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="delete_device_at"></a>
> Delete an existing device from a chain. The mixer device at index 1 can not
> be deleted.
### swap_devices_at([*self*](../../API/builtins/self.md), index1 : [`integer`](../../API/builtins/integer.md), index2 : [`integer`](../../API/builtins/integer.md))<a name="swap_devices_at"></a>
> Swap the positions of two devices in the device chain. The mixer device at
> index 1 can not be swapped or moved.
### device([*self*](../../API/builtins/self.md), index : [`integer`](../../API/builtins/integer.md))<a name="device"></a>
`->`[`renoise.AudioDevice`](../../API/renoise/renoise.AudioDevice.md)  

> Access to a single device in the chain.  



---  
## Structs  
# AudioDeviceInfo<a name="AudioDeviceInfo"></a>  
> Audio device info  

---  
## Properties
### path : [`string`](../../API/builtins/string.md)<a name="path"></a>
> The device's path used by `renoise.Track:insert_device_at`

### name : [`string`](../../API/builtins/string.md)<a name="name"></a>
> The device's name

### short_name : [`string`](../../API/builtins/string.md)<a name="short_name"></a>
> The device's name as displayed in shortened lists

### favorite_name : [`string`](../../API/builtins/string.md)<a name="favorite_name"></a>
> The device's name as displayed in favorites

### is_favorite : [`boolean`](../../API/builtins/boolean.md)<a name="is_favorite"></a>
> true if the device is a favorite

### is_bridged : [`boolean`](../../API/builtins/boolean.md)<a name="is_bridged"></a>
> true if the device is a bridged plugin

  

  

