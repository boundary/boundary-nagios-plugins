require("check_config")

-- Unit testing starts
LuaUnit = require('luaunit')


TestCheckConfig = {}
function TestCheckConfig:setUp()
  self.a = 1
  self.b = 2
  self.file = "src/test/resources/example_config.json"
end

function TestCheckConfig:tearDown()
  self.config = nil
end

function TestCheckConfig:testGetFilePath()
  c = newCheckConfig(self.file)
  assertEquals(c.getPath(),self.file)
end

function TestCheckConfig:testReadFile()
  c = newCheckConfig(self.file)
  c.readFile()
  assertEquals(type(c.getContent()), 'string' )
end

function TestCheckConfig:testBadFunction()
  result = 4
  assertEquals( type(result), 'number' )
  assertEquals( result, 4)
end

LuaUnit:run()
