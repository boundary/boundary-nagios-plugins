require("metric")
local LuaUnit = require('luaunit')

TestMetric = {} --class
function TestMetric:testName()
  m = Metric:new()
  m:setName("foo")
  assertEquals(m:getName(),"foo")
end

function TestMetric:testNameType()
  local ok, msg = pcall(function ()
    m = Metric:new()
    n = 30
    m:setName(n)
  end)

  assertEquals(ok,false)
end

function TestMetric:testInterval()
  assertEquals(1,1)
end

function TestMetric:testIntervalType()
  local ok, msg = pcall(function ()
    m = Metric:new()
    s = "30"
    m:setInterval(s)
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
