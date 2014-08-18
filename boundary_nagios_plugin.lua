#!/usr/bin/lua

function getRandomValue(lower, upper)
   return math.random(lower,upper*100)/100
end

function Main()

print("LOAD_1_MINUTE",getRandomValue(0,20))
print("LOAD_5_MINUTE",getRandomValue(0,20))
print("LOAD_15_MINUTE",getRandomValue(0,20))

end

Main()




