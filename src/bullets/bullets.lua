bullets = {}

function bullets.load(arg)
  bullets.data = {}
  bullets.last_shoot = 0
  bullets.base_shoot = 2
end

function bullets.draw()
  for i,v in ipairs(bullets.data) do
    local trans = 255*v.y/800
    if trans < 0 then
      trans = 0
    end
    love.graphics.setColor(255,255,255,trans)
    love.graphics.draw(player.char.bullet,v.x,v.y,0,1,1,32,32)
  end
end

function bullets.update(dt)
  bullets.last_shoot = bullets.last_shoot + dt
  if bullets.last_shoot > bullets.base_shoot/player.char.spd  then
    bullets.last_shoot = bullets.base_shoot/player.char.spd 
  end
  if love.keyboard.isDown(keybinding.shoot) and bullets.last_shoot >= bullets.base_shoot/player.char.spd then
    bullets.last_shoot = 0
    local bullet = {}
    bullet.x = player.x
    bullet.y = player.y
    table.insert(bullets.data,bullet)
  end
  for i,v in ipairs(bullets.data) do
    v.y = v.y - dt*600
    if v.y < -64 then
      table.remove(bullets.data,i)
    end
  end
end

function bullets.keypressed(key)

end

return bullets
