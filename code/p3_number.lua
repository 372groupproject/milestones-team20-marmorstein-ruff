a = 12
b = 4.75
c = (a*a + b*b)^.5
--Lua has no differentiation between floating point and integer numbers
--All numbers are double precision floating point
print("The hypnotenuse of a triangle with side lengths 12 and 4.75 is " .. tostring(c))
