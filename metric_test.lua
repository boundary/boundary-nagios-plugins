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
local LuaUnit = require("luaunit")

TestMetric = {m}

function TestMetric:setUp()
  self.m = Metric:new()
end

function TestMetric:tearDown()
  self.m = nil
end

function TestMetric:testConstructor()
  local o = Metric:new()
  assertEquals(o ~= nil,true)
end

function TestMetric:testSource()
  self.m:setSource("foo")
  assertEquals(self.m:getSource(),"foo")
end

function TestMetric:testName()
  self.m:setName("bar")
  assertEquals(self.m:getName(),"bar")
end

function TestMetric:testValue()
  self.m:setValue("snafu")
  assertEquals(self.m:getValue(),"snafu")
end

LuaUnit:run()