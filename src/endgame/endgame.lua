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
end

function endgame.keypressed(key,unicode)
  state = "menu"
  love.load(arg)
end

function endgame.mousepressed(key,unicode)
  state = "menu"
  love.load(arg)
end

return endgame
