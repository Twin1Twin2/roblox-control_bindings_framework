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

local HttpService       = game:GetService("HttpService")
local SelectionService  = game:GetService("Selection")


-- // MAIN CODE // --

local FILELIST_URL  = ""

local MODULE_NAME       = "ControlBindingsFramework"
local DEFAULT_PARENT    = game.Workspace


local httpEnabled   = http.HttpEnabled
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

local mainModule    = CreateModuleScript(MODULE_NAME, URL .. mainPath)


for _, module in pairs(modulesPaths) do
    local sourceURL     = URL .. moduleExtension .. modules
    local scriptName    = module:match()

    local moduleScript  = CreateModuleScript(scriptName, sourceURL)
        moduleScript.Parent = mainModule
end

mainModule.Parent   = DEFAULT_PARENT

Selection:Set({mainModule})     --needs some testing to see if it works

HttpService.HttpEnabled = httpEnabled