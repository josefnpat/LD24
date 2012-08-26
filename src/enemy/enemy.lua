enemy = {}

enemy.type = {}

for i = 1,10 do
  enemy.type[i] = {}
  enemy.type[i].img = love.graphics.newImage("assets/enemy_"..i..".png")
end

enemy.type[1].hp = 2
enemy.type[1].speed = 100
enemy.type[1].shoot_rate = 4

enemy.type[2].hp = 4
enemy.type[2].speed = 100
enemy.type[2].shoot_rate = 2

enemy.type[3].hp = 6
enemy.type[3].speed = 100
enemy.type[3].shoot_rate = 1

for i = 4,10 do
  enemy.type[i].hp = 6
  enemy.type[i].speed = 10
  enemy.type[i].shoot_rate = 1
end

enemy.bullet = love.graphics.newImage("assets/enemy_bullet.png")

function enemy.load(arg)
  enemy.data = {}
  enemy.spawn_dt = 0
  enemy.spawn_rate = 0.75
end

function enemy.reset()
  enemy.cwave = 1
  
  enemy.wave = {}
  enemy.wave[1] = {}
  enemy.wave[1].type_list = {10,0,0,0,0,0,0,0,0,10}
  
  local shortcut1 = enemy.wave[1]
  function shortcut1.setColor(line_index,max_lines)
    love.graphics.setColor(255*(line_index/max_lines),0,0,255)
  end

  enemy.wave[2] = {}
  enemy.wave[2].type_list = {1,2,3}
  
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
    love.graphics.setColor(127,0,0,trans)
    love.graphics.draw(enemy.type[v.type].img,v.x,v.y,0,1,1,enemy.type[v.type].img:getWidth()/2,enemy.type[v.type].img:getHeight()/2)
  end
end

function enemy.get_type_from_wave_god_fucking_damn_it()
  local assholes_left = false
  for i,v in ipairs(enemy.wave[enemy.cwave].type_list) do
    if v > 0 then
      assholes_left = true
      break
    end
  end
  
  if assholes_left then
    local index_rand = nil
    while(not index_rand) do
      index_rand = math.random(1,#enemy.wave[enemy.cwave].type_list)    
      if enemy.wave[enemy.cwave].type_list[index_rand] == 0 then
        index_rand = nil
      end
    end
    enemy.wave[enemy.cwave].type_list[index_rand] = enemy.wave[enemy.cwave].type_list[index_rand] - 1
    return index_rand
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
        e.x = math.random(32,800-32)
        e.y = -64
        e.type = new_type
        e.dt_shoot = 0
        e.hp = enemy.type[e.type].hp
        table.insert(enemy.data,e)
      else
        enemy.cwave = enemy.cwave + 1
        player.char.wavesay()
      end 
    end
  end
  for i,v in ipairs(enemy.data) do
    v.dt_shoot = v.dt_shoot + dt
    if v.dt_shoot > enemy.type[v.type].shoot_rate then
      v.dt_shoot = v.dt_shoot - enemy.type[v.type].shoot_rate
      local bullet = {}
      bullet.x = v.x
      bullet.y = v.y
      bullet.enemy = true
      table.insert(bullets.data,bullet)
    end
    v.y = v.y + dt*enemy.type[v.type].speed
    if v.y >664 then
      table.remove(enemy.data,i)
    end
  end
end

return enemy
