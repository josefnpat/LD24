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

-- FROG
player.kurtz = {}
player.kurtz.hp = 5
player.kurtz.spd = 4
player.kurtz.dps = 1
-- total 10
player.kurtz.color = {153,54,54}
player.kurtz.portrait = love.graphics.newImage("assets/kurtz.png")
player.kurtz.ship = love.graphics.newImage("assets/kurtz_ship.png")
player.kurtz.bullet = love.graphics.newImage("assets/kurtz_bullet.png")
player.kurtz.name = "Kurtz"

-- PENGUIN
player.tuxxer = {}
player.tuxxer.hp = 7
player.tuxxer.spd = 5
player.tuxxer.dps = 3
-- total 15
player.tuxxer.color = {153,54,103}
player.tuxxer.portrait = love.graphics.newImage("assets/tuxxer.png")
player.tuxxer.ship = love.graphics.newImage("assets/tuxxer_ship.png")
player.tuxxer.bullet = love.graphics.newImage("assets/tuxxer_bullet.png")
player.tuxxer.name = "Tuxxer"

--MONKEY
player.charlie = {153,103,54}
player.charlie.hp = 4
player.charlie.spd = 7
player.charlie.dps = 9
-- total 20
player.charlie.color = {153,103,54}
player.charlie.portrait = love.graphics.newImage("assets/charlie.png")
player.charlie.ship = love.graphics.newImage("assets/charlie_ship.png")
player.charlie.bullet = love.graphics.newImage("assets/charlie_bullet.png")
player.charlie.name = "Charlie"

player.char = player.kurtz
player.x = love.graphics.getWidth()/2
player.y = love.graphics.getHeight()*3/4

function player.update(dt)
  local base_speed = 50
  local new_x
  if love.keyboard.isDown(keybinding.left) then
    new_x = player.x - dt * base_speed * player.char.spd
  end
  if love.keyboard.isDown(keybinding.right) then
    new_x = player.x + dt * base_speed * player.char.spd
  end
  
  local new_y
  if love.keyboard.isDown(keybinding.up) then
    new_y = player.y - dt * base_speed * player.char.spd
  end
  if love.keyboard.isDown(keybinding.down) then
    new_y = player.y + dt * base_speed * player.char.spd
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
end

function player.draw()
  love.graphics.setColor(player.char.color[1],player.char.color[2],player.char.color[3])
  love.graphics.draw(player.char.ship,player.x,player.y,0,1,1,player.char.ship:getWidth()/2,player.char.ship:getHeight()/2)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(player.char.portrait,(love.graphics.getWidth()-player.char.portrait:getWidth()/2-32),32,0,0.5,0.5)
end

return player
