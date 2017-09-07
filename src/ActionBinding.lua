--[ TheEpicTwin ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MAIN CODE // --

local ActionBinding = {
    ClassName   = "ActionBinding";
}


function ActionBinding:new()
    local this = {
        InputBindings = {};
    }


    self.__index = self
    setmetatable(this, self)


    return this
end


return ActionBinding