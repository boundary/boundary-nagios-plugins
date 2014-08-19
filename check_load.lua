
function newCheckLoad ()
  local self = {}

  local getMetrics = function ()
    local file = assert(io.popen('hostname', 'r'))
    local hostname = file:read('*all')
    hostname = string.gsub(hostname, "\n","")
    file:close()
    math.randomseed(os.time())

    io.write("LOAD_1_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
    io.write("LOAD_5_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")
    io.write("LOAD_15_MINUTE ",getRandomValue(0,20)," ",hostname,"\n")

  end

  return {
    getMetrics = getMetrics
  }
end

return {
  newCheckLoad = newCheckLoad
}
