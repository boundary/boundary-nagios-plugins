json = require('dkjson')

function newJsonConfig(filePath)
  local self = {path = filePath,content}
  
  local readFile = function()
    -- Load the json configuration into a string
    local f = assert(io.open(self.path, "r"))
    local t = f:read("*a")
    f:close()
    self.content = t
  end

  local getConfig = function ()
  
    readFile()
    -- Decode JSON to create the configuration object
    local obj, pos, err = json.decode (self.content, 1, nil)
    if err then
      print ("Error:", err)
    end
    return obj
  end

  local getContent = function()
    return self.content
  end
  
  local getPath = function()
    return self.path
  end

  return {
    getConfig = getConfig,
    readFile = readFile,
    getContent = getContent,
    getPath = getPath
  }
end

return {
  newCheckConfig = newCheckConfig
}
