-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

    v.n = getNaija()
    v.flag = 004

    if isFlag(v.flag, 0) then
        node_setCursorActivation(me, true)
    end
end



function activate(me)

    if isFlag(v.flag, 0 ) then

        setFlag(v.flag, 2)

        local schwer = node_getNearestNode("0_wahl_schwer")
        node_setCursorActivation(me, false)
        node_setCursorActivation(schwer, false)

        hideImage()
        enableInput()

        -- spawnParticleEffect("TitleEffect1", me)
        centerText("Hafen von Winumsund")
    end
end