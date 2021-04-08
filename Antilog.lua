-- Functions --

local char_to_hex = function(c)
	return string.format("%%%02X", string.byte(c))
end

local function urlencode(url)
	if url == nil then
		return
	end
	url = url:gsub("\n", "\r\n")
	url = url:gsub("([^?&=\n\t ])", char_to_hex)
	url = url:gsub(" ", "+")
	return url
end

local hex_to_char = function(x)
	return string.char(tonumber(x, 16))
end

local urldecode = function(url)
	if url == nil then
		return
	end
	url = url:gsub("+", " ")
	url = url:gsub("%%(%x%x)", hex_to_char)
	return url
end

local tohex = function(num)
	return '0x' .. string.format("%x", num * 255) 
end
local toversionid = function(id)
	local content = game:HttpGet("http://www.roblox.com/studio/plugins/info?assetId=" .. id)
	local versionid = content:match('value="%d+"')
	if versionid then
		versionid = versionid:gsub('value="', ''):gsub('"', '')
		return versionid
	end
end

local randomcase = function(str)
	local u = ""
	for i = 1, #str do
		if math.random(1, 2) == 1 then
			u = u .. string.upper(str:sub(i, i))
		else
			u = u .. string.lower(str:sub(i, i))
		end
	end
	return u
end

local tohex = function(dec)
	return '0X' .. string.format('%x', dec * 255)
end

local minmaxpercent = function(min, max, percent)
	return (max - min) * percent
end
local percentminmax = function(min, max, percent)
	return percent / (max - min)
end

-- Vars --
local players = game:GetService('Players')
local plr = players.LocalPlayer


-- Begin Script --

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ou1z/Axteric/main/UILib.lua"))()
local window = lib:Init('Dollhouse Roleplay', {
	CustomMouse = true	
})

local services = {
    http = game:GetService("HttpService")
}


-- Anti-Log --

local antilog = window:CreateTab('Anti-Log')
local amt_of_baits = 7

local antilogencode = function(assetId)
	local baits = {740256147,6132353845,6132263949,5756764102}
	local line = '--------------------------------------------------------'
	local funnyxd = "For The Audio Loggers:\n\nfor i,v in pairs(game.Players:GetPlayers()) do\n\tif v.Name == 'audiologger' then\n\t\tv:KickInBalls()\n\tend\nend\n\n\n"
	local credits = string.format("0&\n%s\nThis Anti-Log was made by cj! Also %s is sexy.\n%s\n"..funnyxd, line, plr.Name, line)
	local url = ''
	for i = 1, amt_of_baits do
		local bait = baits[math.random(1, #baits)]
		url = url .. '&assetversionid' .. tohex(bait)
		if math.random(1, 3) == 1 then
			url = url .. '&assetversionid=' .. toversionid(assetId)
		elseif i == amt_of_baits and not url:find(toversionid(assetId)) then
			url = url .. '&assetversionid=' .. toversionid(assetId)
		end
		url = url .. ('\n\t\t\t\t\t\t'):rep(5)
	end
	return credits .. urlencode(url)
end

local play = antilog:Box('Asset ID', function(id)
	if #id < 1 or not tonumber(id) then id = '' return end
	id = tonumber(id)

	local boombox = plr.Character:FindFirstChild("BoomBox")
	if not boombox then
		boombox = plr.Backpack:FindFirstChild("BoomBox")
	end
	if not boombox then return end

	local url = antilogencode(id)
	boombox.Parent = plr.Character
	boombox['Remote']:FireServer("PlaySong", url)
end)

------------0

-- Settings --
local settings = window:CreateTab('Settings')
local amountofbaits = settings:Slider('Amount Of Baits', 1, 7, 4, function(value)
    amt_of_baits = value
end)
settings:Button('Load Config', function()
    if isfolder('Axteric') and isfile('Axteric/Config.json') then
        local config = services.http:JSONDecode(readfile('Axteric/Config.json'))
        
        local config_for_game = config.Games['Antilog']
        local baits = config_for_game['Baits']

        amountofbaits:SetValue(tonumber(baits))
    else
        if not isfolder('Axteric') then makefolder('Axteric') end
        if not isfile('Axteric/Config.json') then
            local tbl = {
                Games = {
                    [game.PlaceId] = {
                        Baits = amt_of_baits
                    }
                }
            }
            writefile('Axteric/Config.json', services.http:JSONEncode(tbl))
        end
    end
end)
settings:Button('Save Config', function()
    if isfolder('Axteric') and isfile('Axteric/Config.json') then
        local tbl = services.http:JSONDecode(readfile('Axteric/Config.json'))
        tbl.Games[game.Placeid] = {
            Baits = amt_of_baits
        }
        writefile('Axteric/Config.json', services.http:JSONEncode(tbl))
    else
        if not isfolder('Axteric') then makefolder('Axteric') end
        if not isfile('Axteric/Config.json') then
            local tbl = {
                Games = {
                    [game.PlaceId] = {
                        Baits = amt_of_baits
                    }
                }
            }
            writefile('Axteric/Config.json', services.http:JSONEncode(tbl))
        end
    end
end)
--------------
