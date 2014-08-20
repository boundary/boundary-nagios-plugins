#!/usr/bin/env lua
require("nagios_plugin")



function Main()
  plugin = newNagiosPlugin()
  
  plugin.loadConfiguration()
  
  plugin.run()

end

Main()




