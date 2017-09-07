--[ TheEpicTwin ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MODULES // --




-- // MAIN CODE // --

local ControlBindingsFramework = {
    ClassName = "ControlBindingsFramework";
}


function ControlBindingsFramework:new()
    local this = {
        ActionBindings = {};
        InputBindings = {};

        Ready = false;
    }
    

    self.__index = self
    setmetatable(this, self)


    return this
end

return ControlBindingsFramework