#!/usr/bin/env lua
string = require("string")
checkLoad = require("check_load")

function getRandomValue(lower, upper)
  return math.random(lower,upper)
end

function Main()
--  local file = assert(io.popen('hostname', 'r'))
--  local hostname = file:read('*all')
--  hostname = string.gsub(hostname, "\n","")
--  file:close()
--  math.randomseed(os.time())
--
--  io.write("LOAD_1_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
--  io.write("LOAD_5_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
--  io.write("LOAD_15_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
check = checkLoad.newCheckLoad()

check.getMetrics(io)

end

Main()




