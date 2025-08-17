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