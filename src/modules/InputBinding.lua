--[ TheEpicTwin ]--

-- // DESCRIPTION // --
--
--
--
--


-- // MAIN CODE // --

local InputBinding  = {
    ClassName   = "InputBinding";
}


function InputBinding:new(name)
    if (type(name) ~= "string") then
        error("InputBinding - Argument [1] is not a string! Type [1] = " .. tostring(name), 2)
    end

    local this  = {
        Name    = name;
        Input   = 0;
    }


    self.__index    = self
    setmetatable(this, self)


    return this
end


return InputBinding