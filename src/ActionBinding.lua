--[ TheEpicTwin ]--

-- // DESCRIPTION // --
--
--
--
--

-- // CONSTANTS // --

local RENDER_PRIORITY	= Enum.RenderPriority.Input.Value + 5;


-- // MAIN CODE // --

local ActionBinding = {
    ClassName   = "ActionBinding";
}


function ActionBinding:new(actionBindingName)
    local this = {
        Name	= "";

		InputAmount		= 0;

		Active			= false;
		Down			= false;
		InputWasChanged	= false;

        InputBindings	= {};

        InputDown		= nil;		--Signal
        InputBegan		= nil;		--Signal
        InputEnded		= nil;		--Signal
        InputChanged	= nil;		--Signal
		InputMaxed		= nil;		--Signal
		InputUnmaxed	= nil;		--Signal

		InputBindingAdded	= nil;
    }


    self.__index = self
    setmetatable(this, self)


    return this
end


return ActionBinding