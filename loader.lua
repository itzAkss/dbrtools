local GUIVersion = "1.4"

local allowedPlaceIDs = {14904829680} --dbr ingame ebatb
local lobbyPlaceID = 14904820737 --dbr lobby ebatb
local startergui = game:GetService("StarterGui")

local function isPlaceAllowed()
	for _, id in ipairs(allowedPlaceIDs) do
		if game.PlaceId == id then
			return true
		end
	end
	return false
end

local success, err = pcall(function()
	if lobbycheck == nil or lobbycheck == true then
		if game.PlaceId == lobbyPlaceID then
			startergui:SetCore("SendNotification", {
				Title = "DBR Tools",
				Text = "Loading lobby version...",
				Duration = 3
			})
			loadstring(game:HttpGet("https://raw.githubusercontent.com/itzAkss/dbrtools/refs/heads/main/lobby.lua"))()
			script:Destroy()
			return
		elseif isPlaceAllowed() then
			startergui:SetCore("SendNotification", {
				Title = "DBR Tools",
				Text = "Loading main version...",
				Duration = 3
			})
			loadstring(game:HttpGet("https://raw.githubusercontent.com/itzAkss/dbrtools/refs/heads/main/game.lua"))()
			script:Destroy()
			return
		else
			startergui:SetCore("SendNotification", {
				Title = "DBR Tools",
				Text = "Wrong game! PlaceID: " .. game.PlaceId,
				Duration = 5
			})
			script:Destroy()
			return
		end

	else
		if not isPlaceAllowed() and game.PlaceId ~= lobbyPlaceID then
			startergui:SetCore("SendNotification", {
				Title = "DBR Tools",
				Text = "Wrong game! PlaceID: " .. game.PlaceId,
				Duration = 5
			})
			script:Destroy()
			return
		end

		startergui:SetCore("SendNotification", {
			Title = "DBR Tools",
			Text = "Force loading main version...",
			Duration = 3
		})
		loadstring(game:HttpGet("https://raw.githubusercontent.com/itzAkss/dbrtools/refs/heads/main/game.lua"))()
		script:Destroy()
		return
	end
end)

if not success then
	startergui:SetCore("SendNotification", {
		Title = "DBR Tools",
		Text = "Error: " .. tostring(err),
		Duration = 6
	})
	warn(err)
	script:Destroy()
end
--naxyu idi zaebalsa
