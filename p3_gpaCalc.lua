letterToNumber = function(grade)
  values = {A=4, B=3,C=2,D=1,E=0,F=0}
  return values[grade]
end
  
function gpa(gradeConverter)
  credits = 0
  gpa = 0
  while(true) do
    print("Enter a letter grade, or 'done' to exit")
    grade = io.read()
    if(grade == "done") then
      break
    end
    print("How many credits was the class?")
    cred = io.read()
    credits = credits + tonumber(cred)
    gpa = gpa + (gradeConverter(grade) * tonumber(cred))
  end
  print(gpa / credits)
end

gpa(letterToNumber)