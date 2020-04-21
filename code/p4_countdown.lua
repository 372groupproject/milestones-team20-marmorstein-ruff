Countdown = {event = "", days = 0}
--Constructor
function Countdown:new(o)
  setmetatable(o, self)
  self.__index = self
  return o
end 

--Methods
function Countdown.dayPassed(self)
  self.days = self.days - 1
end

function Countdown.printDaysUntil(self)
  if(self.days > 0) then print(self.days .. " days until " .. self.event) 
else print(self.event .. " is finally here!")
end
end

christmas = Countdown:new{event = "Christmas", days = 365}
coronavirus = Countdown:new{event = "End of quarantine", days = 5}

christmas.printDaysUntil(christmas)
christmas.dayPassed(christmas)
christmas.printDaysUntil(christmas)
christmas.dayPassed(christmas)
christmas.printDaysUntil(christmas)
christmas.dayPassed(christmas)
christmas.printDaysUntil(christmas)
print("...")

coronavirus.printDaysUntil(coronavirus)
coronavirus.dayPassed(coronavirus)
coronavirus.printDaysUntil(coronavirus)
coronavirus.dayPassed(coronavirus)
coronavirus.printDaysUntil(coronavirus)
coronavirus.dayPassed(coronavirus)
coronavirus.printDaysUntil(coronavirus)
coronavirus.dayPassed(coronavirus)
coronavirus.printDaysUntil(coronavirus)
coronavirus.dayPassed(coronavirus)
coronavirus.printDaysUntil(coronavirus)



