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

  local function loadConfiguration()
    self.checkConfig = newJsonConfig("check_config.json")
    
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
