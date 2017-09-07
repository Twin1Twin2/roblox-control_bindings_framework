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


local httpEnabled   = http.HttpEna  bled
HttpService.HttpEnabled = true

local function CreateModuleScript(scriptName, sourceURL)
    local source    = HTTPService:GetAsync(sourceURL, true)
    
    local moduleScript  = Instance.new("ModuleScript")
        moduleScript.Source = source
        moduleScript.Name   = scriptName

    return moduleScript
end

local fileListJSON  = HTTPService:GetAsync(FILELIST_URL, true)
local fileList      = HttpService:JSONDecode(fileListJSON)

local URL               = fileList.url
local moduleExtension   = fileList.modules_folder
local mainPath          = fileList.main
local modulesPaths      = fileList.modules




for _, module in pairs(modulesPaths) do

end


HttpService.HttpEnabled = httpEnabled