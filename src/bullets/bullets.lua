bullets = {}

function bullets.draw()

end

function bullets.update(dt)

end

function bullets.keypressed(key)
  if key == keybinding.shoot then
    print("shoot!")
  end
end

return bullets
