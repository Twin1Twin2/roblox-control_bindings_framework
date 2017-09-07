--[ TheEpicTwin (ROBLOX); Twin1Twin2 (GitHub) ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MODULES // --

local Signal    = require(script.Parent.Signal)


-- // CONSTANTS // --

local RENDER_PRIORITY   = Enum.RenderPriority.Input.Value + 5;


-- // MAIN CODE // --

local ActionBinding = {
    ClassName   = "ActionBinding";
}


--  HAS INPUT BINDING (  )
--
--
--
--

function ActionBinding:HasInputBinding(inputName)
    if (typeof(inputName) == "EnumItem") then
        inputName   = inputName.Name
    elseif (type(inputName) ~= "string") then
        SendError("HasInputBinding(  ) - Argument [1] must be a string or EnumItem value!", 2)
    end
    for _, inputBinding in pairs(self.InputBindings) do
        if (inputBinding.Name == inputName) then
            return true
        end
    end
    return false
end


--  ADD INPUT BINDING (  )
--
--
--
--

function ActionBinding:AddInputBinding(inputBinding)
    if not (type(inputBinding) == "table" and inputBinding.ClassName == "InputBinding") then
        SendError("AddInputBinding(  ) - Argument [1] is not an \"InputBinding\"", 2)
    end
	
    table.insert(self.InputBindings, inputBinding)
    self.InputBindingAdded:Fire(inputBinding)
end


--  REMOVE INPUT BINDING (  )
--
--
--
--

function ActionBinding:RemoveInputBinding(inputName)
    local functionName  = "RemoveInputBinding(  ) - "
    if (type(inputName) == "number") then
        if (inputName <= 0) then
            SendError(functionName .. "Argument [1] must be greater than zero!", 2)
        elseif (inputName % 1 ~= 0) then
            SendError(functionName .. "Argument [1] must be an integer!", 2)
        end
        table.remove(self.InputBindings, inputName)
    elseif (type(inputName) == "string") then
        for index, inputBinding in pairs(self.InputBindings) do
            if (inputBinding.Name == inputName) then
                table.remove(self.InputBindings, index)
                return
            end
        end
        SendError(functionName .. "Unable to remove InputBinding \"" .. inputName .. "\"")
    else
        SendError(functionName .. "Argument [1] is not a valid type! Must be either a string or unsigned integer!", 2)
    end
end


--  SET INPUT AMOUNT (  )
--
--
--
--

function ActionBinding:SetInputAmount(amount)
    if (type(amount) ~= "number") then
        SendError("SetInputAmount() - Argument [1] must be a number!", 2)
    elseif (amount < 0 or amount > 1  then
        SendError("SetInputAmount() - Argument [1] must be a number from 0 to 1! [1] = " .. tostring(amount), 2)
    end
	
    local currentAmount = self.InputAmount
    self.InputAmount    = amount
	
    if (amount > 0) then
        self.Down   = true
        self.InputDown:Fire(amount)
    else	
        self.Down   = false
    end
	
    if (currentAmount ~= amount) then
        if (currentAmount == 0) then
            self.InputBegan:Fire()
        elseif (amount == 0) then
            self.InputEnded:Fire()
        else
            self.InputChanged:Fire()
            if (currentAmount >= 1) then
                self.InputUnmaxed:Fire()
            elseif (amount >= 1) then
                self.InputMaxed:Fire()
            end
        end
    end
end


--  CLEAR INPUT AMOUNT (  )
--
--
--
--

function ActionBinding:ClearInputAmount()
    for inputName, input in pairs(self.InputBindings) do
        self.InputBindings[inputName].Input	= 0
    end
    self:Update()
end


--  UPDATE (  )
--
--
--
--

function ActionBinding:Update()
    local inputAmount   = 0
	
	for inputName, inputBinding in pairs(self.InputBindings) do
        if (inputBinding.Input > inputAmount) then
            inputAmount = inputBinding.Input
        end
    end
	
    inputAmount = math.max(inputAmount, 0)
    inputAmount = math.min(inputAmount, 1)
	
    self:SetInputAmount(inputAmount)
end


--  ENABLE (  )
--
--
--
--

function ActionBinding:Enable()
    if (self.Active == true) then
        return
    end
end


--  DISABLE (  )
--
--
--
--

function ActionBinding:Disable()
    if (self.Active == false) then
        return
    end
end


--  NEW (  )
--
--
--
--

function ActionBinding:new(actionBindingName)
    if (type(actionBindingName) ~= "string") then
        --error
    end

    local this = {
        Name            = actionBindingName;

        InputAmount     = 0;

        Active          = false;
        Down            = false;
        InputWasChanged = false;

        InputBindings   = {};

        InputDown       = Signal:new();     --Signal
        InputBegan      = Signal:new();     --Signal
        InputEnded      = Signal:new();     --Signal
        InputChanged    = Signal:new();     --Signal
        InputMaxed      = Signal:new();     --Signal
        InputUnmaxed    = Signal:new();     --Signal

        InputBindingAdded	= Signal:new();
    }


    self.__index = self
    setmetatable(this, self)

    return this
end


return ActionBinding