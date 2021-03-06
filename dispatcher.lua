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

Dispatcher = {dispatchTable = {}}

function Dispatcher:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Dispatcher:add(job)
  table.insert(self.dispatchTable,job)
end

function Dispatcher:count()
  return #self.dispatchTable
end

function Dispatcher:run()
  first = nil
  for i, job in pairs(self.dispatchTable) do
    job:run()
  end
end
