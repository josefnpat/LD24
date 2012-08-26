--[[
Background:
#000
#333
#CCC
#993667 - Pink
#993636 - Red
#996736 - Brown

Penguin - Tuxxer
Monkey - Charlie
Frog - Kurtz
--]]

player = {}

player.kurtz = {}
player.tuxxer = {}
player.charlie = {}

function player.load(arg)

  local base_health_mult = 10
  player.queue_say = {}
  -- FROG
  player.kurtz.dead = nil
  player.kurtz.hp = 5*base_health_mult
  player.kurtz.hp_cur = player.kurtz.hp
  player.kurtz.spd = 4
  player.kurtz.dps = 1
  -- total 10
  player.kurtz.color = {153,54,54}
  player.kurtz.portrait = love.graphics.newImage("assets/kurtz.png")
  player.kurtz.ship = love.graphics.newImage("assets/kurtz_ship.png")
  player.kurtz.ship_full = love.graphics.newImage("assets/kurtz_ship_full.png")
  player.kurtz.bullet = love.graphics.newImage("assets/kurtz_bullet.png")
  player.kurtz.name = "Kurtz"

  -- PENGUIN
  player.tuxxer.dead = nil
  player.tuxxer.hp = 7*base_health_mult
  player.tuxxer.hp_cur = player.tuxxer.hp
  player.tuxxer.spd = 5
  player.tuxxer.dps = 3
  -- total 15
  player.tuxxer.color = {153,54,103}
  player.tuxxer.portrait = love.graphics.newImage("assets/tuxxer.png")
  player.tuxxer.ship = love.graphics.newImage("assets/tuxxer_ship.png")
  player.tuxxer.ship_full = love.graphics.newImage("assets/tuxxer_ship_full.png")
  player.tuxxer.bullet = love.graphics.newImage("assets/tuxxer_bullet.png")
  player.tuxxer.name = "Tuxxer"

  --MONKEY
  player.charlie.dead = nil
  player.charlie.hp = 4*base_health_mult
  player.charlie.hp_cur = player.charlie.hp
  player.charlie.spd = 7
  player.charlie.dps = 9
  -- total 20
  player.charlie.color = {153,103,54}
  player.charlie.portrait = love.graphics.newImage("assets/charlie.png")
  player.charlie.ship = love.graphics.newImage("assets/charlie_ship.png")
  player.charlie.ship_full = love.graphics.newImage("assets/charlie_ship_full.png")
  player.charlie.bullet = love.graphics.newImage("assets/charlie_bullet.png")
  player.charlie.name = "Charlie"

  player.dead = {}
  player.dead.portrait = love.graphics.newImage("assets/dead.png")
  player.dead.name = "Deceased"
  
  player.chars = {}
  player.chars[1] = player.kurtz
  player.chars[2] = player.tuxxer
  player.chars[3] = player.charlie

  player.max_hp = 0
  player.max_spd = 0
  player.max_dps = 0
  for i,v in pairs(player.chars) do
    if v.hp > player.max_hp then
      player.max_hp = v.hp
    end
    if v.spd > player.max_spd then
      player.max_spd = v.spd
    end
    if v.dps > player.max_dps then
      player.max_dps = v.dps
    end
  end
  
  player.char = player.kurtz
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()*3/4
  player.color = {}
  player.color.textbg = {255,255,255,255}
  player.color.text = {255,255,255,255}
  player.color.name = {54,54,54}
  player.dead_dt = 0
  player.shipfade = 0
  player.restart_time = 3
end

function player.update(dt)
  if player.char.hp_cur <= 0 then
    player.shipfade = player.shipfade + dt
    if player.shipfade > 2.55 then
      player.shipfade = 2.55
    end
    if not player.char.dead then
      player.char.deathsay()
    end
    player.char.dead = true
    if not player.current_say then
      player.dead_dt = player.dead_dt + dt
    end
    if player.dead_dt > player.restart_time then
      for i,v in pairs(player.chars) do
        if not v.dead then
          player.char = v
          player.dead_dt = 0
          enemy.load(arg)
          bullets.load(arg)
          horizon.load(arg)
          player.shipfade = 0
          break
        end
      end
      state = "prelevel"
    end
    
  else
    local base_speed = 75
    
    local new_x = 0
    if love.keyboard.isDown(keybinding.left) then
      new_x = new_x - dt * base_speed * player.char.spd
    end
    if love.keyboard.isDown(keybinding.right) then
      new_x = new_x + dt * base_speed * player.char.spd
    end
    
    local new_y = 0
    if love.keyboard.isDown(keybinding.up) then
      new_y = new_y - dt * base_speed * player.char.spd
    end
    if love.keyboard.isDown(keybinding.down) then
      new_y = new_y + dt * base_speed * player.char.spd
    end
    
    if new_x ~= 0 then
      if new_x + player.x  > love.graphics.getWidth()-player.char.ship:getHeight()/2 then
        player.x = love.graphics.getWidth()-player.char.ship:getHeight()/2
      elseif new_x + player.x  < player.char.ship:getHeight()/2 then
        player.x = player.char.ship:getHeight()/2
      else
        player.x = new_x + player.x 
      end
    end
    
    if new_yx ~= 0 then
      if new_y + player.y > love.graphics.getHeight()-player.char.ship:getHeight()/2 then
        player.y = love.graphics.getHeight()-player.char.ship:getHeight()/2
      elseif new_y + player.y < love.graphics.getHeight()/3*2 then
        player.y = love.graphics.getHeight()/3*2
      else
        player.y = new_y + player.y
      end
    end
    
  end
  
  if player.current_say then
    player.current_say.time_remain = player.current_say.time_remain - dt
    if player.current_say.time_remain < 0 then
      player.current_say = table.remove(player.queue_say,1)
    end
  end
  
end

function player.draw()
  local yoffset = 204 -- 600 - 256 + 64) /2
  love.graphics.setColor(player.char.color[1],player.char.color[2],player.char.color[3],255-player.shipfade*100)
  love.graphics.draw(player.char.ship,player.x,player.y,0,1,1,player.char.ship:getWidth()/2,player.char.ship:getHeight()/2)
  love.graphics.setColor(255,255,255)
  local current_char = player.char
  if player.current_say then
    love.graphics.setColor(player.current_say.char.color)
    love.graphics.rectangle("fill",400,16+yoffset,400-16,128+32)
    love.graphics.setColor(player.color.name)
    love.graphics.setFont(font_ld24_large)
    love.graphics.printf(player.current_say.char.name,416,32+yoffset,400-64-128,"center")
    love.graphics.setFont(font_ld24_small)
    love.graphics.setColor(player.color.text)
    love.graphics.printf(player.current_say.text,416,32+32+yoffset,400-64-128,"left")
    current_char = player.current_say.char
  else
    love.graphics.setColor(player.char.color)
    love.graphics.rectangle("fill",800-48-128,16+yoffset,128+32,128+32)
    if #player.queue_say > 0 then
      player.current_say = table.remove(player.queue_say,1)
    end
  end
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(current_char.portrait,(love.graphics.getWidth()-player.char.portrait:getWidth()/2-32),32+yoffset,0,0.5,0.5)
end

function player.say(text,time,char)
  local say = {}
  say.text = text
  say.time_remain = time
  if char then
    say.char = char
  else
    say.char = player.char
  end
  table.insert(player.queue_say,say)
end

return player
