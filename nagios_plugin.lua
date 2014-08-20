require("json_config")

function newNagiosPlugin()
  local self = {checkConfig, paramConfig}

  function getRandomValue(lower, upper)
    return math.random(lower,upper)
  end

  function testOutput()
    local file = assert(io.popen('hostname', 'r'))
    local hostname = file:read('*all')
    hostname = string.gsub(hostname, "\n","")
    file:close()
    math.randomseed(os.time())

    io.write("LOAD_1_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
    io.write("LOAD_5_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
    io.write("LOAD_15_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")

  end
  
  function dumpCheckConfig(config)
    for a,b in pairs(config)
    do
      for c,d in pairs(b)
      do
        print(d.name)
        args = d.args
        print(type(args))
        for e,f in pairs(args)
        do
          print(e,f)
        end
        print(d.description)
        print(d.usage)
      end
    end
  end

  local function loadConfiguration()
    self.checkConfig = newJsonConfig("check_config.json")
    checkConfig = self.checkConfig.getConfig()
    -- print(checkConfig.check_config[1].name)
    -- self.paramConfig = newJsonConfig("param.json")
    -- dumpCheckConfig(checkConfig.check_config)

  end

  local function run()
    testOutput()
  end


  return {
    run = run,
    loadConfiguration = loadConfiguration
  }

end

return {
  newNagiosPlugin = newNagiosPlugin
}
