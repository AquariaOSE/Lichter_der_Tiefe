-- declarations -> prevent globals
if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

function init(me)
	setupEntity(me)
	entity_initSkeletal(me, "lichtblume")
	
	v.flagLiedDerLichter = 1100
	
	entity_setEntityType(me, ET_NEUTRAL)
	entity_setState(me, STATE_IDLE)
	
	v.flag = 105
	v.flagSongs = 307
	v.flagUntiefen = 701
	v.flagMejais = 108
	
	v.revived = false
	v.glowing = false
	v.r = randRange(50, 100) / 100
	v.g = randRange(50, 100) / 100
	v.b = randRange(50, 100) / 100
	
end

-- after nodes have inited
function postInit(me)
end

function update(me, dt)
	
	if v.glowing == false and getFlag(v.flag) == 1 then
		v.glowing = true
		
		local r = randRange(50, 100) / 100
		local g = randRange(50, 100) / 100
		local b = randRange(50, 100) / 100
		
		v.glow = createQuad("Naija/LightFormGlow", 13)
		quad_setPosition(v.glow, entity_getPosition(me))
		quad_scale(v.glow, 4, 4)
		quad_alpha(v.glow, 0)
		quad_alpha(v.glow, 1, 0.5)
		quad_color(v.glow, r, g, b)	
	end
	
	if v.revived == false and isFlag(v.flagMejais, 1) then
		v.revived = true
		entity_animate(me, "idle", -1)
	end
end

function enterState(me)
	if isFlag(v.flagMejais, 1) then
		entity_animate(me, "idle", -1)
		v.revived = true
	elseif getFlag(v.flagUntiefen) >= 2 then
		entity_animate(me, "tot", -1)
	elseif getFlag(v.flagSongs) >= 3 then
		entity_animate(me, "welken", -1)
	else
		entity_animate(me, "idle", -1)
	end
end

function exitState(me)
end

function damage(me, attacker, bone, damageType, dmg)
	return false
end

function animationKey(me, key)
end

function hitSurface(me)
end

function songNote(me, note)
end

function songNoteDone(me, note)
end

function song(me, song)
	if song == 104 then	
		if getFlag(v.flagUntiefen) < 2 or isFlag(v.flagMejais, 1) then
			setFlag(v.flag, 1)
		end
	end
end

function activate(me)
end
