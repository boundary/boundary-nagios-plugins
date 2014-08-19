json = require('dkjson')

function newLoadConfiguration(filename)
  local self = {filename}

  local getConfig = function ()
    -- Load the json configuration into a string
    local f = assert(io.open(config, "r"))
    local t = f:read("*a")
    f:close()

    local obj, pos, err = json.decode (t, 1, nil)
    if err then
      print ("Error:", err)
    end
    return obj
  end
  
  return {
    getConfig = getConfig
  }
end

return {
  newLoadConfiguration = newLoadConfiguration
}
