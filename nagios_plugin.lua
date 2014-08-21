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
require("exec_proc")
require("dispatcher")
require("metric_job")

NagiosPlugin = {checkConfig, paramConfig, dispatcher=Dispatcher:new()}

function NagiosPlugin:new()
  o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function NagiosPlugin:getRandomValue(lower, upper)
  return math.random(lower,upper)
end

function NagiosPlugin:testOutput()
  local file = assert(io.popen('hostname', 'r'))
  local hostname = file:read('*all')
  hostname = string.gsub(hostname, "\n","")
  file:close()
  math.randomseed(os.time())

  io.write("LOAD_1_MINUTE ",self:getRandomValue(0,20)," ",hostname,"\n")
  io.write("LOAD_5_MINUTE ",self:getRandomValue(0,20)," ",hostname,"\n")
  io.write("LOAD_15_MINUTE ",self:getRandomValue(0,20)," ",hostname,"\n")
end

function NagiosPlugin:loadConfiguration()
  self.checkConfig = newJsonConfig("check_config.json").getConfig()
  self.paramConfig = newJsonConfig("param.json").getConfig()
  self:loadDispatcher()
end

function NagiosPlugin:loadDispatcher()
  first = nil
  for a,b in pairs(self.paramConfig.items)
  do
    if (first == nil)
    then
      j = MetricJob:new()
      j:setName("LOAD_1_MINUTE")
      self.dispatcher:add(j)
      j = MetricJob:new()
      j:setName("LOAD_5_MINUTE")
      self.dispatcher:add(j)
      j = MetricJob:new()
      j:setName("LOAD_15_MINUTE")
      self.dispatcher:add(j)
      first = 1
    end
  end
end

function NagiosPlugin:run()
  -- self:testOutput()
  self.dispatcher:run()
end


