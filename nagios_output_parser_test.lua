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

require("nagios_output_parser")
require("metric_name_mapper")
require("metric")
require("utils")

local LuaUnit = require("luaunit")

TestNagiosOutputParser = {}

function TestNagiosOutputParser:setUp()
  self.p = NagiosOutputParser:new()
  self.m = MetricNameMapper:new()

end

function TestNagiosOutputParser:tearDown()
  self.m = nil
end

function TestNagiosOutputParser:testConstructor()
  local o = NagiosOutputParser:new()
  assertEquals(o ~= nil,true)
end

function TestNagiosOutputParser:testCheckLoad()
  self.m:add("load1","LOAD_1_MINUTE")
  self.m:add("load5","LOAD_5_MINUTE")
  self.m:add("load15","LOAD_15_MINUTE")

  self.p:setMapper(self.m)

  local s = "CRITICAL - load average: 1.91, 0.00, 0.00|load1=1.910;0.000;0.000;0; load5=0.000;0.000;0.000;0; load15=0.000;0.000;0.000;0;"
  local values = self.p:parse(s)
  -- dumpTable(values)
end

function TestNagiosOutputParser:testCheckUsers()
  self.m:add("users")
  self.p:setMapper(self.m)
  local s = "USERS CRITICAL - 5 users currently logged in |users=5;1;1;0"
  local values = self.p:parse(s)
  -- dumpTable(values)

end

LuaUnit:run()
