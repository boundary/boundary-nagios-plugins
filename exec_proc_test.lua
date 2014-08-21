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

require("exec_proc")

-- Unit testing starts
LuaUnit = require('luaunit')

TestExecProc = {}
function TestExecProc:setUp()
  self.path = "/bin/ls"
  self.exec = ExecProc:new()
  self.exec:setPath(self.path)
  self.exec:setArgs({"-l","src/test/resources/test-exec"})
end

function TestExecProc:tearDown()
  self.exec = nil
end

function TestExecProc:testExec()
  exec = ExecProc:new()
  exec:setPath("echo")
  exec:setArgs({"hello"})
  exec:execute()
  output = exec:getOutput()
  assertEquals(output,"hello\n")
end

function TestExecProc:testGetOutputNil()
  assertEquals(self.exec:getOutput(),nil)
end

function TestExecProc:testGetOutput()
  t = {}
  table.insert(t,"total 0\n")
  table.insert(t,"-rw-r--r--  1 davidg  staff   0 Aug 20 09:50 goodbye.txt\n")
  table.insert(t,"-rw-r--r--  1 davidg  staff   0 Aug 20 09:50 hello.txt\n")
  table.insert(t,"drwxr-xr-x  2 davidg  staff  68 Aug 20 09:50 mydir\n")
  expectedOutput = table.concat(t,"")
  self.exec:execute()
  output = self.exec:getOutput()
  assertEquals(output,expectedOutput)
end

function TestExecProc:testNoArgs()
  local exec = ExecProc:new()
  exec:setPath("echo foo")
  exec:execute()
  assertEquals(exec:getOutput(),"foo\n")
end

LuaUnit:run()
