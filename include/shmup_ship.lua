function make_ship()
	-- create ship table with 
	-- attributes of the ship
	ship = {
		sprite=1, -- default sprite
		x=60,					-- start position
		y=120,
		spdx=2,
		spdy=2
	}
end

function move_ship()
	-- set edges of screen by
	-- resetting position if 
	-- out of bounds
	if ship.x < 0 then
		ship.x=127
	end
	if ship.x > 127 then
		ship.x=0
	end
	if ship.y < 2 then
		ship.y=2
	end
	if ship.y > 118 then
		ship.y=118
	end
	-- move left by subtracting
	-- speed from x position
	if btn(0) then
		ship.sprite=2
		ship.x-=ship.spdx
	end
	-- move right by adding 
	-- speed to x position
	if btn(1) then
		ship.sprite=3
		ship.x+=ship.spdx
	end
	-- move up by subtracting
	-- speed from y position
	if btn(2) then
		ship.y-=ship.spdy
	end
	-- move down by adding
	-- speed to y position
	if btn(3) then
		ship.y+=ship.spdy
	end		
end

function draw_ship()
	spr(ship.sprite,ship.x,ship.y)
end

function make_jets()
	jets = {
		sprite=5,
		x = ship.x,
		y = ship.y+8
	}
end

function upd_jets()
	jets.sprite+=1
	jets.x = ship.x
	jets.y = ship.y+8
	if jets.sprite > 9  then
		jets.sprite=5
	end
end 

function draw_jets()
	spr(jets.sprite, jets.x, jets.y)
end