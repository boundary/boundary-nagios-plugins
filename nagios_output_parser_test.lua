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
require("utils")

local LuaUnit = require("luaunit")

TestNagiosOutputParser = {}

function TestNagiosOutputParser:testConstructor()
  local o = NagiosOutputParser:new()
  assertEquals(o ~= nil,true)
end

function TestNagiosOutputParser:testCheckLoad()
  local o = NagiosOutputParser:new()
  local s = "CRITICAL - load average: 1.91, 0.00, 0.00|load1=1.910;0.000;0.000;0; load5=0.000;0.000;0.000;0; load15=0.000;0.000;0.000;0;"
  local t = split(s,"|")
  dumpTable(t)
  local v = split(t[2]," ")
  dumpTable(v)
  -- local values = o.parse()
end

LuaUnit:run()