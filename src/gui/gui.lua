gui = {}

function gui.load(arg)

end

function gui.draw()
  love.graphics.setColor(255,255,255,255)
  if player.char.dead and not player.current_say then
    love.graphics.printf("Returning to base in "..math.floor(player.restart_time-player.dead_dt+0.5),0,316,800,"center")
  else
    local yoffset = 8
    local padding = 0
    local xoffset = 8
    local width = 200-16
    prelevel.stat("HP "..player.char.hp_cur.."/"..player.char.hp,0+xoffset,yoffset,width,32,player.char.hp_cur,player.char.hp,{127,63,63})
    local bullet_text
    if bullets.last_shoot == bullets.base_shoot/player.char.spd then
      bullet_text = "Ready"
    else
      bullet_text = "Reloading..."
    end
    prelevel.stat(bullet_text,200+xoffset,yoffset,width,32,bullets.last_shoot,bullets.base_shoot/player.char.spd,{63,127,63})
    prelevel.stat("Wave "..enemy.cwave.."/"..#enemy.wave,400+xoffset,yoffset,width,32,enemy.cwave,#enemy.wave,{63,127,63})
    prelevel.stat(enemy.getScoreString(),600+xoffset,yoffset,width,32,enemy.current_score,enemy.max_score,{63,127,63})
  end
end

function gui.update(dt)

end

return gui
