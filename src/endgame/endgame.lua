endgame = {}

function endgame.draw()

  love.graphics.setFont(font_ld24_xlarge)
  
  love.graphics.printf("Game over.",0,300-32,800,"center")
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
  love.graphics.printf(enemy.getScoreString().." "..enemy.current_score.."/"..enemy.max_score,0,428,800,"center")
  
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
