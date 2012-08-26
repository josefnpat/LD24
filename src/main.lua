require("git")
git_string = "git: v"..git_count.." ["..git.."]";
print(git_string)

math.randomseed( os.time() )

require 'slam'
splashlovelib = require("splashlovelib/splashlovelib")
splashlib = require("splashlib/splashlib")
prelevel = require('prelevel/prelevel')
chartlib = require('chartlib/chartlib')
chart_fps = chartlib.new(200)
horizion = require("horizon/horizon")
gui = require("gui/gui")
player = require("player/player")
script = require("script/script")
debug = require("debug/debug")
bullets = require("bullets/bullets")
enemy = require("enemy/enemy")
endgame = require("endgame/endgame")
lovemenu = require("lovemenu")

font_ld24_small = love.graphics.newFont("assets/ld24.ttf",16)
font_ld24_small:setLineHeight(1.2)
font_ld24_large = love.graphics.newFont("assets/ld24.ttf",32)
font_ld24_xlarge = love.graphics.newFont("assets/ld24.ttf",64)
love.graphics.setFont(font_ld24_small)

pause = false

state = "splashlove"

function love.load(arg)
  horizon.load(arg)
  player.load(arg)
  prelevel.load(arg)
  bullets.load(arg)
  gui.load(arg)
  enemy.load(arg)
  enemy.reset()
  lovemenu.load(arg)
end

function love.draw()
  if state == "splashlove" then
    splashlovelib.draw()
  elseif state == "splash" then
    splashlib.draw()
  elseif state == "menu" then
    lovemenu.draw()
  elseif state == "game" then
    horizon.draw()
    player.draw()
    bullets.draw()
    enemy.draw()
    gui.draw()
  elseif state =="prelevel" then
    prelevel.draw()
  elseif state =="endgame" then
    endgame.draw()
  end
  if pause then
    love.graphics.setColor(0,0,0,224)
    love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),love.graphics.getHeight())
    love.graphics.setColor(255,255,255,255)
    love.graphics.setFont(font_ld24_large)
    love.graphics.printf("GAME PAUSED",0,300,800,"center")
    love.graphics.setFont(font_ld24_small)
    love.graphics.printf("Press "..keybinding.pause.." to return to menu\nPress anything else to continue.",0,332,800,"center")
  end
  debug.draw()
end

function love.update(dt)
  chart_fps:push(love.timer.getFPS())
  if debug.hard_pause then return end
  if state == "splashlove" then
    splashlovelib.update(dt)
    if splashlovelib.done() then
      state = "splash"
    end
  elseif state == "splash" then
    splashlib.update(dt)
    if splashlib.done then
      state = "menu"
    end
  elseif state == "menu" then
    lovemenu.update(dt)
  elseif state == "game" then
    if not pause then
      horizon.update(dt)
      bullets.update(dt)
      player.update(dt)
      gui.update(dt)
      enemy.update(dt)
    end 
  elseif state =="prelevel" then
    prelevel.update(dt)  
  end
end

function love.keypressed(key,unicode)
  debug.keypressed(key)
  if state == "splashlove" then
    state = "splash"
  elseif state == "splash" then
    state = "menu"
    love.audio.stop( )
  elseif state == "menu" then
    lovemenu.keypressed(key,unicode)
  elseif state == "game" then
    if not pause and key ~= keybinding.pause  then
      bullets.keypressed(key)
    end
    wtfpausefuckoffimtired(key)
  elseif state =="prelevel" then
    if not pause and key ~= keybinding.pause then
      prelevel.keypressed(key)
    end
     wtfpausefuckoffimtired(key)
  elseif state =="endgame" then
    endgame.keypressed(key,unicode)
  end
end

function wtfpausefuckoffimtired(key)
  if key == keybinding.pause then
    if pause then
      state = "menu"
      pause = false
    else
      pause = true
    end
  elseif pause then
     pause = false
  end
end

function love.mousepressed(x,y,button)
  if state == "splashlove" then
    state = "splash"
  elseif state == "splash" then
    state = "menu"
    love.audio.stop( )
  elseif state == "menu" then
    lovemenu.mousepressed(x,y,button)
  elseif state == "prelevel" then
    prelevel.mousepressed()
  elseif state =="endgame" then
    endgame.mousepressed(x,y,button)
  end
end
