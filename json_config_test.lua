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

require("json_config")

-- Unit testing starts
LuaUnit = require('luaunit')


TestCheckConfig = {}
function TestCheckConfig:setUp()
  self.a = 1
  self.b = 2
  self.file = "src/test/resources/example_config.json"
  self.config = newJsonConfig(self.file)
end

function TestCheckConfig:tearDown()
  self.config = nil
end

function TestCheckConfig:testGetFilePath()
  c = newJsonConfig(self.file)
  assertEquals(c.getPath(),self.file)
end

function TestCheckConfig:testReadFile()
  self.config.readFile()
  s = self.config.getContent()
  assertEquals(type(s), 'string' )
  assertEquals(#s,682)
end

function TestCheckConfig:testConfigObject()
  o = self.config.getConfig()
  assertEquals(type(o.check_config),'table')
  assertEquals(#o.check_config,3)
  
  o1 = o.check_config[1]
  assertEquals(type(o1),'table')
  assertEquals(o1.name,'check_disk')
  a1 = o1.args
  assertEquals(a1[1],"-w")
  assertEquals(a1[2],"1")
  assertEquals(a1[3],"-c")
  assertEquals(a1[4],"1")
  
  o2 = o.check_config[2]
  assertEquals(type(o2),'table')
  assertEquals(o2.name,'check_load')
  u2 = o2.usage
  assertEquals(u2,"check_load [-r] -w WLOAD1,WLOAD5,WLOAD15 -c CLOAD1,CLOAD5,CLOAD15")
  
  o3 = o.check_config[3]
  assertEquals(type(o3),'table')
  assertEquals(o3.name,'check_ssh')
  
end

LuaUnit:run()
