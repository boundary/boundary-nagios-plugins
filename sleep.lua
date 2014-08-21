socket = require "socket"

function sleep(sec)
  socket.select(nil, nil, sec)
end



for i = 1,10 do
  print("sleep")
  sleep(4)
  print("awake")
  sleep(20)
end
