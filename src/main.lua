chartlib = require('chartlib/chartlib')
chart_fps = chartlib.new(200)
horizion = require("horizon/horizon")

debug = true
pause = false

function love.load(arg)
  horizon.load(arg)
end

function love.draw()
  horizon.draw()
  if debug then
    love.graphics.printf("DEBUG [~]",32,16,200,"center")
    chart_fps:draw("fps",32,32,nil,64)
  end
  if pause then
    love.graphics.printf("PAUSED [F1]",0,16,800,"center")
  end
end

test_dino_x = 400-64/2
test_dino_y = 600
function love.update(dt)
  chart_fps:push(love.timer.getFPS())
  if not pause then
    horizon.update(dt)
    if love.keyboard.isDown("a") then
      test_dino_x = test_dino_x - dt * 300
    end
    if love.keyboard.isDown("d") then
      test_dino_x = test_dino_x + dt * 300
    end
    if love.keyboard.isDown("w") then
      test_dino_y = test_dino_y - dt * 300
    end
    if love.keyboard.isDown("s") then
      test_dino_y = test_dino_y + dt * 300
    end
  end
end

function love.keypressed(key)
  if key == "`" then
    debug = not debug
  elseif key == "f1" then
    pause = not pause
  end
end

test_pic = love.graphics.newImage("test.png")
function test_func(i,y)
  if i==horizon.max_lines-32 then
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(test_pic,test_dino_x,test_dino_y)
  end
end

horizon.add_layer_callback(test_func)
