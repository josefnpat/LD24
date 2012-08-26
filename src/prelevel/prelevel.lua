prelevel = {}

function prelevel.load(arg)
end

function prelevel.draw()
  love.graphics.setColor(player.char.color[1]-54,player.char.color[2]-54,player.char.color[3]-54)
  love.graphics.draw(player.char.ship_full,0,0)
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(font_ld24_xlarge)
  if player.char.dead then
    info = "Failure."
  else
    info = "Get Ready!"
  end
  love.graphics.printf(info,0,100,800,"center")
  love.graphics.setFont(font_ld24_large)
  love.graphics.printf("Press any key to continue.",0,160,800,"center")
  love.graphics.setFont(font_ld24_small)
  local scale = 0.75
  local chars = {player.kurtz,player.tuxxer,player.charlie}
  for i,char in ipairs(chars) do
    love.graphics.setColor(char.color)
    if player.char.name == char.name and not player.char.dead then
      love.graphics.rectangle("fill",800*(i)/4-128*scale-8,300-128*scale-8,256*scale+16,256*scale+16)
      love.graphics.setColor(255,255,255)
    else
      love.graphics.setColor(255,255,255,127)
    end
    
    local alive_override
    if char.dead then
      alive_override = player.dead
    else
      alive_override = char
    end
    love.graphics.draw(alive_override.portrait,800*i/4,300,0,scale,scale,128,128)
    love.graphics.printf(alive_override.name,800*(i-0.5)/4,300+32+128*scale,256*scale,"center")
    if player.char.name == char.name and not player.char.dead then
      prelevel.stat("Health",800*(i)/4-128*scale,464,256*scale,32,char.hp,7,{63,127,63})
      prelevel.stat("Speed",800*(i)/4-128*scale,504,256*scale,32,char.spd,7,{63,63,127})
      prelevel.stat("Damage",800*(i)/4-128*scale,544,256*scale,32,char.dps,9,{127,63,63})
    end
  end
end

function prelevel.stat(name,x,y,width,height,cur,max,color)
  love.graphics.setColor(31,31,31)
  love.graphics.rectangle("fill",x,y,width,height)
  love.graphics.setColor(color)
  love.graphics.rectangle("fill",x,y,width*cur/max,height)
  if name then
    love.graphics.setColor(255,255,255)
    love.graphics.printf(name,x,y+12,width,"center")
  end
end

function prelevel.update(dt)

end

function prelevel.keypressed(key)
  if not debug.enabled and key ~= keybinding.debug then
    if player.char.dead then
      state = "endgame"
    else
      state = "game"
      player.char.lifesay()
    end
  end
end

function prelevel.mousepressed()
  prelevel.keypressed()
end

return prelevel
