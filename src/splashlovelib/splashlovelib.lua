splashlovelib = {}

splashlovelib.img = love.graphics.newImage("splashlovelib/Love-logo-512x256.png")

function splashlovelib.draw()
  if splashlovelib.temp_dt <= 5.10 then
    if splashlovelib.temp_dt < 2.55 then
      love.graphics.setColor(255,255,255,math.floor(splashlovelib.temp_dt*100))
    else
      love.graphics.setColor(255,255,255,math.floor(510-splashlovelib.temp_dt*100))
    end
    love.graphics.draw(splashlovelib.img,
      (love.graphics.getWidth()-splashlovelib.img:getWidth())/2,
      (love.graphics.getHeight()-splashlovelib.img:getHeight())/2 )
  end
  splashlovelib.start = true
end

splashlovelib.temp_dt = 0
function splashlovelib.update(dt)
  if splashlovelib.start then
    splashlovelib.temp_dt = splashlovelib.temp_dt + dt
  end
end

function splashlovelib.done()
  if splashlovelib.temp_dt > 5.10 then -- 255 * 2
    return true
  end
end

return splashlovelib
