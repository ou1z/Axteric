local Axteric = "https://raw.githubusercontent.com/ou1z/Axteric"
local places = loadstring(game:HttpGet(Axteric .. '/main/Places.lua'))()
_G.Axteric = {}
_G.Axteric.Places = places
local place = places[tostring(game.PlaceId)]
local code = "game.Players.LocalPlayer:Kick('Unsupported Game.')"
if place then
    code = game:HttpGet(Axteric .. place)
end
loadstring(code)()
