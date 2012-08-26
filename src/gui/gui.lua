gui = {}

function gui.load(arg)

end

function gui.draw()
  local bullet_text
  prelevel.stat("HP:"..player.char.hp_cur.."/"..player.char.hp,800-48-128,56+128,128+32,player.char.hp_cur,player.char.hp,{127,63,63})
  if bullets.last_shoot == bullets.base_shoot/player.char.spd then
    bullet_text = "Ready"
  else
    bullet_text = "Reloading..."
  end
  prelevel.stat(bullet_text,800-48-128,56+128+40,128+32,bullets.last_shoot,bullets.base_shoot/player.char.spd,{63,127,63})
end

function gui.update(dt)

end

return gui
