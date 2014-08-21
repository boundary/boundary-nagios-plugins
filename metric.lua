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

Metric = {source,name,value}

function Metric:new()
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.source = "localhost"
  self.name = "UNDEFINED"
  self.value = 0
  return o
end

function Metric:setSource(source)
  self.source = source
end

function Metric:getSource()
  return self.source
end

function Metric:setName(name)
	self.name = name
end

function Metric:getName()
	return self.name
end

function Metric:setValue(value)
	self.value = value
end

function Metric:getValue()
	return self.value
end

function Metric:toString()
  return self.source
end