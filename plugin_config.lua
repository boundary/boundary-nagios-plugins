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

require("dispatcher")
require("json_config")
require("exec_proc")
require("metric_job")
require("metric_extractor")

PluginConfig = {checkConfig,dispatcher,paramConfig}

function PluginConfig:new()
  local o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function PluginConfig:load()
  self.checkConfig = newJsonConfig("check_config.json").getConfig()
  self.paramConfig = newJsonConfig("param.json").getConfig()

  for a,b in pairs(self.paramConfig.items)
  do
    self:addJob(b)
  end
end

function PluginConfig:setDispatcher(dispatcher)
	self.dispatcher = dispatcher
end

function PluginConfig:setScheduler(scheduler)
	self.scheduler = scheduler
end

first = nil
function PluginConfig:addJob(config)

  if (first == nil)
  then
    local e = ExecProc:new()
    local j = MetricJob:new()
    local m = MetricExtractor:new()
    e:setPath("ls")
    m:setName("LOAD_1_MINUTE")
    m:setExec(e)
    j:setMetric(m)
    self.dispatcher:add(j)

    e = ExecProc:new()
    j = MetricJob:new()
    m = MetricExtractor:new()
    e:setPath("ls")
    m:setName("LOAD_5_MINUTE")
    m:setExec(e)
    j:setMetric(m)
    self.dispatcher:add(j)

    e = ExecProc:new()
    j = MetricJob:new()
    m = MetricExtractor:new()
    e:setPath("ls")
    m:setName("LOAD_15_MINUTE")
    m:setExec(e)
    j:setMetric(m)
    self.dispatcher:add(j)

    first = 1
  end
end