bullets = {}

bullets.sound_dmg  = love.audio.newSource("assets/dmg.wav", "static" )
bullets.sound_enemy_dmg  = love.audio.newSource("assets/enemy_dmg.wav", "static" )
bullets.sound_shoot  = love.audio.newSource("assets/shoot.wav", "static" )

function bullets.load(arg)
  bullets.data = {}
  bullets.last_shoot = 0
  bullets.base_shoot = 1
end

function bullets.gentrans(y)
  local trans = 255*y/400
  if trans < 0 then
    trans = 0
  end
  if trans > 255 then
    trans = 255
  end
  return trans
end

function bullets.draw()
  for i,v in ipairs(bullets.data) do
    local trans = bullets.gentrans(v.y)
    love.graphics.setColor(255,255,255,trans)
    if v.enemy then
      love.graphics.draw(enemy.bullet,v.x,v.y,0,0.5,0.5,32,32)
    else
      love.graphics.draw(player.char.bullet,v.x,v.y,0,0.5,0.5,32,32)
    end
  end
end

function bullets.update(dt)
  bullets.last_shoot = bullets.last_shoot + dt
  if bullets.last_shoot > bullets.base_shoot/player.char.spd  then
    bullets.last_shoot = bullets.base_shoot/player.char.spd 
  end
  if love.keyboard.isDown(keybinding.shoot) and bullets.last_shoot >= bullets.base_shoot/player.char.spd and not player.char.dead then
    bullets.last_shoot = 0
    local bullet = {}
    bullet.x = player.x
    bullet.y = player.y
    table.insert(bullets.data,bullet)
    if sfx then
      bullets.sound_shoot:play()
    end
  end
  for i,v in ipairs(bullets.data) do
    if v.enemy then
      v.y = v.y + dt*300
      if v.y > 664 then
        table.remove(bullets.data,i)
      end    
    else
      v.y = v.y - dt*600
      if v.y < -64 then
        table.remove(bullets.data,i)
        enemy.current_score = enemy.current_score - 1
        if enemy.current_score < 0 then
          enemy.current_score = 0
        end
      end
    end
  end
  for i,v in ipairs(bullets.data) do
    if v.enemy then
      if bullets.dist(v.x,v.y,player.x,player.y) < 32+16 and not player.char.dead then
        if sfx then
          bullets.sound_dmg:play()
        end
        table.remove(bullets.data,i)
        if not debug.inv then
          player.char.hp_cur = player.char.hp_cur - 1
        end
        if player.char.hp_cur < 0 then
          player.char.hp_cur = 0
        end
      end
    else
      for j,w in ipairs(enemy.data) do
        if bullets.dist(v.x,v.y,w.x,w.y) < 64 then
          table.remove(bullets.data,i)
          enemy.current_score = enemy.current_score + 1
          w.hp = w.hp - 1
          if w.hp <= 0 then
            if sfx then
              bullets.sound_enemy_dmg:play()
            end
            table.remove(enemy.data,j)
          end
        end
      end
    end
  end
end

function bullets.dist(x1,y1,x2,y2)
  return math.sqrt((x2-x1)^2+(y2-y1)^2)
end

function bullets.keypressed(key)

end

return bullets
