pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

-- init gets called once
-- when program starts
function _init()
	-- clear the screen with
	-- black background
	cls(0)
	make_ship()
	blts={}
end

-- update is for gameplay funcs
-- hard 30 fps
function _update()
	move_ship()
	add_blt()
	upd_blts()
end

-- draw gets called when a new
-- frame gets drawn to screen
-- 30 fps
function _draw()
	-- clear screen, otherwise
	-- everything drawn persists
	cls(0)
	draw_ship()
	draw_blts()
end
-->8
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
	bullets = {}
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
		ship.x-=ship.spdx
	end
	-- move right by adding 
	-- speed to x position
	if btn(1) then
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

-->8
function add_blt(x, y, dx, dy)
  if btn(5) then
	  local bullet = {
	    x = ship.x,
	    y = ship.y-8,
	    dx = dx,
	    dy = dy,
	    speed = 4,  -- example speed
	    life = 60   -- example lifespan (frames)
	  }
	  add(blts, bullet)
	 end
end

function upd_blts()
 for i = #bullets, 1, -1 do
   local bullet = blts[i]
   bullet.x += bullet.dx * bullet.speed
   bullet.y += bullet.dy * bullet.speed
   bullet.life -= 1
   if bullet.life <= 0 then
     del(bullets, i) -- remove the bullet if it has expired
   end
 end
end

function draw_blts()
	for i = #bullets, 1, -1 do
		local bullet = blts[i]
		spr(bullet.sprite, bullet.x, bullet.y)
	end
end

__gfx__
00000000000660000006000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000adda00000da00000ad0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700006cc600006c6000006c6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000066cc660006c6000006c600000c00c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000666dd666066d6600066d660000c00c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700616dd616066d6600066d660000c00c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000061600616066066000660660000c00c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000060000006060006000600060000c00c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
