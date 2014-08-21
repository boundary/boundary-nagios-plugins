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
require("utils")

MetricJob = {name,metric}

function MetricJob:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function MetricJob:setMetric(metric)
--  if type(metric) ~= 'table' then error("Metric is not a table") end
  self.metric = metric
end

function MetricJob:setName(name)
  self.name = name
end

function MetricJob:run()
  if self.metric == nil
  then
    print("No metric assigned to the job",skipping)
  else
    self.metric:update()
  end
end

