json = require('dkjson')

config="check_config.json"

-- Load the json configuration into a string
local f = assert(io.open(config, "r"))
local t = f:read("*a")
f:close()

print(t)

local obj, pos, err = json.decode (t, 1, nil)
if err then
  print ("Error:", err)
else
  print(obj)
  config = obj.nagios_check_config
  for k,v in pairs(config)
  do
    print(k,v)
    for i,j in pairs(v)
    do
      print(i,j)
    end
  end
end