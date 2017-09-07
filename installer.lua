-- // DESCRIPTION // --
--
--  ROBLOX-CONTROL_BINDINGS_FRAMEWORK
--  "Installer"
-- 
--  Authors:
--      - Gabriel Concepcion : TheEpicTwin (ROBLOX) / Twin1Twin2 (GitHub)
--
--  Started: 2017-09-06
--
--  Thanks to Crazyman32, whose install.lua (which I may have copied char for char) for his AeroGameFramework helped me make this installer 
--

-- // SERIVCES // --

local HttpService   = game:GetService("HttpService")


-- // MAIN CODE // --

local FILELIST_URL  = ""


local httpEnabled = http.HttpEnabled
HttpService.HttpEnabled = true




HttpService.HttpEnabled = httpEnabled