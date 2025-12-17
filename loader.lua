local GUIVersion = "1.5"
local lobbyPlaceID = 14904820737
local gamePlaceID = 14904829680
local currentPlaceID = game.PlaceId

local function notify(text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "DBR Tools",
        Text = text,
        Duration = 3
    })
end

local function loadScript(url)
    loadstring(game:HttpGet(url))()
    script:Destroy()
end

local success, err = pcall(function()
    if _G.lobbycheck ~= false then
        if currentPlaceID == lobbyPlaceID then
            notify("Loading lobby version...")
            loadScript("https://raw.githubusercontent.com/itzAkss/dbrtools/main/lobby.lua")
        elseif currentPlaceID == gamePlaceID then
            notify("Loading main version...")
            loadScript("https://raw.githubusercontent.com/itzAkss/dbrtools/main/game.lua")
        else
            notify("Wrong game! PlaceID: " .. currentPlaceID)
            script:Destroy()
        end
    else
        notify("Force loading main version...")
        loadScript("https://raw.githubusercontent.com/itzAkss/dbrtools/main/game.lua")
    end
end)

if not success then
    notify("Error: " .. tostring(err))
    warn(err)
    script:Destroy()
end
