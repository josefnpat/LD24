endgame = {}

function endgame.draw()
  love.graphics.printf("Game over.",0,300,800,"center")
end

function endgame.keypressed(key,unicode)
  state = "menu"
  love.load(arg)
end

return endgame
