#!/usr/bin/env lua
s = require("string")

function getRandomValue(lower, upper)
   return math.random(lower,upper*100)/100
end

function Main()
local file = assert(io.popen('hostname', 'r'))
local hostname = file:read('*all')
hostname = s.gsub(hostname, "\n","")
file:close()
math.randomseed(os.time())
print("LOAD_1_MINUTE",hostname,getRandomValue(0,20))
print("LOAD_5_MINUTE",hostname,getRandomValue(0,20))
print("LOAD_15_MINUTE",hostname,getRandomValue(0,20))

end

Main()




