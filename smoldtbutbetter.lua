local weapons = require "gamesense/csgo_weapons" or client.log("missing the gamesense weapons libary wyd silly nigga")
local images = require "gamesense/images" or client.log("missing the gamesense images libary wyd silly nigga")

local exploit = {
    enabled = { ui.reference("RAGE", "Other", "Double tap") },
    shift = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks"),
}

exploit.get_charge = function()
    local charge_fraction = 0

    if not ui.get(exploit.enabled[2]) then return 0 end

    if not entity.is_alive(entity.get_local_player()) then return 0 end

    local me = entity.get_local_player()

    local weapon = entity.get_prop(me, "m_hActiveWeapon")

    if weapon == nil then return 0 end

    local next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.25
    local next_primary_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack") + 0.25

    charge_fraction = math.abs(math.abs(globals.curtime() - math.max(next_attack, next_primary_attack)))

    if charge_fraction >= 1 then
        charge_fraction = 1
    end

    return charge_fraction
end

local new_charge = true
local charge_table = {}
local time_since_last_discharge = globals.curtime()
local has_uncharged, uncharge_time = false, globals.curtime()
client.set_event_callback("paint", function()
    local charge = exploit.get_charge()

    local mx, my = client.screen_size()
    local x, y = mx / 2, my / 2

    local main_size = { renderer.measure_text("b", "gogi-yaw") }
    local info_size = { renderer.measure_text(nil, " | shift: " ..ui.get(exploit.shift)) }

    local wm_size = 10 + main_size[1] + info_size[1]

    local track = charge == 1 and math.floor(charge * wm_size) or math.floor(charge * wm_size) + 10

    local y_index = 0

    local uncharge_render = false

    -- if ui.get(exploit.enabled[2]) == true and charge <= 0.15 then
    --     time_since_last_discharge = globals.curtime() + 5
    -- end

    if ui.get(exploit.enabled[2]) == true and charge <= 0.001 then
        has_uncharged = true
        --uncharged_time = globals.curtime()
        charge_table[#charge_table + 1], uncharge_time = globals.curtime(), globals.curtime()
    end

    client.log(has_uncharged)

    if charge == 1 and new_charge == true and has_uncharged then
        charge_table[#charge_table + 1] = globals.curtime()
        new_charge = false
        has_uncharged = false
        client.log("added | " ..#charge_table)
    end

    for i = 1, #charge_table do
        local alpha = math.abs((charge_table[i]) - globals.curtime()) * 25
        if alpha >= 245 then
            table.remove(charge_table, i)
            client.log("removed | " .. i)
            new_charge = true
        end
    end

    renderer.rectangle(mx - (x * 1.95), y, 10 + main_size[1] + info_size[1], 18, 25, 25, 25, 155) -- background
    
    renderer.rectangle(mx - (x * 1.95), y, wm_size, 2, 255, 255, 255, 55) -- backing exploit line
    renderer.rectangle(mx - (x * 1.95), y, math.floor(charge * wm_size), 2, 255, 155, 155, 255) -- exploit line

    renderer.text(mx - (x * 1.95) + 5, y + 2, 255, 255, 255, 255, "b", nil, "gogi-yaw") -- watermark
    renderer.text(mx - (x * 1.95) + 5 + main_size[1], y + 2, 255, 255, 255, 255, nil, nil, " | shift: " ..ui.get(exploit.shift)) -- info

    for j = 1, #charge_table do
        if uncharge_time >= charge_table[j] - 0.5 then
            local alpha = math.abs((charge_table[j]) - globals.curtime()) * 25
            renderer.text(mx - (x * 1.95), y + 12 + (j * 12), 255, 255, 255, 255 - alpha, nil, nil, "[-] uncharged " ..ui.get(exploit.shift).. " ticks")
        else
            local alpha = math.abs((charge_table[j]) - globals.curtime()) * 25
            renderer.text(mx - (x * 1.95), y + 12 + (j * 12), 255, 255, 255, 255 - alpha, nil, nil, "[+] charged " ..ui.get(exploit.shift).. " ticks")
        end
    end
end)