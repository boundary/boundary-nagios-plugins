-- Copyright 2014 Boundary,Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

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

function TestMetric:testUpdate()
  m = Metric:new()
  e = ExecProc:new()
  
  m.setExec(e)
  m.sample()


function TestMetric:testToString()
  m = Metric:new()
  m:setName("foo")
  m:setInterval(30)
  assertEquals(m:toString(),"[name = foo, interval = 30]")
end

LuaUnit:run()
