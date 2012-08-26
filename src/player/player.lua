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

function player.load(arg)
  player.queue_say = {}
  -- FROG
  player.kurtz = {}
  player.kurtz.hp = 5
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
  player.tuxxer = {}
  player.tuxxer.hp = 7
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
  player.charlie = {153,103,54}
  player.charlie.hp = 4
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

  player.char = player.kurtz
  player.x = love.graphics.getWidth()/2
  player.y = love.graphics.getHeight()*3/4
  player.color = {}
  player.color.textbg = {255,255,255,255}
  player.color.text = {255,255,255,255}
  player.color.name = {54,54,54}
end

function player.update(dt)
  local base_speed = 75
  
  local new_x
  if love.keyboard.isDown(keybinding.left) then
    new_x = player.x - dt * base_speed * player.char.spd
  end
  if love.keyboard.isDown(keybinding.right) then
    if new_x then
      new_x = nil
    else
      new_x = player.x + dt * base_speed * player.char.spd
    end
  end
  
  local new_y
  if love.keyboard.isDown(keybinding.up) then
    new_y = player.y - dt * base_speed * player.char.spd
  end
  if love.keyboard.isDown(keybinding.down) then
    if new_y then
      new_y = nil
    else
      new_y = player.y + dt * base_speed * player.char.spd
    end
  end
  
  if new_x then
    if new_x > love.graphics.getWidth()-player.char.ship:getHeight()/2 then
      player.x = love.graphics.getWidth()-player.char.ship:getHeight()/2
    elseif new_x < player.char.ship:getHeight()/2 then
      player.x = player.char.ship:getHeight()/2
    else
      player.x = new_x
    end
  end
  
  if new_y then
    if new_y > love.graphics.getHeight()-player.char.ship:getHeight()/2 then
      player.y = love.graphics.getHeight()-player.char.ship:getHeight()/2
    elseif new_y < love.graphics.getHeight()/3*2 then
      player.y = love.graphics.getHeight()/3*2
    else
      player.y = new_y
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
  love.graphics.setColor(player.char.color[1],player.char.color[2],player.char.color[3])
  love.graphics.draw(player.char.ship,player.x,player.y,0,1,1,player.char.ship:getWidth()/2,player.char.ship:getHeight()/2)
  love.graphics.setColor(255,255,255)
  local current_char = player.char
  if player.current_say then
    love.graphics.setColor(player.current_say.char.color)
    love.graphics.rectangle("fill",400,16,400-16,128+32)
    love.graphics.setColor(player.color.name)
    love.graphics.setFont(font_ld24_large)
    love.graphics.printf(player.current_say.char.name,416,32,400-64-128,"center")
    love.graphics.setFont(font_ld24_small)
    love.graphics.setColor(player.color.text)
    love.graphics.printf(player.current_say.text,416,32+32,400-64-128,"left")
    current_char = player.current_say.char
  else
    love.graphics.setColor(player.char.color)
    love.graphics.rectangle("fill",800-48-128,16,128+32,128+32)
    if #player.queue_say > 0 then
      player.current_say = table.remove(player.queue_say,1)
    end
  end
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(current_char.portrait,(love.graphics.getWidth()-player.char.portrait:getWidth()/2-32),32,0,0.5,0.5)
end

function player.say(text,time,char)
  local say = {}
  say.text = text
  say.time_remain = time
  say.char = char
  table.insert(player.queue_say,say)
end

return player
