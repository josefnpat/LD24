enemy = {}

enemy.type = {}

for i = 1,10 do
  enemy.type[i] = {}
  enemy.type[i].img = love.graphics.newImage("assets/enemy_"..i..".png")
end

for i = 1,9 do
  enemy.type[i].hp = math.floor((i+4)/2)
  enemy.type[i].speed = 200 - 15 * i
  enemy.type[i].shoot_rate = 2 - 1.25*(i/10)
end

enemy.type[10].hp = 100
enemy.type[10].speed = 10
enemy.type[10].shoot_rate = 0.75
enemy.type[10].defaultx = 400

enemy.type[ 1].color = {127,63,63}
enemy.type[ 2].color = {191,127,127}
enemy.type[ 3].color = {255,191,191}
enemy.type[ 4].color = {63,127,63}
enemy.type[ 5].color = {127,191,127}
enemy.type[ 6].color = {191,255,191}
enemy.type[ 7].color = {63,63,127}
enemy.type[ 8].color = {127,127,191}
enemy.type[ 9].color = {191,191,255}
enemy.type[10].color = {255,255,255}

enemy.bullet = love.graphics.newImage("assets/enemy_bullet.png")

function enemy.load(arg)
  enemy.data = {}
  enemy.spawn_dt = 0
  enemy.spawn_rate = 0.75
end

function enemy.reset_type()
  enemy.wave[ 1].type_list = {20}
  --enemy.wave[ 1].type_list = {1,1,1,1,1,1,1,1,1,1}
  enemy.wave[ 2].type_list = {12,8}
  enemy.wave[ 3].type_list = {0,12,8}
  enemy.wave[ 4].type_list = {0,0,12,8}
  enemy.wave[ 5].type_list = {0,0,0,12,8}
  enemy.wave[ 6].type_list = {8,8,6,6,4,4}
  enemy.wave[ 7].type_list = {0,0,0,0,0,12,8}
  enemy.wave[ 8].type_list = {0,0,0,0,0,0,12,8}
  enemy.wave[ 9].type_list = {0,0,0,0,0,0,0,12,8}
  enemy.wave[10].type_list = {0,0,0,0,0,0,0,12,8,1}
end

function enemy.reset()
  enemy.cwave = 1
  
  enemy.wave = {}
  
  for i = 1,10 do
    enemy.wave[i] = {}  
  end
  enemy.reset_type()
  
  local temp_shortcut
  
  base_red = 16
  base_green = 127
  base_blue = 0

  temp_shortcut = enemy.wave[1]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*0,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 6
  end
  
  temp_shortcut = enemy.wave[2]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*1,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 12
  end
  
  temp_shortcut = enemy.wave[3]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*2,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 18
  end
  
  temp_shortcut = enemy.wave[4]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*3,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 24
  end
  
  temp_shortcut = enemy.wave[5]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*4,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 30
  end
  
  temp_shortcut = enemy.wave[6]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*5,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 36
  end
  
  temp_shortcut = enemy.wave[7]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*6,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 42
  end
  
  temp_shortcut = enemy.wave[8]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*7,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 48
  end
  
  temp_shortcut = enemy.wave[9]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*8,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 54
  end
  
  temp_shortcut = enemy.wave[10]
  function temp_shortcut.setColor(line_index,max_lines)
    love.graphics.setColor(base_red*9,base_green*(line_index/max_lines),0,255*(line_index/max_lines))
    horizon.max_point = 60
  end
  
  enemy.max_score = 0
  enemy.current_score = 0
  for i,v in pairs(enemy.wave) do
    for j,w in pairs(v.type_list) do
      enemy.max_score = enemy.max_score + enemy.type[j].hp*w
    end
  end
end

function enemy.getScoreString()
  return "Score "..math.floor(enemy.current_score/enemy.max_score*100+0,5).."%"
end

function enemy.draw()
  for i,v in ipairs(enemy.data) do
    local trans = bullets.gentrans(v.y)
    love.graphics.setColor(255,255,255,trans/4)
    love.graphics.circle("fill",v.x,v.y,64*v.hp/enemy.type[v.type].hp,64)
    love.graphics.setColor(enemy.type[v.type].color[1],enemy.type[v.type].color[2],enemy.type[v.type].color[3],trans)
    love.graphics.draw(enemy.type[v.type].img,v.x,v.y,0,1,1,enemy.type[v.type].img:getWidth()/2,enemy.type[v.type].img:getHeight()/2)
  end
end

function enemy.get_type_from_wave_god_fucking_damn_it()
  for i,v in ipairs(enemy.wave[enemy.cwave].type_list) do
    if v > 0 then
      enemy.wave[enemy.cwave].type_list[i] = enemy.wave[enemy.cwave].type_list[i] - 1
      return i
    end
  end
end

function enemy.update(dt)
  if enemy.cwave == #enemy.wave+1 and not player.current_say then
    if #enemy.data == 0 then
      state = "endgame"
    end
  else
    if not player.current_say then
      enemy.spawn_dt = enemy.spawn_dt + dt
    end
    if enemy.spawn_dt > enemy.spawn_rate then
      enemy.spawn_dt = enemy.spawn_dt - enemy.spawn_rate
      local new_type = enemy.get_type_from_wave_god_fucking_damn_it()
      if new_type then
        local e = {}
        e.y = -64
        e.type = new_type
        e.dt_shoot = enemy.spawn_rate * 3 / 4
        e.hp = enemy.type[e.type].hp
        e.xfly = math.random(-1,1)
        e.yfly = 1
        if enemy.type[e.type].defaultx then
          enemy.boss = e
          e.x = enemy.type[e.type].defaultx
          e.xfly = 0
          enemy.wave[10].setColor = nil
        else
          e.x = math.random(16,800-16)
        end
        table.insert(enemy.data,e)
      else
        if not player.char.dead and #enemy.data == 0 then
          enemy.spawn_rate = enemy.spawn_rate * 0.9
          enemy.cwave = enemy.cwave + 1
          player.char.wavesay()
        end
      end 
    end
  end
  for i,v in ipairs(enemy.data) do
    v.dt_shoot = v.dt_shoot + dt
    if v.dt_shoot > enemy.type[v.type].shoot_rate then
      v.dt_shoot = v.dt_shoot - enemy.type[v.type].shoot_rate
      if enemy.type[v.type].defaultx then
        local bullet = {}
        bullet.x = v.x+16
        bullet.y = v.y
        bullet.enemy = true
        table.insert(bullets.data,bullet)
        local bullet = {}
        bullet.x = v.x-16
        bullet.y = v.y
        bullet.enemy = true
        table.insert(bullets.data,bullet)
      else
        local bullet = {}
        bullet.x = v.x
        bullet.y = v.y
        bullet.enemy = true
        table.insert(bullets.data,bullet)
      end
    end
    v.y = v.y + dt*enemy.type[v.type].speed*v.yfly
    if v.y > 400 then
      v.y = 400
      v.yfly = -1
      v.xfly = math.random(-1,1)
    end
    if v.y < -64 then
      v.y = -64
      v.yfly = 1
      v.xfly = math.random(-1,1)
    end
    
    v.x = v.x + v.xfly*dt*enemy.type[v.type].speed
    if v.x > 800 then
      v.x = 800
      v.xfly = -v.xfly
    end
    if v.x < 0 then
      v.x = 0
      v.xfly = -v.xfly
    end

  end
end

return enemy
