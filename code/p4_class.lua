--Lua uses tables to simulate object-oriented programming
Button = {pressed = False} 
function Button.press()
      Button.pressed = not Button.pressed
end
    
--Constructor
function Button:new (o)
    setmetatable(o, self)
    self.__index = self
    return o
  end
  

  print(Button.pressed)
  Button.press()
  print(Button.pressed)