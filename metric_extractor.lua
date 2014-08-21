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

require("utils")

MetricExtractor = {source,name,interval,exec}
function MetricExtractor:new()
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function MetricExtractor:setExec(exec)
  self.exec = exec
end

function MetricExtractor:getName()
  return self.name
end

function MetricExtractor:setName(name)
  if type(name) ~= "string" then error("interval is not a string type",2) end
  self.name = name
end

function MetricExtractor:setInterval(interval)
  if type(interval) ~= "number" then error("interval is not a number type",2) end
  self.interval = interval
end

function MetricExtractor:getInterval()
  return self.interval
end

function MetricExtractor:setSource(source)
  if type(source) ~= "string" then error("source is not a string type",2) end
  self.source = source
end

function MetricExtractor:getSource()
  local source


  return self.source
end

function MetricExtractor:update()
  self.exec:execute()
  local output = self.exec:getOutput() 
  self:send(self:getName()," ",getRandomValue(0,20)," ",getHostName(),"\n")
end

function MetricExtractor:send(metric,source,value)
  io.write(metric," ",value," ",source,"\n")
end

function MetricExtractor:toString()
  return "[name = "..self.name..", interval = "..self.interval.."]"
end
