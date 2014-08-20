
function newExecProc(path,args)
  local self = {path=path,args=args,output}

  function getCommand()
    local command = self.path
    for i,j in pairs(self.args)
    do
      command = command.." "..j
    end
    return command
  end
  
-- TODO: How to handled exceptions??
  local function execute()
    local command = getCommand()
    local file = assert(io.popen(command, 'r'))
    self.output = file:read('*all')
    file:close()
  end
  


  local getOutput = function ()
    return self.output
  end

  return {
    execute = execute,
    getOutput = getOutput,
    getCommand = getCommand
  }
end

return {
  newExecProc = newExecProc
}
