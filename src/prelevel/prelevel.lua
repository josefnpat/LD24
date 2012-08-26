prelevel = {}

function prelevel.draw()
  love.graphics.setColor(player.char.color[1]-54,player.char.color[2]-54,player.char.color[3]-54)
  love.graphics.draw(player.char.ship_full,0,0)
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(font_ld24_large)
  love.graphics.printf("Get Ready!",0,150,800,"center")
  love.graphics.setFont(font_ld24_small)
  local scale = 0.75
  local chars = {player.kurtz,player.tuxxer,player.charlie}
  for i,char in ipairs(chars) do
    love.graphics.setColor(char.color)
    if player.char.name == char.name then
      love.graphics.rectangle("fill",800*(i)/4-128*scale-8,300-128*scale-8,256*scale+16,256*scale+16)
    end
    love.graphics.setColor(255,255,255)
    local alive_override
    if char.dead then
      alive_override = player.dead
    else
      alive_override = char
    end
    love.graphics.draw(alive_override.portrait,800*i/4,300,0,scale,scale,128,128)
    love.graphics.printf(alive_override.name,800*(i-0.5)/4,300+32+128*scale,256*scale,"center")
    if player.char.name == char.name then
      prelevel.stat("Health",800*(i)/4-128*scale,464,256*scale,char.hp,7,{0,63,0})
      prelevel.stat("Speed",800*(i)/4-128*scale,504,256*scale,char.spd,7,{0,0,63})
      prelevel.stat("Damage",800*(i)/4-128*scale,544,256*scale,char.dps,9,{63,0,0})
    end
  end
end

function prelevel.stat(name,x,y,width,cur,max,color)
  love.graphics.setColor(31,31,31)
  love.graphics.rectangle("fill",x,y,width,32)
  love.graphics.setColor(color)
  love.graphics.rectangle("fill",x,y,width*cur/max,32)
  love.graphics.setColor(255,255,255)
  love.graphics.printf(name,x,y+16,width,"center")
end

function prelevel.update(dt)

end

function prelevel.keypressed(key)

end

return prelevel