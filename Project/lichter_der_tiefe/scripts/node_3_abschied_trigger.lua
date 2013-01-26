-- declarations -> prevent globals
if not v then v = {} end
-- if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end


-- on creation
function init(me)

	v.n = getNaija()

	v.flag = 308
	v.flagLdL = 1100
end

-- check
function update(me, dt)

	if isFlag(v.flag, 0) then
		if isFlag(v.flagLdL, 1) and node_isEntityIn(me, v.n) then
			setFlag(v.flag, 1)
		end
	end
end

