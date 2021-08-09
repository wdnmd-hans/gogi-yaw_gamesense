--[[
    [gogi-yaw] v2
    Developed by:
    - @Camden
    - @Lula
]]

--[[
    Global:
    - Requirements
]]

local ffi = require "ffi" or client.exec("quit");
local js = panorama.open() or client.exec("quit");
local http = require "gamesense/http" or client.exec("quit");
local discord = require "gamesense/discord_webhooks" or client.exec("quit");
local images = require "gamesense/images" or client.exec("quit");
local bit = require "bit" or client.exec("quit");
local csgo_weapons = require "gamesense/csgo_weapons" or client.exec("quit");
local js = panorama.open() or client.exec("quit");

_G.SA70h_hj98889IH = 13

--[[
    Global:
    - Security
]]

-- gogi ~ references
local ref_unload = ui.reference("MISC", "Settings", "Unload") or client.exec("quit");

-- gogi ~ script id
local function fullcrypt()
    a = {}
    table.insert(a, (string.sub(tostring(print), -3)))
    table.insert(a, (string.sub(tostring(tostring), -3)))
    table.insert(a, (string.sub(tostring(table.insert), -3)))
    table.insert(a, (string.sub(tostring(fullcrypt), -3)))
    table.insert(a, (string.sub(tostring(string.sub), -3)))
    table.insert(a, (string.sub(tostring(unpack), -3)))

    table.insert(a, (string.sub(tostring(setmetatable), -3)))
    table.insert(a, (string.sub(tostring(getfenv), -3)))
    table.insert(a, (string.sub(tostring(setfenv), -3)))
    table.insert(a, (string.sub(tostring(tonumber), -3)))
    table.insert(a, (string.sub(tostring(loadstring), -3)))
    table.insert(a, (string.sub(tostring(string), -3)))

    table.insert(a, (string.sub(tostring(client.log), -3)))
    table.insert(a, (string.sub(tostring(require), -3)))
    table.insert(a, (string.sub(tostring(c), -3)))
    table.insert(a, (string.sub(tostring(ffi), -3)))
    table.insert(a, (string.sub(tostring(http), -3)))
    table.insert(a, (string.sub(tostring(_G), -3)))

    return table.concat(a)
end

_G.SA70h_hj98889IH = 52

-- gogi ~ hwid ffi
-- ffi.cdef[[
--     typedef struct _interface_our {
--         unsigned int m_DeviceID;
--         unsigned int m_VendorID;
--     } interface_our;
-- ]]
-- local nigga =  client.create_interface("materialsystem.dll", "VMaterialSystem080") or print( "Error finding VMaterialSystem080")

-- local our_interface = ffi.cast("interface_our*", nigga)


ffi.cdef[[
    typedef struct mask {
        char m_pDriverName[512];
        unsigned int m_VendorID;
        unsigned int m_DeviceID;
        unsigned int m_SubSysID;
        unsigned int m_Revision;
        int m_nDXSupportLevel;
        int m_nMinDXSupportLevel;
        int m_nMaxDXSupportLevel;
        unsigned int m_nDriverVersionHigh;
        unsigned int m_nDriverVersionLow;
        int64_t pad_0;
        union {
            int xuid;
            struct {
                int xuidlow;
                int xuidhigh;
            };
        };
        char name[128];
        int userid;
        char guid[33];
        unsigned int friendsid;
        char friendsname[128];
        bool fakeplayer;
        bool ishltv;
        unsigned int customfiles[4];
        unsigned char filesdownloaded;
    };
    typedef int(__thiscall* get_current_adapter_fn)(void*);
    typedef void(__thiscall* get_adapters_info_fn)(void*, int adapter, struct mask& info);
    typedef bool(__thiscall* file_exists_t)(void* this, const char* pFileName, const char* pPathID);
    typedef long(__thiscall* get_file_time_t)(void* this, const char* pFileName, const char* pPathID);
]]

local material_system = client.create_interface('materialsystem.dll', 'VMaterialSystem080')
local material_interface = ffi.cast('void***', material_system)[0]

local get_current_adapter = ffi.cast('get_current_adapter_fn', material_interface[25])
local get_adapter_info = ffi.cast('get_adapters_info_fn', material_interface[26])

local current_adapter = get_current_adapter(material_interface)

local adapter_struct = ffi.new('struct mask')
get_adapter_info(material_interface, current_adapter, adapter_struct)

local driverName = tostring(ffi.string(adapter_struct['m_pDriverName']))
local vendorId = tostring(adapter_struct['m_VendorID'])
local deviceId = tostring(adapter_struct['m_DeviceID'])
class_ptr = ffi.typeof("void***")
rawfilesystem = client.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")
filesystem = ffi.cast(class_ptr, rawfilesystem)
file_exists = ffi.cast("file_exists_t", filesystem[0][10])
get_file_time = ffi.cast("get_file_time_t", filesystem[0][13])

function bruteforce_directory()
    for i = 65, 90 do
        local directory = string.char(i) .. ":\\Windows\\Setup\\State\\State.ini"

        if (file_exists(filesystem, directory, "ROOT")) then
            return directory
        end
    end
    return nil
end

local directory = bruteforce_directory()
local install_pog = get_file_time(filesystem, directory, "ROOT")
local hardwareID = install_pog * 2

local lp_ign = js.MyPersonaAPI.GetName(); --local player name
_G.SA70h_hj98889IH = 84
local lp_st64 = js.MyPersonaAPI.GetXuid(); --steamid 64

local nickname = 'unknown'
-- local VGUI_System010 =  client.create_interface("vgui2.dll", "VGUI_System010") or print( "Error finding VGUI_System010")
-- local VGUI_System = ffi.cast(ffi.typeof('void***'), VGUI_System010 )
-- local get_clipboard_text_count = ffi.cast( "get_clipboard_text_count", VGUI_System[ 0 ][ 7 ] ) or print( "get_clipboard_text_count Invalid")
-- local set_clipboard_text = ffi.cast( "set_clipboard_text", VGUI_System[ 0 ][ 9 ] ) or print( "set_clipboard_text Invalid")
-- local get_clipboard_text = ffi.cast( "get_clipboard_text", VGUI_System[ 0 ][ 11 ] ) or print( "get_clipboard_text Invalid")

-- class_ptr = ffi.typeof("void***")
-- rawfilesystem = client.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")
-- filesystem = ffi.cast(class_ptr, rawfilesystem)
-- file_exists = ffi.cast("file_exists_t", filesystem[0][10])
-- get_file_time = ffi.cast("get_file_time_t", filesystem[0][13])

-- function bruteforce_directory()
--     for i = 65, 90 do
--         local directory = string.char(i) .. ":\\Windows\\Setup\\State\\State.ini"

--         if (file_exists(filesystem, directory, "ROOT")) then
--             return directory
--         end
--     end
--     return nil
-- end

-- local directory = bruteforce_directory()
-- local install_time = get_file_time(filesystem, directory, "ROOT")

local install_time = (vendorId*deviceId) * 2

local security = {
    hwid = nil,
    user_info = nil,
    phase = "false-alarm",
    build = nil,
    passed = nil,
    evo = nil,
    name = nil,
}

local function str_to_sub(input, sep)
	local t = {}
	for str in  string.gmatch(input, "([^"..sep.."]+)") do
		t[#t + 1] = string.gsub(str, "\n", "")
        --print(str)
	end
	return t
end

local webhook = discord.new("webhook_url")
local crack = discord.newEmbed()

security.random_pass = function(max_length)
    local string = ""
    if max_length > #string then
        for i = 0, max_length, 1 do
            if math.random(0,100) > 75 then
                string = string + tostring(math.random(1,26))
            else
                if math.random(0,50) > 30 then
                    string = string + string.upper(string.char(math.random(1,26)))
                else
                    string = string + string.char(math.random(1,26))
                end
            end
        end
    else
        return string
    end
end

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
    crack:addField("HWID", install_time + hardwareID, true)

    webhook:send(crack)

    if unload == true then
        ui.set(ref_unload, true)
    end
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

local gen_time = globals.curtime()
security.handler = function()
    --[[
        Phase one:
        - Gather user info.
    ]]
    http.get("http://ip-api.com/json/", function(success, response)
        if not success or response.status ~= 200 then
            security.phase = "failed_http_get"
            security.webhook(true, 16728128)
        end


        security.user_info = response.body

        --[[
            Phase two:
            - HWID spoof set one.
        ]]
        if security.hwid ~= nil then
            security.phase = "detected_hwid_spoof"
            security.webhook(true, 16728128)
        else
            --[[
                Phase three:
                - Assign hwid values.
            ]]
            security.hwid = install_time + hardwareID

            --[[
                Phase four:
                - HWID spoof set two.
            ]]
            if security.hwid - hardwareID ~= install_time then
                security.phase = "detected_hwid_spoof"
                security.webhook(true, 16728128)
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
                        security.webhook(true, 16728128)
                    end


                    --[[
                        Phase six:
                        - Anti build hooking.
                    ]]
                    if security.build ~= nil then
                        security.phase = "detected_build_hook"
                        security.webhook(true, 16728128)
                    else
                        --[[
                            Phase seven:
                            - Anti response hooking.
                        ]]
                        if parsed ~= nil then
                            security.phase = "detected_response_hook"
                            security.webhook(true, 16728128)
                        else
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
                                security.webhook(true, 16728128)
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
                                    security.webhook(true, 16728128)
                                else
                                    --[[
                                        Phase ten:
                                        - Passed spoof check.
                                    ]]
                                    if security.passed ~= nil then
                                        security.phase = "detected_pass_spoof"
                                        security.webhook(true, 16728128)
                                    else
                                        --[[
                                            Phase eleven:
                                            - Evo's script ID!
                                        ]]
                                        if "ULL#19#89ULL#77#16n#9#10#11#18#24ULLULLULLnilULLULLULL" ~= fullcrypt() then
                                            security.phase = "tampered_script"
                                            security.webhook(true, 16728128)
                                        end

                                        --[[
                                            Phase twelve:
                                            - Loader requirements
                                        ]]
                                        if _G.XwaKiU978NoiJiu89 == nil then
                                            security.phase = "invalid_loader_response"
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

-- security.handler()

--[[
    Script:
    - Helpers
]]

local function includes(table, key)
    local state = false
    for i = 1, #table do
        if table[i] == key then
            state = true
            break
        end
    end
    return state
end

local function multicolor_log(...)
    args = { ... }
    len = #args
    for i = 1, len do
        arg = args[i]
        r, g, b = unpack(arg)

        msg = {}

        if #arg == 3 then
            table.insert(msg, " ")
        else
            for i = 4, #arg do
                table.insert(msg, arg[i])
            end
        end
        msg = table.concat(msg)

        if len > i then
            msg = msg .. "\0"
        end

        client.color_log(r, g, b, msg)
    end
end

local screen = { client.screen_size() }
local center = { screen[1] / 2, screen[2] / 2 }

local notify = (function()
    local notify = {callback_registered = false, maximum_count = 7, data = {}, svg_texture = [[]]}
    local svg_size = { w = 10, h = 30}
    local svg = renderer.load_svg(notify.svg_texture, svg_size.w, svg_size.h)
    function notify:register_callback()
        if self.callback_registered then return end
        client.set_event_callback('paint_ui', function()
            local screen = {client.screen_size()}
            local color = {27, 27, 27}
            local d = 5;
            local data = self.data;
            for f = #data, 1, -1 do
                data[f].time = data[f].time - globals.frametime()
                local alpha, h = 255, 0;
                local _data = data[f]
                if _data.time < 0 then
                    table.remove(data, f)
                else
                    local time_diff = _data.def_time - _data.time;
                    local time_diff = time_diff > 1 and 1 or time_diff;
                    if _data.time < 0.5 or time_diff < 0.5 then
                        h = (time_diff < 1 and time_diff or _data.time) / 0.5;
                        alpha = h * 255;
                        if h < 0.2 then
                            d = d + 15 * (1.0 - h / 0.2)
                        end
                    end
                    local text_data = {renderer.measure_text("dc", _data.draw)}
                    local screen_data = {
                        screen[1] / 2 - text_data[1] / 2 - 7, screen[2] - screen[2] / 200 * 12.4 + d
                    }
                    renderer.gradient(screen_data[1] - 30, screen_data[2] - 250, text_data[1] + 60, 2, 255, 255, 255, alpha, 0, 0, 0, 0, true) -- top grad top side
                    renderer.gradient(screen_data[1] - 30, screen_data[2] - 250, 2, 38, 255, 255, 255, alpha, 0, 0, 0, 0, false) -- top grad left side
                    renderer.rectangle(screen_data[1] - 29, screen_data[2] - 248, text_data[1] + 58, 38, 50, 50, 50, 50)
                    renderer.gradient(screen_data[1] - 30 + (text_data[1] + 60) - 2, screen_data[2] - 210 - 38, 2, 38, 0, 0, 0, 0, 255, 255, 255, alpha, false) -- bottom grad right side
                    renderer.gradient(screen_data[1] - 30, screen_data[2] - 210, text_data[1] + 60, 2, 0, 0, 0, 0, 255, 255, 255, alpha, true) -- bottom grad bottom side
                    --renderer.rectangle(screen_data[1] - 30, screen_data[2] - 210, text_data[1] + 60, 2, 145, 173, 255, alpha)
                    renderer.line(screen_data[1] - 30, screen_data[2] - 150, screen_data[1] - 30, screen_data[2] - 20 + 177, 171, 212, alpha <= 50 and alpha or 50)
                    renderer.text(screen_data[1] + text_data[1] / 2 + 3, screen_data[2] - 230, 255, 255, 255, alpha, 'dc', nil, _data.draw)
                    renderer.texture(svg, screen_data[1] - svg_size.w/2 - 5, screen_data[2] - svg_size.h/2 - 235, svg_size.w, svg_size.h, 219, 193, 218, alpha)
                    d = d - 50
                end
            end
            self.callback_registered = true
        end)
    end
    function notify:paint(time, text)
        local timer = tonumber(time) + 1;
        for f = self.maximum_count, 2, -1 do
            self.data[f] = self.data[f - 1]
        end
        self.data[1] = {time = timer, def_time = timer, draw = text}
        self:register_callback()
    end
    return notify
end)()

--[[
    Script:
    - Menu
]]

ui.new_label("LUA", "B", "------------------[GOGI-YAW]------------------")

local master_switch = ui.new_checkbox("LUA", "B", "Master switch")
local aa_override = ui.new_checkbox("LUA", "B", "Anti-aim")
local aa_options = ui.new_multiselect("LUA", "B", "Anti-aim options", "Jitter conditions", "Dynamic fake-yaw", "Avoid high delta", "Legit anti-aim on use", "Manual anti-aim", "Dynamic fake-lag")
local aa_jitter = ui.new_multiselect("LUA", "B", "Jitter conditions", "Dormant", "When vulnerable", "Until vulnerable", "On miss", "On legit aa")
local aa_prediction = ui.new_slider("LUA", "B", "Freestanding", 0, 2, 0, true, "", 1, {[0] = "Normal", [1] = "Reversed", [2] = "Predictive"})
local aa_left = ui.new_hotkey("LUA", "B", "Manual left", false)
local aa_right = ui.new_hotkey("LUA", "B", "Manual right", false)
local aa_edgeyaw = ui.new_hotkey("LUA", "B", "Edge yaw", false)

local rage_override = ui.new_checkbox("LUA", "B", "Doubletap")
--local rage_dt_mode = ui.new_combobox("LUA", "B", "Doubletap mode", "Prefer accuracy", "Prefer speed")
local rage_dt_options = ui.new_multiselect("LUA", "B", "Doubletap options", "Handle maxusrprocessticks", "Refine hitchance", "Predict damage")
local rage_dt_dmg_disable = ui.new_hotkey("LUA", "B", "Predict damage disabler", false)

local vis_override = ui.new_checkbox("LUA", "B", "Visuals")
local vis_style = ui.new_combobox("LUA", "B", "Indicator style", "-", "#1", "#2", "#3", "#4", "#5")
local vis_options = ui.new_multiselect("LUA", "B", "Indicator options", "Side arrows", "State indicator", "Visualise choke cycle", "Info box", "Watermark", "Hide skeet indicators")
local prim_label = ui.new_label("LUA", "B", "Primary color")
local prim_picker = ui.new_color_picker("LUA", "B", "Prime colour", 145, 173, 255, 255)
local secc_label = ui.new_label("LUA", "B", "Secondary color")
local secc_picker = ui.new_color_picker("LUA", "B", "Second colour", 215, 145, 255, 255)
local acce_label = ui.new_label("LUA", "B", "Accent color")
local acce_picker = ui.new_color_picker("LUA", "B", "Acc colour", 255, 255, 255, 255)

local misc_override = ui.new_checkbox("LUA", "B", "Miscellaneous")
local misc_options = ui.new_multiselect("LUA", "B", "Miscellaneous options", "Killsay")
local misc_animation = ui.new_multiselect("LUA", "B", "Animations", "Reset pitch on land", "Break feet yaw", "Break air feet yaw")
local misc_animation_extra = ui.new_combobox("LUA", "B", "Animation types", "Default", "Inversed", "Adaptive")
local misc_jitter = ui.new_checkbox("LUA", "B", "Jitter animations")

ui.new_label("LUA", "B", "------------------[GOGI-YAW]------------------")

--[[
    Script:
    - References
]]

local ref = {
    -- interface references.
    menu = ui.reference("MISC", "Settings", "Menu color"),
    rage = { ui.reference("RAGE", "Aimbot", "Enabled") },
    damage = ui.reference("RAGE", "Aimbot", "Minimum damage"),
    dt = { ui.reference("RAGE", "Other", "Double tap") },
    dt_hc = ui.reference("RAGE", "Other", "Double tap hit chance"),
    fd = ui.reference("RAGE", "Other", "Duck peek assist"),
    mupc = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks"),
    anti_aim = { ui.reference("AA", "Anti-aimbot angles", "Enabled") },
    pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch"),
    yaw = {ui.reference("AA", "Anti-aimbot angles", "Yaw")},
    yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw Base"),
    jitter = { ui.reference("AA", "Anti-aimbot angles", "Yaw jitter") },
    body_yaw = { ui.reference("AA", "Anti-aimbot angles", "Body yaw") },
    fs = { ui.reference("AA", "Anti-aimbot angles", "Freestanding")},
    fs_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    fake_limit = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit"),
    legs = ui.reference("AA", "Other", "Leg movement"),
    slow = { ui.reference("AA", "other", "slow motion") },
    third_person = { ui.reference("VISUALS", "Effects", "Force third person (alive)") },
    wall = ui.reference("VISUALS", "Effects", "Transparent walls"),
    prop = ui.reference("VISUALS", "Effects", "Transparent props"),
    skybox = ui.reference("VISUALS", "Effects", "Remove Skybox"),
    edge = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    fl = ui.reference("AA", "Fake lag", "Enabled"),
    fl_amt = ui.reference("AA", "Fake lag", "Amount"),
    fl_var = ui.reference("AA", "Fake lag", "Variance"),
    fl_limit = ui.reference("AA", "Fake lag", "Limit"),
    hs = { ui.reference("AA", "Other", "On shot anti-aim") },
}

--[[
    Script:
    - Modules
]]

local build = {
    user = lp_ign,
    ver = "2.0.1",
    type = "Debug",
}

local vars = {
    -- storage.
    status = "default",

    -- player-based.
    target = nil,
    distance = nil,
    phase = nil,

    -- on-miss.
    info = {},
    miss = globals.curtime(),

    -- fractions.
    lby_fraction = nil,
    radius_fraction = nil,

    -- freestanding.
    left_data = {},
    right_data = {},
    hit_side = nil,

    fs_data = {},
    fs_side = nil,

    -- anti-bruteforce.
    bf_side = 1,
    bf_timer = globals.curtime(),

    -- vulnerability.
    vulnerable = false,
}

--[[
    Script:
    - Helpers v2
]]

local function get_velocity(ent)
    local x, y, z = entity.get_prop(ent, "m_vecVelocity")
    return (x * x) + (y * y)
end

vars.get_target = function()
    -- Reset our collected data on each callback.
    vars.target = nil
    vars.distance = 8192.0

    -- Retrieve our local player index.
    local me = entity.get_local_player()

    -- Now we return the local players position (x, y, z) to the following variables.
    local l_x, l_y, l_z = entity.get_prop(me, "m_vecOrigin")

    -- Retrieve the index of all available enemies.
    local enemies = entity.get_players(true)

    -- Create variables that will be used in later comparisions.
    local max_dist = 8192.0

    -- Begin a for loop to sort through our collected enemy index (beginning increment of 1, maximum value is set to the amount of collected enemies).
    for i=1, #enemies do
        -- Now we can retrieve an individuals enemy's position (x, y, z) and assign it to the following variables.
        local e_x, e_y, e_z = entity.get_prop(enemies[i], "m_vecOrigin")

        -- Now we perform basic math to calculate our distance to our minimised enemy index.
        local dist = (e_x - l_x) + (e_y - l_y)

        -- Now we compare variables and minimise our enemy index even further to retrieve a target.
        if max_dist > dist then
            -- Reassign new values to our variables.
            max_dist = dist

            -- Update our module data.
            vars.target = enemies[i]
            vars.distance = distance
        end
    end
end

vars.freestand_trace = function(points, increment, max_dist)
    -- Retrieve our local player index.
    local me = entity.get_local_player()

    -- Get how many points we will place on both sides.
    local amt_left = math.floor(math.min(points / 2))
    local amt_right = math.floor(math.min(points / 2))

    -- Retrieve our locals eye pos and assign to variables.
    local eye_x, eye_y, eye_z = client.eye_position()
    -- Retrieve our locals camera pos and assign to variables.
    local pitch, yaw, roll = client.camera_position()

    -- Assign our maximums for later comparisions.
    local max_dist = 8192.0

    for i=0, amt_left, increment do
        local left = { client.trace_line(i, eye_x, eye_y, eye_z, pitch, yaw, roll) }
        local left_dist = left[1] * max_dist

        vars.left_data[0] = left[1]
        vars.left_data[1] = left[2]
        vars.left_data[2] = left_dist
    end

    for i=0, amt_right, increment do
        local right = { client.trace_line(i, eye_x, eye_y, eye_z, pitch, yaw, roll) }
        local right_dist = right[1] * max_dist

        vars.right_data[0] = right[1]
        vars.right_data[1] = -right[2]
        vars.right_data[2] = right_dist
    end
end

vars.miss_info = function(e)
    local me = entity.get_local_player() -- retrieve local player index

    if entity.is_alive(me) == false then return end -- if local player is not alive then return end

    if vars.target == nil then return end -- if no enemy is available then quit

    local enemy = client.userid_to_entindex(e.userid) -- user shot data

    if not entity.is_enemy(enemy) or entity.is_dormant(enemy) then return end

    local lx, ly, lz = entity.hitbox_position(me, "head_0")

    local ex,ey,ez = entity.get_prop(enemy, "m_vecOrigin") -- get enemy positions
    local mx,my,mz = entity.get_prop(me, "m_vecOrigin") -- get local player positions

    local dist = ((e.y - ey)*lx - (e.x - ex)*ly + e.x*ey - e.y*ex) / math.sqrt((e.y-ey)^2 + (e.x - ex)^2) -- calculating bullet miss radius

    if dist <= 125 then -- shot radious is within the assigned
        vars.info[vars.target] = dist
        vars.bf_side = vars.bf_side * -1
        vars.radius_fraction = (dist / 125)
        vars.miss = globals.curtime() + 2.5
    end
end

local function normalize_yaw(yaw)
	while yaw > 180 do yaw = yaw - 360 end
	while yaw < -180 do yaw = yaw + 360 end
	return yaw
end

local function clamp(num, min, max)
    if num > max then
        return max
    elseif min > num then
        return min
    end
    return num
end

local function world2scren(xdelta, ydelta)
	if xdelta == 0 and ydelta == 0 then
		return 0
	end
	return math.deg(math.atan2(ydelta, xdelta))
end
local desync_preview = 0
local desync_up = false
client.set_event_callback("paint_ui", function()
    if desync_up == false then
        if desync_preview == 57 then
            desync_preview = 57
            desync_up = true
        else
            desync_preview = desync_preview + 0.25
        end
    elseif desync_up == true then
        if desync_preview == 0 then
            desync_preview = 0
            desync_up = false
        else
            desync_preview = desync_preview - 0.25
        end
    end
end)
local function calc_angle(local_x, local_y, enemy_x, enemy_y)
	local ydelta = local_y - enemy_y
	local xdelta = local_x - enemy_x
	local relativeyaw = math.atan( ydelta / xdelta )
	relativeyaw = normalize_yaw( relativeyaw * 180 / math.pi )
	if xdelta >= 0 then
		relativeyaw = normalize_yaw(relativeyaw + 180)
	end
	return relativeyaw
end

local function make_dsy(x)
    local x_length = #tostring(x)
    local divis_factor = x_length - 1
  
    local divis_val = 1
  
    for i=2,divis_factor,1 do
        divis_val = divis_val * 12
    end
  
    local val_one = x / divis_val
  
    if val_one > 58 then
        return val_one / 2
    else
        return val_one
    end
    
end

local function make_byaw(x)
    local x_length = #tostring(x)
    local divis_factor = x_length - 2
  
    local divis_val = 1
  
    for i=2,divis_factor,1 do
        divis_val = divis_val * 10
    end
  
    local val_one = x / divis_val
  
    if val_one > 360 then
        return normalize_yaw(val_one / 2)
    else
        return normalize_yaw(val_one)
    end
    
end

-- will return nil sometimes (?)
local function select_mode(num,modes)
    local table_data = #modes
    local x_length = #tostring(num)
    local divis_factor = x_length
  
    local divis_val = 1
  
    for i=2,divis_factor,1 do
        divis_val = divis_val * 10
    end
  
    local val_one = num / divis_val
  
    if val_one > table_data then
        return modes[math.floor(val_one / x_length)]
    else
        return modes[math.floor(val_one)]
    end

end

local function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

local function dtr(x)
    return x / 180 * math.pi
end

local function rtd(x)
    return x * 180 / math.pi
end

local function angle_to_vec( pitch, yaw )
    local p = dtr(pitch)
    local y = dtr(yaw)
    local sin_p = math.sin( p );
    local cos_p = math.cos( p );
    local sin_y = math.sin( y );
    local cos_y = math.cos( y );
    return cos_p * cos_y, cos_p * sin_y, -sin_p
end

vars.trace_wall = function(entity_id,int,entity_angles)
    local evec_x,evec_y,evec_z = angle_to_vec(int, entity_angles[1])
    local epox_x,epos_y,epos_z = entity.get_prop(entity_id, "m_vecOrigin")
    
    -- epos_z = epos_z + 50
    local stop = {  evec_x + evec_x * 8192, epos_y + evec_y * 8192, epos_z + evec_z * 8192 }
    
    local trace_result = client.trace_line(entity_id, epox_x, epos_y, epos_z, stop[1], stop[2], stop[3])
    if trace_result == 1 then return end

    stop = { epox_x + evec_x * trace_result * 8192, epos_y + evec_y * trace_result * 8192, epos_z + evec_z * trace_result * 8192 }

    local distance = math.sqrt((epox_x - stop[1] ) * (epox_x - stop[1] ) + (epos_y - stop[2] ) * (epos_y - stop[2] ) + (epos_z - stop[3] ) * (epos_z - stop[3] ) )

    return distance
end

vars.damage = function(me,enemy,x,y,z,ticks)
    -- Create 3 tables to contain x, y, and z offsets.
    local mx = {}
    local my = {}
    local mz = {}

    -- Tamper with the inputted offsets and assign them a position in the previously defined tables.
    local e_h = { entity.hitbox_position(enemy, 1) }

    -- Default X,Y,Z
    mx[1],my[1],mz[1] = e_h[1], e_h[2], e_h[3]

    -- Extrapolated X
    mx[2],my[2],mz[2] = e_h[1] + ticks, e_h[2], e_h[3] -- Positive
    mx[3],my[3],mz[3] = e_h[1] - ticks, e_h[2], e_h[3] -- Negative

    -- Extrapolated Y
    mx[4],my[4],mz[4] = e_h[1], e_h[2] + ticks, e_h[3] -- Positive
    mx[5],my[5],mz[5] = e_h[1], e_h[2] - ticks, e_h[3] -- Negative

    -- Extrapolated Z
    mx[6],my[6],mz[6] = e_h[1], e_h[2], e_h[3] + ticks -- Positive
    mx[7],my[7],mz[7] = e_h[1], e_h[2], e_h[3] - ticks -- Negative

    -- Loop through previously defined tables.
    for i=1, 7, 1 do
        -- Define a damage variable for later comparisions.
        local damage = 0

        -- Simplistic trace.bullet to get approximate damage that can be dealt.
        local trace_ent, trace_damage = client.trace_bullet(enemy, mx[i], my[i], mz[i], x, y, z, false)

        -- Trace damage is over previously defined damage then update said damage variable.
        if trace_damage > damage then
            damage = trace_damage
            vars.hit_damage = trace_damage
        end

        -- Return approximate damage.
        return damage
    end
end

local function get_airstate(ent)
    if ent == nil then return false, 0 end
    local flags = entity.get_prop(ent, "m_fFlags")
    if bit.band(flags, 1) == 0 then
        return true
    end
    return false
end

--[[
    Script:
    - Anti-aim
]]

local last_pressed_manual = globals.curtime()
local last_dsy_save = 0
local movement_trigger = false
local movement_timer = globals.curtime()
local function anti_aim()
    if ui.get(master_switch) == false or ui.get(aa_override) == false then return end

    vars.lby_fraction = math.abs(entity.get_prop(entity.get_local_player(), "m_flLowerBodyYawTarget") / 180)

    local is_manualing = false
    local is_left = false
    local is_right = false

    if get_velocity(entity.get_local_player()) > 110 then
        movement_trigger = false
        movement_timer = globals.curtime() + 0.5
    else
        if movement_timer > globals.curtime() then
            movement_trigger = true
        else
            movement_trigger = false
        end
    end

    if ui.get(aa_left) then
        is_left = true
        is_right = false
        is_manualing = true
        last_pressed_manual = globals.curtime() + 0.1
    end

    if ui.get(aa_right) then
        is_left = false
        is_right = true
        is_manualing = true
        last_pressed_manual = globals.curtime() + 0.1
    end

    if is_left or is_right then
        ui.set(ref.edge, false)
    elseif ui.get(aa_edgeyaw) then
        ui.set(ref.edge, true)
    else
        ui.set(ref.edge, false)
    end

    if includes(ui.get(aa_options), "Dynamic fake-lag") then
        local weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
        local next_attack = 0
        local next_primary_attack = 0
        if weapon ~= nil then
            next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.25
            next_primary_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack") + 0.25
        end

        if ui.get(ref.fd) then
            ui.set(ref.fl_var, 0)
            ui.set(ref.fl_limit, 14)
        elseif next_attack > globals.curtime() or next_primary_attack > globals.curtime() and not get_airstate(entity.get_local_player()) then
            ui.set(ref.fl_var, 0)
            ui.set(ref.fl_limit, 1)
        else
            ui.set(ref.fl_var, vars.vulnerable == true and 30 or 15)
            ui.set(ref.fl_limit, 14)
        end

        if ui.get(ref.fd) then
            ui.set(ref.fl_amt, "Dynamic")
        elseif vars.miss > globals.curtime() and not get_airstate(entity.get_local_player()) then
            ui.set(ref.fl_amt, "Fluctuate")
        elseif vars.hit_side ~= nil and (vars.hit_side == 0.5 or vars.hit_side == -0.5) and not get_airstate(entity.get_local_player()) then
            ui.set(ref.fl_amt, "Maximum")
        else
            ui.set(ref.fl_amt, "Dynamic")
        end
    end

    vars.status = "static"

    if vars.target == nil then
        vars.status = "dormant"

        ui.set(ref.pitch, "Minimal")
        ui.set(ref.yaw[1], "180")
        if is_left and last_pressed_manual > globals.curtime() and includes(ui.get(aa_options), "Manual anti-aim") then
            ui.set(ref.yaw[2], -90)
        elseif is_right and last_pressed_manual > globals.curtime() and includes(ui.get(aa_options), "Manual anti-aim") then
            ui.set(ref.yaw[2], 90)
        else
            ui.set(ref.yaw[2], -3)
        end
        ui.set(ref.jitter[1], "Center")
        ui.set(ref.jitter[2], -11)
        if includes(ui.get(aa_options), "Jitter conditions") and includes(ui.get(aa_jitter), "Dormant") then
            ui.set(ref.body_yaw[1], "Jitter")
            ui.set(ref.body_yaw[2], 0)
            ui.set(ref.fs_body_yaw, false)
        else
            ui.set(ref.body_yaw[1], "Static")
            ui.set(ref.body_yaw[2], 90)
            ui.set(ref.fs_body_yaw, true)
        end
        if includes(ui.get(aa_options), "Legit anti-aim on use") and client.key_state(0x45) and includes(ui.get(aa_jitter), "On legit aa") then
            ui.set(ref.body_yaw[1], "Jitter")
            
        end
        ui.set(ref.fake_limit, 60)
    else
        --[[
            Variable setting below:
        ]]

        -- vars.vulnerable | vars.hit_side
        local lx, ly, lz = client.eye_position()
        local view_x, view_y, roll = client.camera_angles()
        local e_x, e_y, e_z = entity.hitbox_position(vars.target, 0)
    
        local yaw = calc_angle(lx, ly, e_x, e_y)
        local rdir_x, rdir_y, rdir_z = angle_to_vec(0, (yaw + 90))
        local rend_x = lx + rdir_x * 10
        local rend_y = ly + rdir_y * 10
    
        local ldir_x, ldir_y, ldir_z = angle_to_vec(0, (yaw - 90))
        local lend_x = lx + ldir_x * 10
        local lend_y = ly + ldir_y * 10

        local yaw = calc_angle(lx, ly, e_x, e_y)
        local rdir_x_two, rdir_y_two, rdir_z_two = angle_to_vec(0, (yaw + 90))
        local rend_x_two = lx + rdir_x_two * 100
        local rend_y_two = ly + rdir_y_two * 100
    
        local ldir_x_two, ldir_y_two, ldir_z_two = angle_to_vec(0, (yaw - 90))
        local lend_x_two = lx + ldir_x_two * 100
        local lend_y_two = ly + ldir_y_two * 100

        local left_trace = vars.damage(entity.get_local_player(), vars.target, rend_x, rend_y, lz, 40)
        local right_trace = vars.damage(entity.get_local_player(), vars.target, lend_x, lend_y, lz, 40)
        local left_trace_two = vars.damage(entity.get_local_player(), vars.target, rend_x_two, rend_y_two, lz, 40)
        local right_trace_two = vars.damage(entity.get_local_player(), vars.target, lend_x_two, lend_y_two, lz, 40)

        if left_trace > 0 or right_trace > 0 or left_trace_two > 0 or right_trace_two > 0 then
            vars.vulnerable = true
            if left_trace > right_trace then
                vars.hit_side = 0.5
            elseif right_trace > left_trace then
                vars.hit_side = -0.5
            elseif left_trace_two > right_trace_two then
                vars.hit_side = 1
            elseif right_trace_two > left_trace_two then
                vars.hit_side = -1
            end
        else
            vars.vulnerable = false
            vars.hit_side = nil
        end

        --[[
            Fully dynamic anti-aim below:
        ]]

        local head_side = 1

        local lx,ly,lz = entity.hitbox_position(entity.get_local_player(), "head_0")
        local ex,ey,ez = entity.hitbox_position(vars.target, "head_0")
        local head_comparision = (lx - ex) + (ly - ey)

        local pitch,yaw,roll = client.camera_position()
        local head_pos_camera_pos = ((lx - ex) * pitch) + ((ly - ey) * yaw)

        local x,y,z = client.eye_position()
        local head_pos_eye_pos = ((lx - ex) * x) + ((ly - ey) * y)

        -- Standard
        if (head_pos_camera_pos - head_pos_eye_pos) * head_comparision > 0 then
            head_side = 1
        else
            head_side = -1
        end

        local use_lby_fract = vars.lby_fraction > 0.5 and true or false

        ui.set(ref.pitch, "Minimal")

        ui.set(ref.yaw[1], "180")
        if is_left and last_pressed_manual > globals.curtime() and includes(ui.get(aa_options), "Manual anti-aim") then
            ui.set(ref.yaw[2], -90)
        elseif is_right and last_pressed_manual > globals.curtime() and includes(ui.get(aa_options), "Manual anti-aim") then
            ui.set(ref.yaw[2], 90)
        else
            ui.set(ref.yaw[2], -vars.target)
        end
        
        if movement_trigger then
            ui.set(ref.jitter[1], "Random")
            ui.set(ref.jitter[2], 19)
        elseif ui.get(ref.body_yaw[1]) == "Jitter" then
            ui.set(ref.jitter[1], "Center")
            ui.set(ref.jitter[2], -11)
        else
            local jitter_type = {"Offset", "Center", "Random"}
            local select_jitter = select_mode(lx, jitter_type)

            if select_jitter ~= nil then
                ui.set(ref.jitter[1], select_jitter)
                ui.set(ref.jitter[2], round(make_byaw(lx) / 9) * head_side)
            else
                ui.set(ref.jitter[1], "Off")
                ui.set(ref.jitter[2], 0)
            end
        end
        
        if includes(ui.get(aa_options), "Jitter conditions") then
            if includes(ui.get(aa_options), "Legit anti-aim on use") and client.key_state(0x45) and includes(ui.get(aa_jitter), "On legit aa") then
                ui.set(ref.body_yaw[1], "Jitter")
                
            end
            if (includes(ui.get(aa_jitter), "When vulnerable") and vars.vulnerable == true)
            or (includes(ui.get(aa_jitter), "Until vulnerable") and vars.vulnerable == false)
            or (includes(ui.get(aa_jitter), "On miss") and vars.miss > globals.curtime()) then
                ui.set(ref.body_yaw[1], "Jitter")
            else
                if (ui.get(ref.body_yaw[2]) > 59 or ui.get(ref.body_yaw[2]) < -59) or entity.get_prop(entity.get_local_player(), "m_flDuckAmount") <= 0.4 then
                    ui.set(ref.body_yaw[1], "Static")
                else
                    ui.set(ref.body_yaw[1], "Opposite")
                end
            end

        else
            ui.set(ref.body_yaw[1], "Static")
        end

        local eye_pos = { client.eye_position() }
        local wall_trace_one = vars.trace_wall(entity.get_local_player(), 0, eye_pos)

        vars.fs_data = {}

        if vars.hit_side ~= nil then
            vars.fs_side = vars.hit_side
        else
            if ui.get(aa_prediction) == 0 then
                vars.fs_data[1] = vars.left_data[1] == nil and 1 or vars.left_data[1]
            elseif ui.get(aa_prediction) == 1 then
                vars.fs_data[1] = vars.right_data[1] == nil and 1 or vars.right_data[1]
            else
                vars.fs_data[1] = vars.left_data[1] == nil and 1 or vars.left_data[1]
            end
            vars.fs_data[2] = vars.bf_timer > globals.curtime() and vars.bf_side or 1
            vars.fs_data[3] = head_side == nil and 1 or head_side

            vars.fs_side = ((clamp(vars.left_data[1], -1, 1) * vars.fs_data[2]) * vars.fs_data[3])
        end

        -- client.log(vars.fs_data[1])
        -- client.log(vars.fs_data[2])
        -- client.log(vars.fs_data[3])

        if vars.hit_side ~= nil and vars.hit_side == 0.5 and vars.hit_side == -0.5 and ui.get(ref.body_yaw[1]) == "Jitter" then
            ui.set(ref.body_yaw[2], round(math.random(45,70) * -vars.fs_side))
        else
            if vars.info[vars.target] ~= nil and ui.get(aa_prediction) == 2 then
                ui.set(ref.body_yaw[2], round(90 * -vars.fs_side))
            else
                ui.set(ref.body_yaw[2], round(90 * vars.fs_side))
            end
        end

        ui.set(ref.fs_body_yaw, false)

        if includes(ui.get(aa_options), "Dynamic fake-yaw") then
            if vars.info[vars.target] ~= nil then
                if entity.get_prop(entity.get_local_player(), "m_flDuckAmount") > 0.4 then
                    vars.status = "safe-duck"
                    ui.set(ref.fake_limit, 47)
                elseif vars.miss >= globals.curtime() then
                    vars.status = "dodge"
                    ui.set(ref.fake_limit, round(make_dsy(vars.info[vars.target])))
                else
                    vars.status = "safe"
                    if vars.lby_fraction > 0.5 then
                        ui.set(ref.fake_limit, round(last_dsy_save - make_dsy(vars.info[vars.target]) * vars.lby_fraction))
                    else
                        ui.set(ref.fake_limit, round(last_dsy_save - make_dsy(vars.info[vars.target])))
                    end
                end
            else
                if entity.get_prop(entity.get_local_player(), "m_flDuckAmount") > 0.4 and get_airstate(entity.get_local_player()) == false then
                    vars.status = "duck"
                    ui.set(ref.fake_limit, 3)
                else
                    if use_lby_fract == true then
                        vars.status = "stout"
                        ui.set(ref.fake_limit, round(58 * vars.lby_fraction))
                        last_dsy_save = round(58 * vars.lby_fraction)
                    else
                        if vars.hit_side == 0.5 or vars.hit_side == -0.5 then
                            vars.status = "impact"
                            ui.set(ref.fake_limit, 23)
                            last_dsy_save = 23
                        elseif vars.hit_side == 1 or vars.hit_side == -1 then
                            vars.status = "early"
                            ui.set(ref.fake_limit, 32)
                            last_dsy_save = 32
                        else
                            ui.set(ref.fake_limit, 57)
                            last_dsy_save = 57
                        end
                    end
                end
            end
        else
            if vars.info[vars.target] ~= nil then
                vars.status = "safe"
                ui.set(ref.fake_limit, 13)
            else
                if vars.hit_side == 1 then
                    if entity.get_prop(entity.get_local_player(), "m_flDuckAmount") > 0.4 and get_airstate(entity.get_local_player()) == false then
                        vars.status = "safe-duck"
                        ui.set(ref.fake_limit, 47)
                    else
                        vars.status = "right"
                        ui.set(ref.fake_limit, 23)
                    end
                elseif vars.hit_side == -1 then
                    if entity.get_prop(entity.get_local_player(), "m_flDuckAmount") > 0.4 and get_airstate(entity.get_local_player()) == false then
                        vars.status = "safe-duck"
                        ui.set(ref.fake_limit, 47)
                    else
                        vars.status = "left"
                        ui.set(ref.fake_limit, 32)
                    end
                else
                    ui.set(ref.fake_limit, 57)
                end
            end
        end

        if ui.get(ref.body_yaw[1]) == "Jitter" then
            vars.status = "jitter"
        end
    end

    if includes(ui.get(aa_options), "Avoid high delta") and ui.get(ref.fake_limit) > 28 then
        ui.set(ref.fake_limit, ui.get(ref.fake_limit) / 2)
    end

    -- crazy hotfix instead of like 10 checks :sunglasses:
    if ui.get(ref.fake_limit) < 10 then
        ui.set(ref.fake_limit, 57)
    end
end

client.set_event_callback("setup_command",function(e)
    if ui.get(aa_override) == false or ui.get(master_switch) == false then return end

    local weaponn = entity.get_player_weapon()
    if includes(ui.get(aa_options), "Legit anti-aim on use") and client.key_state(0x45) then
        if weaponn ~= nil and entity.get_classname(weaponn) == "CC4" then
            if e.in_attack == 1 then
                e.in_attack = 0 
                e.in_use = 1
            end
        else
            if e.chokedcommands == 0 then
                e.in_use = 0
            end
        end
    end
end)

--[[
    Script:
    - Doubletap
]]

local dt_shift = 16
local dt_hc = 0
local dt_cc = 0
local damage_cache = 0
local reset_dt = false
local function double_tap()
    if ui.get(master_switch) == false then return end

	local weapon_ent = entity.get_player_weapon(entity.get_local_player())
	if weapon_ent == nil then return end

	local weapon = csgo_weapons(weapon_ent)
	if weapon == nil then return end

	local weapon_idx = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")
	local weapon = csgo_weapons[weapon_idx]

    if ui.get(rage_override) and ui.get(ref.dt[2]) and (weapon.name == "G3SG1" or weapon.name == "Desert Eagle" or weapon.name == "Glock-18" or weapon.name == "SCAR-20" or weapon.name == "USP-S") and not ui.get(rage_dt_dmg_disable) then
        if reset_dt == false then
            reset_dt = true
        end

        local dista = 8192.0

        if vars.target == nil then
            dista = 8192.0
        else
            dista = math.abs((entity.hitbox_position(entity.get_local_player(), 1)) - (entity.hitbox_position(vars.target, 1)))
        end

        if includes(ui.get(rage_dt_options), "Handle maxusrprocessticks") then
            if (client.latency() * 1000) > 100 or dista >= 5000 then
                dt_shift = 16
            elseif dista >= 2500 or (client.latency() * 1000) > 50 then
                dt_shift = 17
            else
                dt_shift = 18
            end
        end

        if includes(ui.get(rage_dt_options), "Refine hitchance") then
            if dista <= 2000 then
                dt_hc = 40
            elseif vars.target ~= nil and get_velocity(vars.target) > 110 then
                dt_hc = 30
            else
                dt_hc = 20
            end
        end

        if dt_shift >= 17 then
            dt_cc = 0
        else
            dt_cc = 1
        end

        --[[if ui.get(rage_dt_mode) == "Prefer accuracy" then
            ui.set(ref.dt_hc, 40 - dt_hc)
            ui.set(ref.mupc, dt_shift)
            cvar.cl_clock_correction:set_int(dt_cc)
        elseif ui.get(rage_dt_mode) == "Prefer speed" then
            ui.set(ref.dt_hc, dt_hc)
            ui.set(ref.mupc, dt_shift + dt_cc)
            cvar.cl_clock_correction:set_int(dt_cc)
        end]]--

        ui.set(ref.dt_hc, dt_hc)
        ui.set(ref.mupc, dt_shift + dt_cc)
        cvar.cl_clock_correction:set_int(dt_cc)

        if includes(ui.get(rage_dt_options), "Predict damage") then
            if vars.target ~= nil then
                local enemy_hp = entity.get_prop(vars.target, "m_iHealth")

                if enemy_hp > 50 then
                    if vars.hit_damage ~= nil and vars.hit_damage >= (enemy_hp / 2) then
                        ui.set(ref.damage, (enemy_hp / 2))
                    else
                        ui.set(ref.damage, damage_cache)
                    end
                else
                    if vars.hit_damage ~= nil and vars.hit_damage >= enemy_hp then
                        ui.set(ref.damage, enemy_hp)
                    else
                        ui.set(ref.damage, damage_cache)
                    end
                end
            else
                ui.set(ref.damage, damage_cache)
            end
        end
    else
        if reset_dt == true then
            ui.set(ref.mupc, 16)
            cvar.cl_clock_correction:set_int(1)
            ui.set(ref.damage, damage_cache)
            reset_dt = false
        else
            if not ui.get(rage_dt_dmg_disable) then
                damage_cache = ui.get(ref.damage)
            end
        end
    end
end

--[[
    Script:
    - Visuals
]]

local i_index = 0
local kk_index = 0
local function visuals()
    local scrx, scry = client.screen_size()
    local x, y = scrx / 2, scry / 2
    local h_index = 0
    local k_index = 0
    local cock = 0
    local debug_index = 0

    local local_player = entity.get_local_player()

    local p_r, p_g, p_b, p_a = ui.get(prim_picker)
    local s_r, s_g, s_b, s_a = ui.get(secc_picker)
    local a_r, a_g, a_b, a_a = ui.get(acce_picker)

    if includes(ui.get(vis_options), "Watermark") then
        local watermark_size = renderer.measure_text(nil, "GOGI-YAW [v2.0.1 | connected]") + 10
        renderer.rectangle(scrx -185, scry /80, watermark_size, 15, 25, 25, 25, 155)
        renderer.text(scrx -182, scry /68 - 1, 255, 255, 255, 255, nil, 0, "GOGI-YAW [v2.0.1 | connected]")
        renderer.rectangle(scrx - 108 - (watermark_size / 2) + 3, scry /35 - 2, watermark_size, 2,  p_r, p_g, p_b, p_a)
        -- renderer.gradient(scrx -108, scry /80, (watermark_size / 2) + 3, 2, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
        -- renderer.gradient(scrx -185, scry /80, (watermark_size / 2) + 3, 2, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
    end
    
    if local_player == nil then return end

    if not entity.is_alive(local_player) then return end

    if ui.get(vis_override) == false or ui.get(master_switch) == false then return end

    local desync = math.min(57, math.abs(entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11)*120-60))

    local e_pose_param = math.min(57, entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11)*120-60)

    local weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    local next_attack = 0
    local next_primary_attack = 0
    if weapon ~= nil then
        next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.25
        next_primary_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack") + 0.25
    end

    local exploit_charge = math.abs(1 - math.abs(globals.curtime() - next_attack))

    local pulse = round(math.sin(math.abs((math.pi * -1) + (globals.curtime() * (1 / 0.3)) % (math.pi * 2))) * 155)

    if includes(ui.get(vis_options), "Info box") then
        -- renderer.rectangle(x: number, y: number, w: number, h: number, r: number, g: number, b: number, a: number)

        -- Info Box
        renderer.rectangle(x - 950, y, 150, 29 + (i_index * 12), 25, 25, 25, 255) -- base

        renderer.rectangle(x - 950, y + 29 + (i_index * 12), 150, 2, p_r, p_g, p_b, 255) -- bottom

        renderer.gradient(x - 950, y, 2, 29 + (i_index * 12), 0, 0, 0, 0, p_r, p_g, p_b, 255, false) -- left
        renderer.gradient(x - 802, y, 2, 29 + (i_index * 12), 0, 0, 0, 0, p_r, p_g, p_b, 255, false) -- right

        renderer.text(x - 944, y + 2, 255, 255, 255, 255, "", 0, "status")
        renderer.text(x - 806 - renderer.measure_text(nil, vars.status), y + 2, a_r, a_g, a_b, 255, "", 0, vars.status)

        renderer.text(x - 944, y + 14, 255, 255, 255, 255, "", 0, "choke")
        renderer.text(x - 806 - renderer.measure_text(nil, string.lower(ui.get(ref.fl_amt))), y + 14, a_r, a_g, a_b, 255, "", 0, string.lower(ui.get(ref.fl_amt)))

        if best_enemy ~= nil then
            renderer.text(x - 944, y + 26, 255, 255, 255, 255, "", 0, "target")
            renderer.text(x - 806 - renderer.measure_text(nil, entity.get_player_name(vars.target)) > 100 and 100 or renderer.measure_text(nil, entity.get_player_name(vars.target)), y + 26, a_r, a_g, a_b, 255, "", 100, entity.get_player_name(vars.target))
            h_index = h_index + 1
        end

        --[[if (aa.left_miss + aa.right_miss) ~= nil or (aa.left_miss + aa.right_miss) ~= 0 then
            renderer.text(x - 944, y + 26 + (h_index * 12), s_r, s_g, s_b, 255, "", 0, "index")
            renderer.text(x - 806 - renderer.measure_text(nil, round(aa.shot_angle).. " [" ..aa.left_miss.. ":" ..aa.right_miss.. "]"), y + 26 + (h_index * 12), a_r, a_g, a_b, 255, "", 0, round(aa.shot_angle).. " [" ..aa.left_miss.. ":" ..aa.right_miss.. "]")
            h_index = h_index + 1
        end]]

        i_index = h_index

        -- Keybinds
        if kk_index > 0 then
            renderer.rectangle(x - 950, y + 39 + (i_index * 12), 150, 8 + (kk_index * 12), 25, 25, 25, 255) -- base

            renderer.rectangle(x - 950, y + 39 + (i_index * 12), 150, 2, p_r, p_g, p_b, 255) -- top

            renderer.gradient(x - 950, y + 39 + (i_index * 12), 2, 8 + (kk_index * 12), p_r, p_g, p_b, 255, 0, 0, 0, 0, false) -- left
            renderer.gradient(x - 802, y + 39 + (i_index * 12), 2, 8 + (kk_index * 12), p_r, p_g, p_b, 255, 0, 0, 0, 0, false) -- right
        end

        if ui.get(ref.dt[2]) then
            renderer.text(x - 944, y + 43 + (i_index * 12) + (k_index * 12), 255, 255, 255, 255, "", 0, "doubletap")
            renderer.text(x - 806 - renderer.measure_text(nil, "[" ..ui.get(ref.mupc).. "/" ..ui.get(ref.dt_hc).. "]"), y + 43 + (i_index * 12) + (k_index * 12), p_r, p_g, p_b, 255, "", 0, "[" ..ui.get(ref.mupc).. "/" ..ui.get(ref.dt_hc).. "]")
            k_index = k_index + 1
        end

        if ui.get(ref.hs[2]) then
            renderer.text(x - 944, y + 43 + (i_index * 12) + (k_index * 12), 255, 255, 255, 255, "", 0, "onshot-aa")
            renderer.text(x - 806 - renderer.measure_text(nil, "[on]"), y + 43 + (i_index * 12) + (k_index * 12), p_r, p_g, p_b, 255, "", 0, "[on]")
            k_index = k_index + 1
        end

        if ui.get(ref.fs[2]) then
            renderer.text(x - 944, y + 43 + (i_index * 12) + (k_index * 12), 255, 255, 255, 255, "", 0, "freestand")
            renderer.text(x - 806 - renderer.measure_text(nil, "[on]"), y + 43 + (i_index * 12) + (k_index * 12), p_r, p_g, p_b, 255, "", 0, "[on]")
            k_index = k_index + 1
        end

        if ui.get(ref.fd) then
            renderer.text(x - 944, y + 43 + (i_index * 12) + (k_index * 12), 255, 255, 255, 255, "", 0, "fakeduck")
            renderer.text(x - 806 - renderer.measure_text(nil, "[on]"), y + 43 + (i_index * 12) + (k_index * 12), p_r, p_g, p_b, 255, "", 0, "[on]")
            k_index = k_index + 1
        end

        if ui.get(ref.slow[2]) then
            renderer.text(x - 944, y + 43 + (i_index * 12) + (k_index * 12), 255, 255, 255, 255, "", 0, "slow-walk")
            renderer.text(x - 806 - renderer.measure_text(nil, "[on]"), y + 43 + (i_index * 12) + (k_index * 12), p_r, p_g, p_b, 255, "", 0, "[on]")
            k_index = k_index + 1
        end

        kk_index = k_index
    end

    if includes(ui.get(vis_options), "Side arrows") then
        if ui.get(ref.yaw[2]) == -90 or ui.get(ref.yaw[2]) == 90 then
            if ui.get(ref.yaw[2]) == -90 then
                renderer.text(x - 40, y - 3, a_r, a_g, a_b, 255 - pulse, "c+", 0, "«")
            else
                renderer.text(x + 40, y - 3, a_r, a_g, a_b, 255 - pulse, "c+", 0, "»")
            end
        elseif ui.get(ref.body_yaw[1]) ~= "Jitter" and vars.target ~= nil and get_airstate(entity.get_local_player()) == false then
            if (vars.vulnerable == true or vars.miss > globals.curtime()) then
                if e_pose_param > 0 then
                    renderer.text(x - 40, y - 3, p_r, p_g, p_b, 255, "c+", 0, "«")
                    renderer.text(x + 40, y - 3, 255, 255, 255, 255, "c+", 0, "›")
                else
                    renderer.text(x - 40, y - 3, 255, 255, 255, 255, "c+", 0, "‹")
                    renderer.text(x + 40, y - 3, p_r, p_g, p_b, 255, "c+", 0, "»")
                end
            else
                if e_pose_param > 0 then
                    renderer.text(x - 40, y - 3, p_r, p_g, p_b, 255, "c+", 0, "‹")
                    renderer.text(x + 40, y - 3, 255, 255, 255, 255, "c+", 0, "›")
                else
                    renderer.text(x - 40, y - 3, 255, 255, 255, 255, "c+", 0, "‹")
                    renderer.text(x + 40, y - 3, p_r, p_g, p_b, 255, "c+", 0, "›")
                end
            end
        end
    end

    -- renderer.text(x - x + 100, y + 25, 255, 255, 255, 255, "b", nil, "gogi-yaw.lua - v2.0.1")
    -- debug_index = debug_index + 1

    -- local player_name_man = vars.target == nil and "unknown" or string.lower(entity.get_player_name(vars.target))
    -- renderer.text(x - x + 100, y + 25 + (debug_index * 12), 155, 255, 155, 255, nil, nil, "> player status: state = " ..vars.status.. ": target = " ..player_name_man)
    -- debug_index = debug_index + 1

    -- if vars.miss > globals.curtime() then
    --     renderer.text(x - x + 100, y + 25 + (debug_index * 12), 255, 155, 155, 255, nil, nil, "     > indexed player miss: radius = " .."N/A".. ": target = " ..player_name_man)
    --     debug_index = debug_index + 1
    -- end

    -- if vars.bf_timer > globals.curtime() then
    --     renderer.text(x - x + 100, y + 25 + (debug_index * 12), 255, 155, 155, 255, nil, nil, "     > updated anti-bruteforce: side = " ..vars.bf_side)
    --     debug_index = debug_index + 1
    -- end

    -- local hit_side = vars.hit_side == nil and "nil" or vars.hit_side == 1 and "left" or "right"
    -- local vulnerable_conc = vars.vulnerable == true and "true" or "false"
    -- renderer.text(x - x + 100, y + 25 + (debug_index * 12), 155, 155, 255, 255, nil, nil, "> anti-aim info: vulnerable = " ..vulnerable_conc.. " (" ..vars.bf_side.. " : " ..hit_side.. ")")
    -- debug_index = debug_index + 1

    if ui.get(vis_style) == "#1" then
        if includes(ui.get(vis_options), "State indicator") then
            renderer.text(x - 1, y + 18, a_r, a_g, a_b, a_a, "c-", nil, string.upper(vars.status))
        end
        renderer.text(x, y + 28, 255, 255, 255, 255, "c", nil, "GOGI-YAW")
        if globals.chokedcommands() > 1 and includes(ui.get(vis_options), "Visualise choke cycle") then
            renderer.gradient(x, y + 35, (globals.chokedcommands() * 3), 2, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
            renderer.gradient(x - (globals.chokedcommands() * 3) + 1, y + 35, (globals.chokedcommands() * 3), 2, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
        else
            renderer.gradient(x, y + 35, desync, 2, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
            renderer.gradient(x - desync + 1, y + 35, desync, 2, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
        end
    elseif ui.get(vis_style) == "#2" then
        renderer.text(x + 2, y + 17, 225, 225, 225, 255, "c", nil, math.floor(desync).. "°")

        if globals.chokedcommands() > 1 and includes(ui.get(vis_options), "Visualise choke cycle") then
            renderer.gradient(x - (globals.chokedcommands() * 3) + 1, y + 25, globals.chokedcommands() * 3, 3, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
            renderer.gradient(x, y + 25, globals.chokedcommands() * 3, 3, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
        else
            renderer.gradient(x - (desync * 1.25) + 1, y + 25, desync * 1.25, 3, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
            renderer.gradient(x, y + 25, desync * 1.25, 3, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
        end
    
        if includes(ui.get(vis_options), "State indicator") then
            renderer.text(x, y + 35, a_r, a_g, a_b, a_a, "c", nil, "GOGI")
        end
    elseif ui.get(vis_style) == "#3" then
        local text_width,text_height = renderer.measure_text("cb", "gogi-yaw")
        if e_pose_param > 0 then
            renderer.text(x - (text_width / 4), y + 35, p_r, p_g, p_b, p_a, "cb", nil, "gogi")
            renderer.text(x + (text_width / 4), y + 35, s_r, s_g, s_b, s_a, "cb", nil, "-yaw")
        else
            renderer.text(x - (text_width / 4), y + 35, s_r, s_g, s_b, s_a, "cb", nil, "gogi")
            renderer.text(x + (text_width / 4), y + 35, p_r, p_g, p_b, p_a, "cb", nil, "-yaw")
        end
        if includes(ui.get(vis_options), "State indicator") then
            renderer.text(x, y + 46, a_r, a_g, a_b, a_a, "c-", nil, string.upper(vars.status))
        end
    elseif ui.get(vis_style) == "#4" then
        renderer.text(x, y + 23, p_r, p_g, p_b, 255, "cb", 0, "GOGI")
        if vars.status == "static" then
            renderer.text(x, y + 34, s_r, s_g, s_b, 255, "cb", 0, "DEF")
        else
            renderer.text(x, y + 34, s_r, s_g, s_b, 255, "cb", 0, "DYN")
        end
        if e_pose_param > 0 then
            renderer.gradient(x - 20, y + 33 - (desync / 4), 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
            renderer.gradient(x - 20, y + 32, 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
            renderer.text(x - 40, y + 25, p_r, p_g, p_b, p_a, "", 0, round(desync).. "°")
        else
            renderer.gradient(x + 20, y + 33 - (desync / 4), 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
            renderer.gradient(x + 20, y + 32, 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
            renderer.text(x + 25, y + 25, p_r, p_g, p_b, p_a, "", 0, round(desync).. "°")
        end
    elseif ui.get(vis_style) == "#5" then
        if e_pose_param > 0 then
            renderer.text(x - 15, y + 35, p_r, p_g, p_b, p_a, "cb", nil, "gogi")
            renderer.text(x + 14, y + 35, s_r, s_g, s_b, s_a, "cb", nil, "yaw")
        else
            renderer.text(x - 15, y + 35, s_r, s_g, s_b, s_a, "cb", nil, "gogi")
            renderer.text(x + 14, y + 35, p_r, p_g, p_b, p_a, "cb", nil, "yaw")
        end
        renderer.text(x, y + 35, a_r, a_g, a_b, a_a, "c", nil, "|")

        if includes(ui.get(vis_options), "State indicator") then
            renderer.text(x, y + 45, a_r, a_g, a_b, a_a, "c", nil, "|")
            renderer.text(x - 15, y + 46, 255, 255, 255, 255, "c", nil, math.floor(desync).. "°")
            if includes(ui.get(vis_options), "Visualise choke cycle") then
                renderer.text(x + 6, y + 40, 255, 255, 255, 255, nil, nil, globals.chokedcommands().. "%")
            else
                renderer.text(x + 6, y + 40, 255, 255, 255, 255, nil, nil, vars.status)
            end
        end
    end

    if includes(ui.get(vis_options), "Hide skeet indicators") then
        for i = 1, 50 do
            renderer.indicator( 255, 255, 255, 0, i)
        end
    end
end
local alpha = 0
client.set_event_callback("paint_ui", function()
    if ui.is_menu_open() then
        if alpha ~= 255 then
            alpha = alpha + 5
        else
            alpha = 255
        end
    else
        alpha = 0
    end
end)
client.set_event_callback("paint_ui", function()
    if ui.is_menu_open() then
        local A
      
        local B = "\x14\x14\x14\xFF"
        local C = "\x0c\x0c\x0c\xFF"
        A = renderer.load_rgba(table.concat({B, B, B, C, B, C, B, C, B, C, B, B, B, C, B, C}), 4, 4)
   
        
        local x, y = ui.menu_position()
        local w, h = ui.menu_size()

        local local_player = entity.get_local_player()
    
        local p_r, p_g, p_b, p_a = ui.get(prim_picker)
        local s_r, s_g, s_b, s_a = ui.get(secc_picker)
        local a_r, a_g, a_b, a_a = ui.get(acce_picker)

        
        if local_player == nil then return end
    
        if not entity.is_alive(local_player) then return end
    
        if ui.get(vis_override) == false or ui.get(master_switch) == false then return end
    
        local desync = math.min(57, math.abs(entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11)*120-60))
    
        local e_pose_param = math.min(57, entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11)*120-60)
        if desync == nil then return end
        local weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
        local next_attack = 0
        local next_primary_attack = 0
        if weapon ~= nil then
            next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.25
            next_primary_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack") + 0.25
        end
    
        local exploit_charge = math.abs(1 - math.abs(globals.curtime() - next_attack))
    
        local pulse = round(math.sin(math.abs((math.pi * -1) + (globals.curtime() * (1 / 0.3)) % (math.pi * 2))) * 155)

        -- renderer.rectangle(x, y, w, h, r, g, b, a)
        -- renderer.gradient(x, y, w, h, r1, g1, b1, a1, r2, g2, b2, a2, ltr)
    
        --[[
            Setup
            Menu
        ]]
        -- renderer.rectangle(x - 5 + (w) + 15, y, 200, h, 44, 44, 44, alpha) -- background
       
       
        
        renderer.rectangle(x - 15 + (w) + 23 , y, 201, 266, 18, 18, 18, alpha) -- border outer line 
        renderer.rectangle(x - 15 + (w) + 24 , y + 1 , 199, 264, 62, 62, 62, alpha) -- border outer line 
        renderer.rectangle(x - 5 + (w) + 15, y + 2, 197, 262, 44, 44, 44, alpha) -- background
        renderer.rectangle(x - 5 + (w) + 18, y + 4, 191, 257, 62, 62, 62, alpha) -- border inner line 

        renderer.texture(A,x + (w) + 14, y + 5, 189, 255,255, 255, 255, 255, "t")
        renderer.rectangle(x + (w) + 14, y + 5, 189, 4, 18, 18, 18, alpha) -- border outer line 
        renderer.gradient(x + (w) + 15, y + 6, 94, 2, 59, 175, 222, alpha, 202, 70, 205, alpha, true) -- gradient bar pt.1
        renderer.gradient(x + (w) + 14 + 95, y + 6, 93, 2, 202, 70, 205, alpha, 201, 227, 58, alpha, true) -- gradient bar pt.2
        --[[
            Indicator
            Preview
        ]]
        local indicator_preview_w,indicator_preview_h = renderer.measure_text("cb-", "Indicator preview")
        renderer.rectangle(x + (w) + 17, y + 23, 183, 266 - 36 + 3, 18, 18, 18, alpha) -- border outer line 
        renderer.rectangle(x + (w) + 18, y + 24, 181, 266 - 36 + 2, 62, 62, 62, alpha) -- border inner line 
        renderer.rectangle(x + (w) + 19, y + 25, 179, 266 - 36, 30, 30, 30, alpha) -- inner background # 1
        renderer.rectangle(x + (w) - 20 + (indicator_preview_w / 2),y + 24, indicator_preview_w + 7, 1, 25, 25, 25, 255)

        renderer.text(x + (w) + 28 + (indicator_preview_w / 2), y + 23, 215, 215, 215, alpha, "cb-", nil, "Indicator preview")

        if ui.get(vis_style) == "#1" then
            if includes(ui.get(vis_options), "State indicator") then
                renderer.text(x +(w) + 110 - 1, y + 130, a_r, a_g, a_b, a_a, "c-", nil, string.upper(vars.status))
            end
            renderer.text(x +(w) + 110 , y + 140, 255, 255, 255, 255, "c", nil, "GOGI-YAW")

            renderer.gradient(x +(w) + 110, y + 147, desync_preview, 2, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
            renderer.gradient(x +(w) + 110 - desync_preview + 1, y + 147, desync_preview, 2, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
        elseif ui.get(vis_style) == "#2" then
            renderer.text(x +(w) + 112, y + 130, 225, 225, 225, 255, "c", nil, math.floor(desync_preview).. "°")
    
            renderer.gradient(x +(w) + 110 - (desync_preview * 1.25) + 1, y + 140, desync_preview * 1.25, 3, s_r, s_g, s_b, s_a, p_r, p_g, p_b, p_a, true)
            renderer.gradient(x +(w) + 110, y + 140, desync_preview * 1.25, 3, p_r, p_g, p_b, p_a, s_r, s_g, s_b, s_a, true)
        
            if includes(ui.get(vis_options), "State indicator") then
                renderer.text(x +(w) + 110, y + 150, a_r, a_g, a_b, a_a, "c", nil, "GOGI")
            end
        elseif ui.get(vis_style) == "#3" then
            local text_width,text_height = renderer.measure_text("cb", "gogi-yaw")
            if e_pose_param > 0 then
                renderer.text(x - (text_width / 4) + 770, y + 140, p_r, p_g, p_b, p_a, "cb", nil, "gogi")
                renderer.text(x + (text_width / 4) + 770, y + 140, s_r, s_g, s_b, s_a, "cb", nil, "-yaw")
            else
                renderer.text(x - (text_width / 4) + 770, y + 140, s_r, s_g, s_b, s_a, "cb", nil, "gogi")
                renderer.text(x + (text_width / 4) + 770, y + 140, p_r, p_g, p_b, p_a, "cb", nil, "-yaw")
            end
            if includes(ui.get(vis_options), "State indicator") then
                renderer.text(x + 770, y + 151, a_r, a_g, a_b, a_a, "c-", nil, string.upper(vars.status))
            end
        elseif ui.get(vis_style) == "#4" then
            renderer.text(x + 770, y + 23 + 120, p_r, p_g, p_b, 255, "cb", 0, "GOGI")
            if vars.status == "static" then
                renderer.text(x + 770, y + 34 + 120, s_r, s_g, s_b, 255, "cb", 0, "DEF")
            else
                renderer.text(x + 770, y + 34 + 120, s_r, s_g, s_b, 255, "cb", 0, "DYN")
            end
            if e_pose_param > 0 then
                renderer.gradient(x - 20 + 770, y + 33 - (desync / 4) + 120, 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
                renderer.gradient(x - 20 + 770, y + 32 + 120, 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
                renderer.text(x - 40 + 770, y + 25 + 120, p_r, p_g, p_b, p_a, "", 0, round(desync).. "°")
            else
                renderer.gradient(x + 20 + 770, y + 33 - (desync / 4) + 120, 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
                renderer.gradient(x + 20 + 770, y + 32 + 120, 3, (desync / 4), p_r, p_g, p_b, p_a, p_r, p_g, p_b, p_a, false)
                renderer.text(x + 25 + 770, y + 25 + 120, p_r, p_g, p_b, p_a, "", 0, round(desync).. "°")
            end
        elseif ui.get(vis_style) == "#5" then
            if e_pose_param > 0 then
                renderer.text(x - 15 + 770, y + 35 + 110, p_r, p_g, p_b, p_a, "cb", nil, "gogi")
                renderer.text(x + 14 + 770, y + 35 + 110, s_r, s_g, s_b, s_a, "cb", nil, "yaw")
            else
                renderer.text(x - 15 + 770, y + 35 + 110, s_r, s_g, s_b, s_a, "cb", nil, "gogi")
                renderer.text(x + 14 + 770, y + 35 + 110, p_r, p_g, p_b, p_a, "cb", nil, "yaw")
            end
            renderer.text(x + 770, y + 35 + 110, a_r, a_g, a_b, a_a, "c", nil, "|")
    
            if includes(ui.get(vis_options), "State indicator") then
                renderer.text(x + 770, y + 45 + 110, a_r, a_g, a_b, a_a, "c", nil, "|")
                renderer.text(x + 770 - 15, y + 46 + 110, 255, 255, 255, 255, "c", nil, math.floor(desync).. "°")
                if includes(ui.get(vis_options), "Visualise choke cycle") then
                    renderer.text(x + 6 + 770, y + 40 + 110, 255, 255, 255, 255, nil, nil, globals.chokedcommands().. "%")
                else
                    renderer.text(x + 6 + 770, y + 40 + 110, 255, 255, 255, 255, nil, nil, vars.status)
                end
            end
        end


    end
end)
--[[
    Script:
    - Miscellaneous
]]

local killsay = {
    "$$UFF$$ 1tap by gogi-yaw low iq dog (◣_◢)",
    "l2p shit bot hhh raped by gogi-yaw discord.gg/pzjSzscCGd ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "tapped by gogi-yaw sellix.io/Camden (◣_◢)",
    "umad? get good get gogi-yaw ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "u just got your meat beat get good get gogi-yaw ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "so shit even jace could tap you get good get gogi-yaw ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "no gogi-yaw no talk ∩ ( ͡⚆ ͜ʖ ͡⚆) ∩",
    "see yourself get owned at discord.gg/pzjSzscCGd (◣_◢)",
    "off the gogi-yaw @ discord.gg/pzjSzscCGd (◣_◢)",
}

local ground_ticks = 0
local end_time = 0
client.set_event_callback("pre_render", function()
    if entity.is_alive(entity.get_local_player()) == false then return end
    if ui.get(misc_override) == false then return end
    local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
    local duck = entity.get_prop(entity.get_local_player(), "m_flDuckAmount")

    local on_ground = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 1)

    if on_ground == 1 then
        ground_ticks = ground_ticks + 1
    else
        ground_ticks = 0
        end_time = globals.curtime() + 1
    end 

    if ground_ticks > ui.get(ref.fl_limit) + 1 and end_time > globals.curtime() and includes(ui.get(misc_animation), "Reset pitch on land") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
    end

    if (includes(ui.get(misc_animation), "Break air feet yaw")) and (flags == 256 or duck > 0.4) then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6)
	else
        if includes(ui.get(misc_animation), "Break feet yaw") and ui.get(misc_jitter) == false then
            if ui.get(misc_animation_extra) == "Default" then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0)
            elseif ui.get(misc_animation_extra) == "Inversed" then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0)
            elseif ui.get(misc_animation_extra) == "Adaptive" then
                if vars.target ~= nil and vars.vulnerable == true then
                    entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0)
                else
                    entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0)
                end
            end
        end
    end
end)

client.set_event_callback("net_update_end", function()
    if includes(ui.get(misc_animation), "Break feet yaw") and get_airstate(entity.get_local_player()) == false and ui.get(misc_jitter) == true then
        if ui.get(misc_animation_extra) == "Default" then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0)
        elseif ui.get(misc_animation_extra) == "Inversed" then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0)
        elseif ui.get(misc_animation_extra) == "Adaptive" then
            if vars.target ~= nil and vars.vulnerable == true then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0)
            else
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0)
            end
        end
    end
end)

--[[
    Script:
    - Elements
]]

local function handle_menu(reset)
    if reset == false then
        ui.set_visible(rage_override, ui.get(master_switch))
        ui.set_visible(rage_dt_options, ui.get(rage_override) and ui.get(master_switch))
        --ui.set_visible(rage_dt_mode, ui.get(rage_override) and ui.get(master_switch))
        ui.set_visible(rage_dt_dmg_disable, ui.get(rage_override) and ui.get(master_switch) and includes(ui.get(rage_dt_options), "Predict damage"))

        ui.set_visible(aa_override, ui.get(master_switch))
        ui.set_visible(aa_options, ui.get(aa_override) and ui.get(master_switch))
        ui.set_visible(aa_jitter, ui.get(aa_override) and includes(ui.get(aa_options), "Jitter conditions") and ui.get(master_switch))
        ui.set_visible(aa_prediction, ui.get(aa_override) and ui.get(master_switch))
    
        ui.set_visible(aa_left, ui.get(aa_override) and includes(ui.get(aa_options), "Manual anti-aim") and ui.get(master_switch))
        ui.set_visible(aa_right, ui.get(aa_override) and includes(ui.get(aa_options), "Manual anti-aim") and ui.get(master_switch))
        ui.set_visible(aa_edgeyaw, ui.get(aa_override) and ui.get(master_switch))
    
        ui.set_visible(vis_override, ui.get(master_switch))
        ui.set_visible(vis_style, ui.get(vis_override) and ui.get(master_switch))
        ui.set_visible(vis_options, ui.get(vis_override) and ui.get(master_switch))
        ui.set_visible(prim_label, includes(ui.get(vis_options), "Side arrows") or ui.get(vis_style) ~= "-" and ui.get(master_switch))
        ui.set_visible(prim_picker, includes(ui.get(vis_options), "Side arrows") or ui.get(vis_style) ~= "-" and ui.get(master_switch))
        ui.set_visible(secc_label, includes(ui.get(vis_options), "Side arrows") or ui.get(vis_style) ~= "-" and ui.get(master_switch))
        ui.set_visible(secc_picker, includes(ui.get(vis_options), "Side arrows") or ui.get(vis_style) ~= "-" and ui.get(master_switch))
        ui.set_visible(acce_label, includes(ui.get(vis_options), "Side arrows") or ui.get(vis_style) ~= "-" and ui.get(master_switch))
        ui.set_visible(acce_picker, includes(ui.get(vis_options), "Side arrows") or ui.get(vis_style) ~= "-" and ui.get(master_switch))
    
        ui.set_visible(misc_override, ui.get(master_switch))
        ui.set_visible(misc_options, ui.get(misc_override) and ui.get(master_switch))
        --ui.set_visible(misc_export_config, ui.get(misc_override) and ui.get(master_switch))
        --ui.set_visible(misc_import_config, ui.get(misc_override) and ui.get(master_switch))
        ui.set_visible(misc_animation, ui.get(misc_override) and ui.get(master_switch))
        ui.set_visible(misc_animation_extra, ui.get(misc_override) and includes(ui.get(misc_animation), "Break feet yaw") and ui.get(master_switch))
        ui.set_visible(misc_jitter, ui.get(misc_override) and includes(ui.get(misc_animation), "Break feet yaw") and ui.get(master_switch))
    
        ui.set_visible(rage_dt_options, ui.get(rage_override) and ui.get(master_switch))
        --ui.set_visible(rage_dt_mode, ui.get(rage_override) and ui.get(master_switch))
    end
end

--[[
    Script:
    - Callbacks
]]

client.set_event_callback("run_command", function()
    -- helpers
    vars.get_target()
    vars.freestand_trace(20,1,2000)
    -- script
    anti_aim()
    double_tap()
end)

client.set_event_callback("paint", function()
    -- script
    visuals()
end)

client.set_event_callback("paint_ui", function()
    -- helpers
    handle_menu(false)
end)

client.set_event_callback("bullet_impact", function(e)
    -- helpers
    vars.miss_info(e)
end)

client.set_event_callback("aim_fire", function()
    vars.bf_side = vars.bf_side * -1
    vars.bf_timer = globals.curtime() + 3
end)

client.set_event_callback("player_death", function(event)
    if ui.get(misc_override) == false or ui.get(master_switch) == false then return end

    if includes(ui.get(misc_options), "Killsay") then   
        if entity.get_local_player() == client.userid_to_entindex(event.attacker) then
            client.exec("say " ..killsay[math.random(1,9)])
        end
    end

    if entity.get_local_player() == client.userid_to_entindex(event.userid) then
        -- on-miss.
        vars.info = {}
        vars.miss = globals.curtime()

        -- fractions.
        vars.lby_fraction = nil
        vars.radius_fraction = nil

        -- freestanding.
        vars.left_data = {}
        vars.right_data = {}
        vars.hit_side = nil

        vars.fs_data = {}
        vars.fs_side = nil

        -- vulnerability.
        vars.vulnerable = false
    end
end)