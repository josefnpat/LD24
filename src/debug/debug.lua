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
  end
end

function debug.draw()
  if debug.enabled then
    love.graphics.printf("DEBUG [~]",32,16,200,"center")
    chart_fps:draw("fps",32,32,nil,64)
    love.graphics.printf("Character: "..player.char.name,32,32,800-32,"right")
  end
end

return debug
