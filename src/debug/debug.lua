debug = {}

debug.enabled = false

function debug.keypressed(key)
  if key == keybinding.debug then
    debug.enabled = not debug.enabled
  end
end

function debug.draw()
  if debug.enabled then
    love.graphics.printf("DEBUG [~]",32,16,200,"center")
    chart_fps:draw("fps",32,32,nil,64)
  end
end

return debug
