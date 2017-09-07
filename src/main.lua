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

    ActionBindings  = {};
    InputBindings   = {};

    Ready   = false;
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


-- ADD ACTION BINDING (  )
--
--
--
--

function ControlBindingsFramework:AddActionBinding(actionBindingName, enable)
    if (type(actionBindingName) ~= "string") then
        --error
    end

    if (enable ~= nil and type(enable) ~= "bool") then
        --error
    end

    local actionBindingObject   = self:GetActionBinding(actionBindingName)

    if (actionBindingObject ~= nil) then
        if (enable == true) then
            actionBindingObject:Enable()
        end
        
        return actionBindingObject
    end

    actionBindingObject = ActionBinding:new(actionBindingName)

    table.insert(self.ActionBindings, actionBindingObject)

    if (enable == true) then
        actionBindingObject:Enable()
    end

    return actionBindingObject
end



return ControlBindingsFramework