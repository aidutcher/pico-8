function add_blt()
  if btn(5) then
	  local bullet = {
		sprite = 4,
	    x = ship.x,
	    y = ship.y,
	    speed = 8  -- example speed
	  }
	  add(blts, bullet)
	 end
end

function upd_blts()
 for blt in all(blts) do
   blt.y -= blt.speed
   --remove bullet at
   -- edge of screen
   if blt.y >118 then
     del(blts, blt) 
   end
 end
end

function draw_blts()
	for blt in all(blts) do
		spr(blt.sprite, blt.x, blt.y)
	end
end