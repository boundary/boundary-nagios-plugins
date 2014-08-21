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

ExecProc = {path,args}

function ExecProc:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function ExecProc:setPath(path)
  if type(path) ~= "string" then error("path is not a string type",2) end
  self.path = path
end

function ExecProc:setArgs(args)
  if type(args) ~= "table" then error("args is not a table type",2) end
  self.args = args
end

function ExecProc:execute()
  if self.path == nil then error("path has not been set",2) end
  local command = self:getCommand()
  local file = assert(io.popen(command, 'r'))
  self.output = file:read('*all')
  file:close()
end

function ExecProc:getCommand()
  if type(self.path) == nil then error("path has not been set",2) end
  local command = self.path
  if (self.args)
  then
    for i,j in pairs(self.args)
    do
      command = command.." "..j
    end
  end
  return command
end

function ExecProc:getOutput()
  return self.output
end


