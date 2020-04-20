myprint = function(param)
   print("This is my print function " .. tostring(param))
end

function add(num1,num2,printer)
   result = num1 + num2
   printer(result)
end

myprint(10)
add(2,5,myprint)
