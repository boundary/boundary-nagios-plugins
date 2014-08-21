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
