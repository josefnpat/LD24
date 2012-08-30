endgame = {}

function endgame.draw()
  love.graphics.setColor(255,255,255,255)
  love.graphics.setFont(font_ld24_xlarge)
  if dead == 3 then
    love.graphics.printf("Game over.",0,300-32,800,"center")
  else
    love.graphics.printf("You win!",0,300-32,800,"center")  
  end
  local dead = 0
  for i,v in pairs(player.chars) do
    if v.dead then
      dead = dead + 1
    end
  end
  
  local story
  
  if dead == 0 then
    story = "They never stood a chance."
  elseif dead == 1 then
    story = "You have lost a good friend, but saved the planet."
  elseif dead == 2 then
    story = "With all your comrades dead, you hope you can go on in life."
  else--if dead == 3
    story = "You never stood a chance anyway."
  end
  
  love.graphics.setFont(font_ld24_small)
  love.graphics.printf(story,0,364,800,"center")
  prelevel.stat(enemy.getScoreString(),200,428,400,32,enemy.current_score,enemy.max_score,{63,127,63})
  
  love.graphics.printf("Press "..keybinding.pause.." to return to the main menu.",0,492,800,"center")
end

function endgame.keypressed(key,unicode)
  if keybinding.pause == key then
    state = "menu"
    lovemenu.remove_continue_game()
    love.load(arg)
  end
end

function endgame.mousepressed(key,unicode)
  endgame.keypressed()
end

return endgame
