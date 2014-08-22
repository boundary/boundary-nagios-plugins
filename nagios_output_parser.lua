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

NagiosOutputParser = {mapper}

function NagiosOutputParser:new()
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function NagiosOutputParser:setMapper(mapper)
  self.mapper = mapper
end

function NagiosOutputParser:parse(output)
  local t = split(output,"|")
  local v = split(t[2]," ")
  for i, j in pairs(v) do
    words = split(j,"=")
    values = split(words[2],";")
  	m = Metric:new()
  	m:setName(words[1])
  	m:setValue(values[1])
  	print(m:toString())
  end
  return v
end