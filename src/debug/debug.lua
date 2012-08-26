debug = {}

debug.enabled = false
debug.hard_pause = false

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
    if key == "w" then
      enemy.cwave = enemy.cwave + 1
    end
    
    if key == "a" then
      hor_debug_r_min  = hor_debug_r_min  + 16
    elseif key == "z" then
      hor_debug_r_min  = hor_debug_r_min  - 16
    elseif key == "s" then
      hor_debug_g_min  = hor_debug_g_min  + 16
    elseif key == "x" then
      hor_debug_g_min  = hor_debug_g_min  - 16
    elseif key == "d" then
      hor_debug_b_min  = hor_debug_b_min  + 16
    elseif key == "c" then
      hor_debug_b_min  = hor_debug_b_min  - 16
    end
    
    if key == "f" then
      hor_debug_r_max  = hor_debug_r_max  + 16
    elseif key == "v" then
      hor_debug_r_max  = hor_debug_r_max  - 16
    elseif key == "g" then
      hor_debug_g_max  = hor_debug_g_max  + 16
    elseif key == "b" then
      hor_debug_g_max  = hor_debug_g_max  - 16
    elseif key == "h" then
      hor_debug_b_max  = hor_debug_b_max  + 16
    elseif key == "n" then
      hor_debug_b_max  = hor_debug_b_max  - 16
    end
    
    if key == "f1" then
      debug.hard_pause = not debug.hard_pause
    end
    
  end
end

function debug.draw()
  if debug.enabled then
    love.graphics.printf("DEBUG [~]",32,16,200,"center")
    chart_fps:draw("PFS",32,32,nil,64)
    love.graphics.print("State:"..state,32,128)
    love.graphics.print("R:"..hor_debug_r_min..","..hor_debug_r_max.." G:"..hor_debug_g_min..","..hor_debug_g_max.." B:"..hor_debug_b_min..","..hor_debug_b_max,32,256)
  end
end

return debug
