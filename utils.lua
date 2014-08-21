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

math.randomseed(os.time())

function getHostName()
  local exec = ExecProc:new()
  exec:setPath("hostname")
  exec:execute()
  local hostname = string.gsub(exec:getOutput(),"\n","")
  return hostname
end

function dumpTable(t)
  print(t)
	for i, j in pairs(t) do
		print(i,j)
	end
end

function getRandomValue(lower, upper)

  return math.random(lower,upper)
end