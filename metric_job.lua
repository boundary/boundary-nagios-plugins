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

MetricJob = {name,exec,hostname}

function MetricJob:new()
  o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end


function MetricJob:setExec(exec)
  self.exec = exec
end

function MetricJob:getHost()
  local exec = ExecProc:new()
  exec.setPath("hostname")
  exec.execute()
  self.hostname = string.gsub(exec.getOutput(),"\n","")
--  local file = assert(io.popen('hostname', 'r'))
--  local hostname = file:read('*all')
--  self.hostname = string.gsub(hostname, "\n","")
--  file:close()
end

function MetricJob:setName(name)
  self.name = name
end

function MetricJob:sample()
--  if self.exec == nil then error("exec not specified",2) end
--  self.exec.execute()
--  output = self.exec.getOutput()
  math.randomseed(os.time())
  self:getHost()

  io.write(self.name," ",math.random(0,20)," ",self.hostname,"\n")
end

function MetricJob:parse()
  return ""
end
