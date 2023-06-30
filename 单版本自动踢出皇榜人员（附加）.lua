require("lib/natives")

wait = util.yield

--皇榜横幅
function hengfugt(f)
    starttime = os.time()
    local startX = -0.5
    local endX = 0.5
    local speed = 0.001
    hfgt = f
    while hfgt do
        wait()
        startX = startX + speed
        endX = endX + speed
        if startX >= 0.5 then
            startX = -0.5
            endX = 0.5
        end
        GRAPHICS.DRAW_RECT(.5, .47, 1, 0.01, 255, 0, 0, 200)
        GRAPHICS.DRAW_RECT(.5, .48, 1, 0.01, 255, 128, 0, 200)
        GRAPHICS.DRAW_RECT(.5, .49, 1, 0.01, 255, 255, 0, 200)
        GRAPHICS.DRAW_RECT(.5, .50, 1, 0.01, 0, 255, 0, 200)
        GRAPHICS.DRAW_RECT(.5, .51, 1, 0.01, 0, 255, 255, 200)
        GRAPHICS.DRAW_RECT(.5, .52, 1, 0.01, 0, 75, 255, 200)
        GRAPHICS.DRAW_RECT(.5, .53, 1, 0.01, 128, 0, 255, 200)

        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(0.085, 0.10)
        HUD.SET_TEXT_SCALE(0.5, 0.4)
        HUD.SET_TEXT_FONT(0)
        HUD.SET_TEXT_CENTRE(1)
        HUD.SET_TEXT_OUTLINE(0)
        HUD.SET_TEXT_COLOUR(255, 255, 255, 255)
        util.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("~h~检测到皇榜会员 " .. playerid .. " 正在该战局 正在踢出~~~~~~~~~~~~~~~~")
        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(startX + 0.5, 0.480)

        if os.time() - starttime >= 7 then
        hfgt = false
        return
        end
        end
        --hfgt = false
    end
--开发横幅
function devhengfu(f)
    starttime = os.time()
    local startX = -0.5
    local endX = 0.5
    local speed = 0.001
    devhf = f
    while devhf do
        wait()
        startX = startX + speed
        endX = endX + speed
        if startX >= 0.5 then
            startX = -0.5
            endX = 0.5
        end
        
        GRAPHICS.DRAW_RECT(.5, .30, 1, 0.05, 255, 90, 160, 255)
        GRAPHICS.DRAW_RECT(.5, .31, 1, 0.05, 255, 160, 190, 255)
        GRAPHICS.DRAW_RECT(.5, .33, 1, 0.011, 255, 90, 160, 255)

        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(0.085, 0.10)
        HUD.SET_TEXT_SCALE(0.5, 0.45)
        HUD.SET_TEXT_FONT(0)
        HUD.SET_TEXT_CENTRE(1)
        HUD.SET_TEXT_OUTLINE(0)
        HUD.SET_TEXT_COLOUR(255, 255, 255, 255)
        util.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("~h~GTLua开发人员 " .. playerrid .. " 目前在你的战局 正在踢出~~~~~~~~~~~~~~~~")
        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(startX + 0.5, 0.285)
        
        if os.time() - starttime >= 7 then
        devhf = false
        end
        end
        --devhf = false
    end

--开发
require "lib.GTSCRIPTS.GTA.list"
notified_devs = {}
dev = menu.toggle(menu.my_root(), "开发人员检测", {"devcheck"}, "", function(f)
    devgt = f
    while devgt do
        for pid = 0, 32 do
            playerrid = players.get_name(pid)
            for _, id in ipairs(devid) do
                if playerrid == id.playerrid and not notified_devs[id.playerrid] then
                    if pid then
                        menu.trigger_commands("kick".. playerrid)
                        menu.trigger_commands("historyblock".. playerrid)
                        util.show_corner_help("~h~~q~GrandTouirngVIP 温馨提示 ~r~开发人员 ".. playerrid .."\n目前正在此战局中 正在踢出~~~~~~~~~~~~~~~~")
                        util.toast("温馨提示: GTLua开发人员目前正在你的战局中 正在踢出~~~~~~~~~~~~~~~~")
                        devhengfu(f)
                        notified_devs[id.playerrid] = true
                        --wait(1000)
                        notified_devs[id.playerrid] = false
                        devgt = false

                    end
                end
            end
        end
        wait(1000)
    end
end)

--皇榜
require "lib.GTSCRIPTS.GTA.list"
notified_sp = {}
spo = menu.toggle(menu.my_root(), "皇榜人员检测", {"spcheck"}, "", function(f)
    spgt = f
    while spgt do
        for pid = 0, 32 do
            playerid = players.get_name(pid)
            for _, id in ipairs(spid) do
                if playerid == id.playerid and not notified_sp[id.playerid] then
                    if pid and playerid ~= players.user() then
                        menu.trigger_commands("kick".. playerid)
                        menu.trigger_commands("historyblock".. playerid)
                        util.show_corner_help("~h~~q~GrandTouirngVIP 温馨提示 ~p~皇榜人员 ".. playerid .."\n~y~当前正在该战局 正在踢出~~~~~~~~~~~~~~~~")
                        util.toast("检测到GTLua皇榜人员当前正在该战局 正在踢出~~~~~~~~~~~~~~~~")
                        hengfugt(f)
                        notified_sp[id.playerid] = true
                        --wait(1000)
                        notified_sp[id.playerid] = false
                        spgt = false
                    end
                end
            end
        end
        wait(5000)
    end
end)