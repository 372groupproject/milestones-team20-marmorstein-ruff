-- In Lua, functions are compiled at runtime, so different function definitions dependent on user input is possible.
print("What year were you born in?")
year = tonumber(io.read())
if(year > 1900) then
  function oldEnough(minAge)
    if(2020 - year > minAge) then
      return "You are old enough."
    else
      return "You are not old enough."
    end
  end
else
  function oldEnough(minAge)
    return "Don't lie. Nobody is that old."
  end
end
print("Are you trying to get your license?")
if(io.read() == "yes") then
  print(oldEnough(16))
end
print("Are you trying to make a Facebook account?")
if(io.read() == "yes") then
  print(oldEnough(13))
end