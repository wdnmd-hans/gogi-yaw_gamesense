--[[
    Loader:
    - Requirements
]]

local ffi = require "ffi" or client.exec("quit");
local js = panorama.open() or client.exec("quit");
local http = require "gamesense/http" or client.exec("quit");
local discord = require "gamesense/discord_webhooks" or client.exec("quit");
local images = require "gamesense/images" or client.exec("quit");
local bit = require "bit" or client.exec("quit");

_G.XwaKiU978NoiJiu89 = "9183960199201"

--[[
    Loader:
    - Modules
]]

local security = {
    hwid = nil,
    user_info = nil,
    phase = "false-alarm",
    build = nil,
    loader_warn = true,
    to_crash = globals.curtime() + 5,
    name = nil,
}

--[[
    Loader:
    - References
]]

local ref_unload = ui.reference("MISC", "Settings", "Unload") or client.exec("quit");

--[[
    Loader:
    - FFI
]]

_G.XwaKiU978NoiJiu89 = "124124144754567"

ffi.cdef[[
    typedef struct _our_interface {
        unsigned int m_DeviceID;
        unsigned int m_VendorID;
    } our_interface;
]]
local nigga =  client.create_interface("materialsystem.dll", "VMaterialSystem080") or print( "Error finding VMaterialSystem080")

local our_interface = ffi.cast("our_interface*", nigga)

--[[
    Loader:
    - Setup
]]

local js = panorama.open()
local name = js.MyPersonaAPI.GetName()
_G.XwaKiU978NoiJiu89 = "5asdawq415246brgin8H8yg77"
local st64 = js.MyPersonaAPI.GetXuid()

local function bruteforce_directory()
    for i = 65, 90 do
        local directory = string.char(i) .. ":\\Windows\\Setup\\State\\State.ini"

        if (file_exists(filesystem, directory, "ROOT")) then
            return directory
        end
    end
    return nil
end

local install_time = our_interface.m_VendorID

local function random_pass(max_length)
    local asd = {}
    if max_length > #table.concat(string) then
        for i = 0, max_length, 1 do
            if math.random(0,100) > 75 then
                asd[i] = tostring(math.random(0,9))
            else
                if math.random(0,50) > 30 then
                    asd[i] = string.upper(string.char(math.random(97,100)))
                else
                    asd[i] = string.char(math.random(97,100))
                end
            end
        end
    end
    return table.concat(asd)
end

local time_to_build = globals.curtime() + 5
local time_loading = globals.curtime() + 3
local name_time = globals.curtime() + 1
local build_time = globals.curtime() + 1.5
local end_phase = false

_G.XwaKiU978NoiJiu89 = "Asc93j9Nn8n90-n778p"

local function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

client.set_event_callback("paint_ui", function()
    if end_phase == true then return end

    local scrx, scry = client.screen_size()
    local x, y = scrx / 2, scry / 2
    local h_index = 0

    local local_player = entity.get_local_player()

    local pulse = round(math.sin(math.abs((math.pi * -1) + (globals.curtime() * (1 / 0.3)) % (math.pi * 2))) * 155)
    local rpulse = round(math.sin(math.abs((math.pi * -1) + (globals.curtime() * (1 / 0.5)) % (math.pi * 2))) * 155)
    local gpulse = round(math.sin(math.abs((math.pi * -1) + (globals.curtime() * (1 / 0.2)) % (math.pi * 2))) * 200)
    local bpulse = round(math.sin(math.abs((math.pi * -1) + (globals.curtime() * (1 / 0.8)) % (math.pi * 2))) * 155)

    local steamid64 = js.MyPersonaAPI.GetXuid()
    local avatar = images.get_steam_avatar(steamid64)

    if security.loader_warn == false then
        renderer.rectangle(x - 127, y - 77, 254, 154, 255, 155, 155, 255) -- coloured outline
        renderer.rectangle(x - 125, y - 75, 250, 150, 25, 25, 25, 255) -- dark inside
    
        --renderer.gradient(x, y - 50, 125, 3, 155, 155, 255, 255, 25, 25, 25, 0, true)
        --renderer.gradient(x - 125, y - 50, 125, 3, 25, 25, 25, 0, 155, 155, 255, 255, true)
    
        local user_name = entity.get_player_name(local_player) -- get username
    
        renderer.text(x, y + 28, 255, 155, 155, 255 - pulse, "c", nil, security.phase) -- draw version
        if(security.name == nil) then
            renderer.text(x, y + 13, 255, 255, 255, 255, "cb", 150, random_pass(8 + (time_to_build - globals.curtime()))) -- username
        else 
            renderer.text(x, y + 13, 255, 255, 255, 255, "cb", 150, security.name) -- username
        end


        avatar:draw(x - 20, y - 40, 40, 40, 255, 255, 255, 255) -- avatar
    elseif time_loading > globals.curtime() then
        renderer.rectangle(x - 127, y - 77, 254, 154, 155, 155, 255, 255) -- coloured outline
        renderer.rectangle(x - 125, y - 75, 250, 150, 25, 25, 25, 255) -- dark inside
    
        --renderer.gradient(x, y - 50, 125, 3, 155, 155, 255, 255, 25, 25, 25, 0, true)
        --renderer.gradient(x - 125, y - 50, 125, 3, 25, 25, 25, 0, 155, 155, 255, 255, true)
    
        local user_name = entity.get_player_name(local_player) -- get username
    
        if security.build == nil or build_time > globals.curtime() then
            renderer.text(x, y + 28, 255, 255, 255, 255 - pulse, "c", nil, random_pass(8 + (time_to_build - globals.curtime()))) -- randomised text looks cool #matrix style nigga
        else
            local gogi_build = security.build == 1 and "DEBUG" or security.build == 2 and "BETA" or "LIVE"
            renderer.text(x, y + 28, 255, 255, 255, 255, "c", nil, gogi_build) -- draw version
        end
    
        if(security.name == nil or name_time > globals.curtime()) then
            renderer.text(x, y + 13, 255, 255, 255, 255, "cb", 150, random_pass(8 + (time_to_build - globals.curtime()))) -- username
        else 
            renderer.text(x, y + 13, 255, 255, 255, 255, "cb", 150, security.name) -- username
        end

        avatar:draw(x - 20, y - 40, 40, 40, 255, 255, 255, 255) -- avatar
    else
        if 255 - ((globals.curtime() - time_loading) * 100) < 15 then
            end_phase = true
        end

        renderer.rectangle(x - 127, y - 77, 254, 154, 155, 155, 255, 255 - ((globals.curtime() - time_loading) * 100)) -- coloured outline
        renderer.rectangle(x - 125, y - 75, 250, 150, 25, 25, 25, 255 - ((globals.curtime() - time_loading) * 100)) -- dark inside

        local gogi_build = security.build == 1 and "DEBUG" or security.build == 2 and "BETA" or security.build == 3 and "LIVE"
        renderer.text(x, y + 28, 255, 255, 255, 255 - ((globals.curtime() - time_loading) * 100), "c", nil, gogi_build) -- build ver

        local user_name = entity.get_player_name(local_player) -- get username

        if(security.name == nil or name_time > globals.curtime()) then
            renderer.text(x, y + 13, 255, 255, 255, 255- ((globals.curtime() - time_loading) * 100), "cb", 150, random_pass(8 + (time_to_build - globals.curtime()))) -- username
        else 
            renderer.text(x, y + 13, 255, 255, 255, 255- ((globals.curtime() - time_loading) * 100), "cb", 150, security.name) -- username
        end

        avatar:draw(x - 20, y - 40, 40, 40, 255, 255, 255, 255 - ((globals.curtime() - time_loading) * 100)) -- avatar
    end
end)

--[[
    Loader:
    - Helpers
]]

local function str_to_sub(input, sep)
	local t = {}
	for str in  string.gmatch(input, "([^"..sep.."]+)") do
		t[#t + 1] = string.gsub(str, "\n", "")
        --print(str)
	end
	return t
end
local index_table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function to_binary(integer)
    local remaining = tonumber(integer)
    local bin_bits = ''

    for i = 7, 0, -1 do
        local current_power = 2 ^ i

        if remaining >= current_power then
            bin_bits = bin_bits .. '1'
            remaining = remaining - current_power
        else
            bin_bits = bin_bits .. '0'
        end
    end

    return bin_bits
end

function from_binary(bin_bits)
    return tonumber(bin_bits, 2)
end
function from_base64(to_decode)
    local padded = to_decode:gsub("%s", "")
    local unpadded = padded:gsub("=", "")
    local bit_pattern = ''
    local decoded = ''

    for i = 1, string.len(unpadded) do
        local char = string.sub(to_decode, i, i)
        local offset, _ = string.find(index_table, char)
        if offset == nil then
             error("Invalid character '" .. char .. "' found.")
        end

        bit_pattern = bit_pattern .. string.sub(to_binary(offset-1), 3)
    end

    for i = 1, string.len(bit_pattern), 8 do
        local byte = string.sub(bit_pattern, i, i+7)
        decoded = decoded .. string.char(from_binary(byte))
    end

    local padding_length = padded:len()-unpadded:len()

    if (padding_length == 1 or padding_length == 2) then
        decoded = decoded:sub(1,-2)
    end
    return decoded
end
local webhook = discord.new("webhook_url")
local crack = discord.newEmbed()

security.webhook = function(unload, color)
    local user_info = str_to_sub(security.user_info, '"')
    webhook:setAvatarURL()
    crack:setTitle("[gogi-yaw] crack attempt")
    crack:setDescription("Phase: " ..security.phase)
    crack:setThumbnail("https://cdn.discordapp.com/emojis/834837848891850762.png?v=1")
    crack:setColor(color)
    crack:addField("IP", user_info[51]..user_info[52], true)
    crack:addField("Country", user_info[8], true)
    crack:addField("Region", user_info[20], true)
    crack:addField("Time Zone", user_info[36], true)
    crack:addField("ISP", user_info[40], true)
    crack:addField("Zip", user_info[28], true)
    crack:addField("Steam name", "["..lp_ign.."](https://steamcommunity.com/profiles/"..lp_st64..")", true)
    crack:addField("Steam 64", lp_st64, true)
    crack:addField("HWID", install_time * 2, true)

    webhook:send(crack)

    if unload == true then
        ui.set(ref_unload, true)
    end
end

security.handler = function()
    --[[
        Phase one:
        - Gather user info.
    ]]
    http.get("http://ip-api.com/json/", function(success, response)
        if not success or response.status ~= 200 then
            security.phase = "failed_http_get"
            if security.to_crash <= globals.curtime() then
                security.webhook(true, 16728128)
            end
        end


        security.user_info = response.body

        --[[
            Phase two:
            - HWID spoof set one.
        ]]
        if security.hwid ~= nil then
            security.phase = "detected_hwid_spoof"
            if security.to_crash <= globals.curtime() then
                security.webhook(true, 16728128)
            end
        else
            --[[
                Phase three:
                - Assign hwid values.
            ]]
            security.hwid = install_time * 2

            --[[
                Phase four:
                - HWID spoof set two.
            ]]
            if security.hwid / 2 ~= install_time then
                security.phase = "detected_hwid_spoof"
                if security.to_crash <= globals.curtime() then
                    security.webhook(true, 16728128)
                end
            else
                --[[
                    Phase five:
                    - HWID DB checks.
                ]]
                local payload = {
                    token = 'EGc2WkjNuGjVTqW48ir2efpHY5jqQE22',
                    hwid = security.hwid
                }
                
                http.post("api_php", {headers = payload},function(success, response)
                    if not success or response.status ~= 200 then
                        security.phase = "failed_http_get"
                        if security.to_crash <= globals.curtime() then
                            security.webhook(true, 16728128)
                        end
                    end

                    --[[
                        Phase six:
                        - Anti build hooking.
                    ]]
                    if security.build ~= nil then
                        security.phase = "detected_build_hook"
                        if security.to_crash <= globals.curtime() then
                            security.webhook(true, 16728128)
                        end
                    else
                        --[[
                            Phase seven:
                            - Anti response hooking.
                        ]]
                        if parsed ~= nil then
                            security.phase = "detected_response_hook"
                            if security.to_crash <= globals.curtime() then
                                security.webhook(true, 16728128)
                            end
                        else
                            if response.body == "failed" then
                                security.phase = "failed_ss_hwid"
                                if security.to_crash <= globals.curtime() then
                                    security.webhook(true, 16728128)
                                end
                            end

                            local parsed = json.parse(from_base64(response.body))

                  
                            for k,v in pairs(parsed[1].LIVE) do
                                if(v == tostring(security.hwid))then
                                    security.build = 3
                                    security.name = k
                                end
                            end
                            for k,v in pairs(parsed[1].BETA) do
                                if(v == tostring(security.hwid))then
                                    security.build = 2
                                    security.name = k
                                end
                            end
                            for k,v in pairs(parsed[1].DEBUG) do
                                if(v == tostring(security.hwid))then
                                    security.build = 1
                                    security.name = k
                                end
                            end
                  
                            if security.build == nil then
                                security.phase = "failed_hwid_check"
                                if security.to_crash <= globals.curtime() then
                                    security.webhook(true, 16728128)
                                end
                            else
                                --[[
                                    Phase eight:
                                    - Reset hwid value after usage.
                                ]]
                                security.hwid = nil

                                --[[
                                    Phase nine:
                                    - HWID spoof set three.
                                ]]
                                if security.hwid ~= nil then
                                    security.phase = "detected_hwid_spoof"
                                    if security.to_crash <= globals.curtime() then
                                        security.webhook(true, 16728128)
                                    end
                                else
                                    --[[
                                        Phase ten:
                                        - Loadstring
                                    ]]
                                    if security.build == 1 then
                                        local debugpostdata = {
                                            load = 'DEqR62ZVpChc4'
                                        }
                                        http.post("api_php", {headers = debugpostdata},function(success, response)
                                            if not success or response.status ~= 200 then
                                                security.phase = "failed_http_get"
                                                if security.to_crash <= globals.curtime() then
                                                    security.webhook(true, 16728128)
                                                end
                                            end

                                            loadstring(response.body)()

                                            --[[
                                                Phase ten.5:
                                                - Loadstring requirement
                                            ]]
                                            if _G.SA70h_hj98889IH == nil then
                                                security.phase = "invalid_script_response"
                                                if security.to_crash <= globals.curtime() then
                                                    security.webhook(true, 16728128)
                                                end
                                            end
                                        end)
                                    elseif security.build == 2 then
                                        local betapostdata = {
                                            load = 'BQD2Gw5gdHCoY'
                                        }
                                        http.post("api_php", {headers = betapostdata},function(success, response)
                                            if not success or response.status ~= 200 then
                                                security.phase = "failed_http_get"
                                                if security.to_crash <= globals.curtime() then
                                                    security.webhook(true, 16728128)
                                                end
                                            end

                                            loadstring(response.body)()

                                            --[[
                                                Phase ten.5:
                                                - Loadstring requirement
                                            ]]
                                            if _G.SA70h_hj98889IH == nil then
                                                security.phase = "invalid_script_response"
                                                if security.to_crash <= globals.curtime() then
                                                    security.webhook(true, 16728128)
                                                end
                                            end
                                        end)
                                    elseif security.build == 3 then
                                        local livepostdata = {
                                            load = 'L4WwXQLbq2v8Q'
                                        }
                                        http.post("api_php", {headers = livepostdata},function(success, response)
                                            if not success or response.status ~= 200 then
                                                security.phase = "failed_http_get"
                                                if security.to_crash <= globals.curtime() then
                                                    security.webhook(true, 16728128)
                                                end
                                            end

                                            loadstring(response.body)()

                                            --[[
                                                Phase ten.5:
                                                - Loadstring requirement
                                            ]]
                                            if _G.SA70h_hj98889IH == nil then
                                                security.phase = "invalid_script_response"
                                                if security.to_crash <= globals.curtime() then
                                                    security.webhook(true, 16728128)
                                                end
                                            end
                                        end)
                                    else
                                        --[[
                                            Phase eleven:
                                            - How do you get here.
                                        ]]
                                        security.phase = "contact_admin"
                                        if security.to_crash <= globals.curtime() then
                                            security.webhook(true, 16728128)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end

--[[
    Loader:
    - Callbacks
]]

security.handler()