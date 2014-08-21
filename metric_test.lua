require("metric")
local LuaUnit = require('luaunit')

local TestMetric = {} --class
function TestMetric:testName()
  m = Metric:new()
  m:setName("foo")
  assertEquals(m:getName(),"foo")
end

function TestMetric:testNameType()
  local ok, msg = pcall(function ()
    local m = Metric:new()
    local n = 30
    m:setName(n)
  end)

  assertEquals(ok,false)
end

function TestMetric:testInterval()
  assertEquals(1,1)
end

function TestMetric:testIntervalType()
  local ok, msg = pcall(function ()
    local m = Metric:new()
    local s = "30"
    m:setInterval(s)
  end)

  assertEquals(ok,false)
end

function TestMetric:testSource()
 local ok, msg = pcall(function ()
    local m = Metric:new()
    local s = "localhost"
    m:setSource(s)
  end)

  assertEquals(ok,false)
end

function TestMetric:testSourceType()
  local ok, msg = pcall(function ()
    local m = Metric:new()
    local n = 30
    m:setSource(n)
  end)

  assertEquals(ok,false)
end



function TestMetric:testToString()
  m = Metric:new()
  m:setName("foo")
  m:setInterval(30)
  assertEquals(m:toString(),"[name = foo, interval = 30]")
end

LuaUnit:run()
