enemy = {}

enemy.type = {}
enemy.type[1] = {}
enemy.type[1].img = love.graphics.newImage("assets/enemy_1.png")
enemy.type[1].hp = 2
enemy.type[1].speed = 100
enemy.type[1].shoot_rate = 4

enemy.type[2] = {}
enemy.type[2].img = love.graphics.newImage("assets/enemy_2.png")
enemy.type[2].hp = 4
enemy.type[2].speed = 100
enemy.type[2].shoot_rate = 2

enemy.type[3] = {}
enemy.type[3].img = love.graphics.newImage("assets/enemy_3.png")
enemy.type[3].hp = 6
enemy.type[3].speed = 100
enemy.type[3].shoot_rate = 1

enemy.bullet = love.graphics.newImage("assets/enemy_bullet.png")

function enemy.load(arg)
  enemy.data = {}
  enemy.spawn_dt = 0
  enemy.spawn_rate = 1
end

function enemy.draw()
  for i,v in ipairs(enemy.data) do
    local trans = bullets.gentrans(v.y)
    love.graphics.setColor(255,255,255,trans/4)
    love.graphics.circle("fill",v.x,v.y,64*v.hp/enemy.type[v.type].hp,64)
    love.graphics.setColor(127,0,0,trans)
    love.graphics.draw(enemy.type[v.type].img,v.x,v.y,0,1,1,64,32)
  end
end

function enemy.update(dt)
  enemy.spawn_dt = enemy.spawn_dt + dt
  if enemy.spawn_dt > enemy.spawn_rate then
    enemy.spawn_dt = enemy.spawn_dt - enemy.spawn_rate
    local e = {}
    e.x = math.random(32,800-32)
    e.y = -64
    e.type = math.random(1,#enemy.type)
    e.dt_shoot = 0
    e.hp = enemy.type[e.type].hp
    table.insert(enemy.data,e)
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
    v.y = v.y + dt*150
    if v.y >664 then
      table.remove(enemy.data,i)
    end
  end
end

function enemy.wavedone()
  
end

return enemy
