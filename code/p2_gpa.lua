creditsTotal = 0
total = 0
repeat 
  print("Enter a letter grade (A - E) for each class, type \"done\" when finished")
  grade = io.read()
  
  if(grade:lower() ~= "done") then
    while(grade:lower() ~= "a" and grade:lower() ~= "b" and grade:lower() ~= "c" and grade:lower() ~= "d" and grade:lower() ~= "e") do
      print("Enter a letter grade A - E")
      grade = io.read()
    end
    
    print("Enter the number of credits for this class")
    credits = io.read()
    
    grade = grade:lower()
    if grade == "a" then
      total = total + (4*credits)
    elseif grade == "b" then
      total = total + (3*credits)
    elseif grade == "c" then
      total = total + (2*credits)
    elseif grade == "d" then
      total = total + credits
    end
    
    creditsTotal = creditsTotal + credits
end   
until grade:lower() == "done"

print("GPA is " .. total/creditsTotal)