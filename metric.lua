Metric = {name,interval}
function Metric:new()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Metric:getName()
  return self.name
end

function Metric:setName(name)
  if type(name) ~= "string" then error("interval is not a string type",2) end
  self.name = name
end

function Metric:setInterval(interval)
  if type(interval) ~= "number" then error("interval is not a number type",2) end
  self.interval = interval
end

function Metric:getInterval()
  return self.interval
end

function Metric:toString()
  return "[name = "..self.name..", interval = "..self.interval.."]"
end
