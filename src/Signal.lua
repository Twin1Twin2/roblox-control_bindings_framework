--[ TheEpicTwin (ROBLOX); Twin1Twin2 (GitHub) ]--

-- // DESCRIPTION // --
--
--
--
--

-- // MAIN CODE // --

local Signal	= {}

function Signal.new(name)
	local this	= {
		ClassName	= "Signal";
		Name		= "";
	}
	
	this.Name	= name or nil
	
	local signaler				= Instance.new("BindableEvent")
	local args					= {}
	local connected_functions	= {}
	
	signaler.Name	= this.Name

	function this:Connect(func)
		if ((func == nil) or (type(func) ~= "function")) then
			error("Signal \"" .. self.Name .. "\" - Argument [1] is not a function! Type [1] = " .. type(func), 2)
		end
		
		local signalevent = signaler.Event:connect(function()
			func(unpack(args))
		end)
		
		table.insert(connected_functions, signalevent)
		
		return signalevent
	end
	
	function this:Fire(...)
		args	= {...}
		signaler:Fire()
	end
	
	function this:ClearConnected()
		for index, value in pairs (connected_functions) do
			if (value.Connected == true) then
				value:disconnect()
			end
		end
	end
	
	function this:Destroy()
		signaler:Destroy()
		signaler	= nil
		args		= nil
		this:ClearConnected()
	end
	
	return this
end

return Signal