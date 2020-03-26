print("How old are you?")
local line = io.read()
age = tonumber(line)
if age >= 18 then
  print("Don't forget to vote!")
else
  print("You can vote in " .. tostring(18 - age) .. " years!")
end