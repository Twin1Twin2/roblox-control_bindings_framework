--[ TheEpicTwin (ROBLOX); Twin1Twin2 (GitHub) ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MODULES // --

local ActionBinding = require(script.ActionBinding)
local InputBinding  = require(script.InputBinding)


-- // ERROR MANAGER // --

local function ERROR_MANAGER(className)
    local this  = {
        ClassName   = className	or "";
        Name        = name or "";
        ErrorText   = "ERROR!";
        WarnText    = "WARNING!";
        PrintText   = "";
    }

    function this:Error(message, level)
        level   = level	or 1
        level   = level	+ 1
        local errorMessage  = string.format("%s %s [%q]", self.ErrorText, self.ClassName)
        if (message ~= nil) then
            errorMessage    = errorMessage .. " :: " .. message
        end
        error(errorMessage, level)
    end

    function this:Warn(message)
        local warnMessage  = string.format("%s %s [%q]", self.WarnText, self.ClassName)
        if (message ~= nil) then
            warnMessage = warnMessage .. " :: " .. message
        end
        warn(warnMessage)
    end

    function this:Print(message)
        local printMessage  = string.format("%s %s [%q]", self.PrintText, self.ClassName)
        if (message ~= nil) then
            printMessage    = printMessage .. " :: " .. message
        end
        print(printMessage)
    end
	
	return this
end


-- // MAIN CODE // --

local ControlBindingsFramework  = {
    ClassName   = "ControlBindingsFramework";

    ActionBindings      = {};
    ActionBindingsList  = {};

    Ready   = false;
}

local ErrorManager  = ERROR_MANAGER:new(ControlBindingsFramework.ClassName)


--  IS ACTION DOWN (  )
--
--
--
--

function ControlBindingsFramework:IsActionDown(actionBindingName)
    if (type(actionBindingName) ~= "string") then
        ErrorManager:Error("IsActionDown(  ) - Argument [1] must be a string! Type [1] = " .. type(actionBindingName), 2)
    end

    local actionBindingObject   = self:GetActionBinding(actionBindingName)

    if (actionBindingObject ~= nil) then
        return actionBindingObject.Down
    end

    return false
end


--  GET ACTION BINDING (  )
--
--
--
--

function ControlBindingsFramework:GetActionBinding(actionBindingName)
    if (type(actionBindingName) ~= "string") then
        ErrorManager:Error("GetActionBinding(  ) - Argument [1] must be a string! Type [1] = " .. type(actionBindingName), 2)
    end

    local actionBindingObject   = self.ActionBindings[actionBindingName]

    if (actionBindingObject ~= nil) then
        return actionBindingObject
    end

    return nil
end


--  ADD ACTION BINDING (  )
--
--
--
--

function ControlBindingsFramework:AddActionBinding(actionBindingName, enable)
    if (type(actionBindingName) ~= "string") then
        ErrorManager:Error("AddActionBinding(  ) - Argument [1] must be a string! Type [1] = " .. type(actionBindingName), 2)
    end

    if (enable ~= nil and type(enable) ~= "bool") then
        ErrorManager:Error("AddActionBinding(  ) - Argument [2] must be a boolean! Type [2] = " .. type(enable), 2)
    end

    local actionBindingObject   = self:GetActionBinding(actionBindingName)

    if (actionBindingObject ~= nil) then
        if (enable == true) then
            actionBindingObject:Enable()
        end

        return actionBindingObject
    end

    actionBindingObject = ActionBinding:new(actionBindingName)

    self.ActionBindings[actionBindingName]  = actionBindingObject

    table.insert(self.ActionBindingsList, actionBindingObject)

    if (enable == true) then
        actionBindingObject:Enable()
    end

    return actionBindingObject
end


return ControlBindingsFramework