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

require("metric_extractor")

local LuaUnit = require('luaunit')

TestMetricExtractor = {}

function TestMetricExtractor:testName()
  m = MetricExtractor:new()
  m:setName("foo")
  assertEquals(m:getName(),"foo")
end

function TestMetricExtractor:testNameType()
  local ok, msg = pcall(function ()
    local m = MetricExtractor:new()
    local n = 30
    m:setName(n)
  end)

  assertEquals(ok,false)
end

function TestMetricExtractor:testInterval()
  assertEquals(1,1)
end

function TestMetricExtractor:testIntervalType()
  local ok, msg = pcall(function ()
    local m = MetricExtractor:new()
    local s = "30"
    m:setInterval(s)
  end)

  assertEquals(ok,false)
end

function TestMetricExtractor:testSource()
  local ok, msg = pcall(function ()
    local m = MetricExtractor:new()
    local s = 10
    m:setSource(s)
  end)

  assertEquals(ok,false)
end

function TestMetricExtractor:testSourceType()
  local ok, msg = pcall(function ()
    local m = MetricExtractor:new()
    local n = 30
    m:setSource(n)
  end)

  assertEquals(ok,false)
end

function TestMetricExtractor:testUpdate()
  m = MetricExtractor:new()
  e = ExecProc:new()
  m:setName("foo")
  e:setPath("ls")
  m:setExec(e)
  m:update()
end

function TestMetricExtractor:testToString()
  m = MetricExtractor:new()
  m:setName("foo")
  m:setInterval(30)
  assertEquals(m:toString(),"[name = foo, interval = 30]")
end

LuaUnit:run()
