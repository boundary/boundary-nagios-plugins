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
require("metric")

NagiosPlugin = {checkConfig, paramConfig, dispatcher=Dispatcher:new()}

function NagiosPlugin:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function NagiosPlugin:loadConfiguration()
  self.checkConfig = newJsonConfig("check_config.json").getConfig()
  self.paramConfig = newJsonConfig("param.json").getConfig()
  self:loadDispatcher()
end
first = nil
function NagiosPlugin:addJob(config)

  if (first == nil)
  then
    local e = ExecProc:new()
    local j = MetricJob:new()
    local m = Metric:new()
    e:setPath("ls")
    m:setName("LOAD_1_MINUTE")
    m:setExec(e)
    j:setMetric(m)
    self.dispatcher:add(j)

    e = ExecProc:new()
    j = MetricJob:new()
    m = Metric:new()
    e:setPath("ls")
    m:setName("LOAD_5_MINUTE")
    m:setExec(e)
    j:setMetric(m)
    self.dispatcher:add(j)

    e = ExecProc:new()
    j = MetricJob:new()
    m = Metric:new()
    e:setPath("ls")
    m:setName("LOAD_15_MINUTE")
    m:setExec(e)
    j:setMetric(m)
    self.dispatcher:add(j)

    first = 1
  end
end

function NagiosPlugin:loadDispatcher()
  first = nil
  for a,b in pairs(self.paramConfig.items)
  do
    self:addJob(b)
  end
end

function NagiosPlugin:run()
  -- self:testOutput()
  self.dispatcher:run()
end


