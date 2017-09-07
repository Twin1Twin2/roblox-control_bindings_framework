--[ TheEpicTwin (ROBLOX); Twin1Twin2 (GitHub) ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MODULES // --

local ActionBinding = require(script.ActionBinding)
local InputBinding  = require(script.InputBinding)


-- // MAIN CODE // --

local ControlBindingsFramework  = {
    ClassName   = "ControlBindingsFramework";
}


--  GET ACTION BINDING (  )
--
--
--
--

function ControlBindingsFramework:GetActionBinding(actionBindingName)
    if (type(actionBindingName) ~= "string") then
        --error
    end

    for _, actionBinding in pairs(self.ActionBindings) do
        if (actionBinding.Name == actionBindingName) then
            return actionBinding
        end
    end

    return nil
end


--  NEW (  )
--
--
--
--

function ControlBindingsFramework:new()
    local this  = {
        ActionBindings  = {};
        InputBindings   = {};

        Ready   = false;
    }
    

    self.__index    = self
    setmetatable(this, self)


    return this
end

return ControlBindingsFramework