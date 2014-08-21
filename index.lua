#!/usr/bin/env lua
require("nagios_plugin")

function Main()
  plugin = NagiosPlugin:new()
  plugin:loadConfiguration()
  plugin:run()
end

Main()




