print("What is your name?")
local name = io.read()
while(name:lower() ~= "jeff") do
  print("I'm pretty sure that's not your name. I thought it was Jeff.")
  print("What is your name?")
  name = io.read()
end
print("Hey Jeff, how's it going?")