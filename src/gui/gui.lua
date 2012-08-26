gui = {}

function gui.load(arg)

end

function gui.draw()
  if player.char.dead and not player.current_say then
    love.graphics.printf("Returning to base in "..math.floor(player.restart_time-player.dead_dt+0.5),0,316,800,"center")
  else
    prelevel.stat("HP "..player.char.hp_cur.."/"..player.char.hp,800-48-128,56+128,128+32,32,player.char.hp_cur,player.char.hp,{127,63,63})
    local bullet_text
    if bullets.last_shoot == bullets.base_shoot/player.char.spd then
      bullet_text = "Ready"
    else
      bullet_text = "Reloading..."
    end
    prelevel.stat(bullet_text,800-48-128,56+128+40,128+32,32,bullets.last_shoot,bullets.base_shoot/player.char.spd,{63,127,63})
    prelevel.stat("Wave "..enemy.cwave.."/"..#enemy.wave,800-48-128,56+128+80,128+32,32,enemy.cwave,#enemy.wave,{63,127,63})
    prelevel.stat(enemy.getScoreString(),800-48-128,56+128+120,128+32,32,enemy.current_score,enemy.max_score,{63,127,63})
  end
end

function gui.update(dt)

end

return gui
