function MapCoords_OnLoad(self, event,...) 
    self:RegisterEvent("ADDON_LOADED")	
end

function MapCoords_OnEvent(self, event, ...) 

    if event == "ADDON_LOADED" and ... == "MapCoords" then
        message('HelloWorld')	
	end
end