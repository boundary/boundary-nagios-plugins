local lanes = require "lanes"
lanes.configure()

local linda = lanes.linda()

-- First timer once a second, not synchronized to wall clock
--
lanes.timer( linda, "sec", 1, 1)

-- Timer to a future event (next even minute); wall clock synchronized
--
local t = os.date( "*t", os.time() + 60)    -- now + 1min
t.sec = 0

lanes.timer( linda, "min", t, 60)   -- reoccur every minute (sharp)

while true do
  local key, v = linda:receive( "sec", "min")
  print( "Timer "..key..": "..v)
end
