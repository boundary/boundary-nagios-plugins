#!/usr/bin/env lua
string = require("string")
checkLoad = require("check_load")


function getRandomValue(lower, upper)
  return math.random(lower,upper)
end

function Main()

-- Get configuration, if there is nothing to run, exit?

-- Get Nagios check configuration


check = checkLoad.newCheckLoad()

check.getMetrics()

end

Main()




