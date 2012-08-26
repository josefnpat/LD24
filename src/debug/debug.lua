debug = {}

debug.enabled = false

function debug.keypressed(key)
  if key == keybinding.debug then
    debug.enabled = not debug.enabled
  end
  if debug.enabled then
    if key == "1" then
      player.char = player.kurtz
    elseif key == "2" then
      player.char = player.tuxxer
    elseif key == "3" then
      player.char = player.charlie
    end
    if key == "k" then
      player.char.dead = not player.char.dead 
    end
    if key == "d" then
      player.char.hp_cur = 0
    end
  end
end

function debug.draw()
  if debug.enabled then
    love.graphics.printf("DEBUG [~]",32,16,200,"center")
    chart_fps:draw("PFS",32,32,nil,64)
    love.graphics.print("State:"..state,32,128)
  end
end

return debug
