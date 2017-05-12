local total = 0
SLASH_GETCOORDS1 = "/getCoords"
SLASH_STOPCOORDS1 = "/stopCoords"
local printCoords = 0

function onUpdate(self,elapsed)
	total = total + elapsed
	if( total >= 1 ) then
		local posX, posY = GetPlayerMapPosition("player")
		if printCoords == 1 and posX ~= nil and posX ~= 0 and posY ~= nil and posY ~= 0 then 
			print(posX)
			print(posY)
		end
		total = 0
	end
end

function MapCoords_OnLoad(self, event,...) 
    self:RegisterEvent("ADDON_LOADED")	
end

function MapCoords_OnEvent(self, event, ...) 
    if event == "ADDON_LOADED" and ... == "MapCoords" then
		SetMapToCurrentZone()
		local f = CreateFrame("frame")
		f:SetScript("OnUpdate", onUpdate)
	end
end

local function handleGetCoords(msg, editbox)
	printCoords = 1
end

SlashCmdList["GETCOORDS"] = handleGetCoords

local function handleStopCoords(msg, editbox)
	printCoords = 0
end

SlashCmdList["STOPCOORDS"] = handleStopCoords