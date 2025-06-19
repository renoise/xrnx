# Classes

The Lua language does not have a built-in `class` construct. However, the Renoise Lua API provides simple object-oriented programming support via a global `class()` function. All Renoise API objects use such classes, and you can use them in your tools as well.

See the [luabind documentation](https://www.rasterbar.com/products/luabind/docs.html#defining-classes-in-lua) for more technical information, and the examples below for how to use them.

## Examples

```lua
-- abstract class
class 'Animal'

  function Animal:__init(name)
    self.name = name
    self.can_fly = nil
  end  

  function Animal:__tostring()
    assert(self.can_fly ~= nil, "I don't know if I can fly or not")
    
    return ("I am a %s (%s) and I %s"):format(self.name, type(self), 
      (self.can_fly and "can fly" or "cannot fly"))
  end


-- derived classes

-- MAMMAL
class 'Mammal' (Animal)

  function Mammal:__init(str)
    Animal.__init(self, str)
    self.can_fly = false
  end

-- BIRD
class 'Bird' (Animal)

  function Bird:__init(str)
    Animal.__init(self, str)
    self.can_fly = true
  end

-- FISH
class 'Fish' (Animal)

  function Fish:__init(str)
    Animal.__init(self, str)
    self.can_fly = false
  end


-- run

local farm = {}

table.insert(farm, Mammal("cow"))
table.insert(farm, Bird("sparrow"))
table.insert(farm, Fish("bass"))

print(("type(Mammal('cow')) -> %s"):format(type(Mammal("cow"))))
print(("type(Mammal) -> %s"):format(type(Mammal)))

for _,animal in ipairs(farm) do
  print(animal)
end
```

Something to keep in mind:

*   A constructor, `function MyClass:__init(args)`, must be defined for each class, or the class cannot be used to instantiate objects.
*   Class definitions are always global, so even locally defined classes will be registered globally.


## Class operators

You can overload most operators in Lua for your classes. You do this by simply declaring a member function with the same name as an operator's corresponding metamethod in Lua.

The operators you can overload are:

*   `__add` (addition)
*   `__sub` (subtraction)
*   `__mul` (multiplication)
*   `__div` (division)
*   `__pow` (exponentiation)
*   `__lt` (less than)
*   `__le` (less than or equal to)
*   `__eq` (equality)
*   `__call` (function call)
*   `__unm` (unary minus)
*   `__tostring`
*   `__len` (length operator `#`)

Note: `__tostring` isn't really an operator, but it's the metamethod that is called by the standard library's `tostring()` function.
