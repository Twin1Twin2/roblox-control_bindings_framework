--[ TheEpicTwin (ROBLOX); Twin1Twin2 (GitHub) ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MODULES // --




-- // MAIN CODE // --

local ControlBindingsFramework  = {
    ClassName   = "ControlBindingsFramework";
}


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