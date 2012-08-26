menu = require("menu/menu")

lovemenu = {}

function lovemenu.load()
  menu.run = true
  menu_view = {}
  menu_view[1] = {
    title="Untitled",
    desc="Never before has mankind seen such a sexy menu screen. Presenting the lovemenu.",
    {t="New Game",cb="ng"},
    {t="Options",cb="op"},
    {t="Credits",cb="cr"},
    {t="Exit",cb="exit"}
  }
  menu_view[2] = {
    title="Options",
    desc="Set your options here.",
    {t="Fullscreen",cb="fs"},
    {t="SFX (on)",cb="sfx"},
    {t="Music (on)",cb="music"},
    {t="Return",cb="mm"}
  }
  menu_view[3] = {
    title="Quit",
    desc="Are you sure you want to quit?",
    {t="Confirm",cb="cexit"},
    {t="Return",cb="mm"}
  }
  menu_view[4] = {
    title="Credits",
    desc="Programmer: josefnpat\nArt: josefnpat\nSound: josefnpat\nVoice of Kurtz: josefnpat\nVoice of Tuxxer: Amanda\nVoice of Charlie: josefnpat",
    {t="Return",cb="mm"}
  }
  menu:load(menu_view)
  
  lovemenu.rand = math.random(1,3)
  menu.char = player.chars[lovemenu.rand]
  menu.icon = menu.char.bullet
  menu.bg = love.graphics.newImage("assets/bg"..lovemenu.rand..".png")
  
end

function menu.extralayercallback()
  love.graphics.draw(player.chars[lovemenu.rand].portrait,400,600-256)
  love.graphics.setColor(player.chars[lovemenu.rand].color[1],player.chars[lovemenu.rand].color[2],player.chars[lovemenu.rand].color[3],127)
  love.graphics.draw(player.chars[lovemenu.rand].ship_full,0,(love.graphics.getHeight()-player.chars[lovemenu.rand].ship_full:getHeight())/3)
end

function lovemenu.draw()
  menu:draw()
end

curbg = 0
function lovemenu.keypressed(key,unicode)
  menu:keypressed(key)
end

sfx = true
music = true
function menu:callback(cb)
  if cb == "ng" then
    state = "prelevel"
  elseif cb == "op" then
    menu:setstate(2)
  elseif cb == "cr" then
    menu:setstate(4)
  elseif cb == "exit" then
    menu:setstate(3)
  elseif cb == "cexit" then
    love.event.quit()
  elseif cb == "fs" then
    love.graphics.toggleFullscreen( )
  elseif cb == "sfx" then
    sfx = not sfx
    local temp_x = ""
    if sfx then
      temp_s = "on"
    else
      temp_s = "off"
    end
    menu_view[2][2].t = "SFX ("..temp_s..")"
  elseif cb == "music" then
    music = not music
    local temp_x = ""
    if music then
      temp_s = "on"
    else
      temp_s = "off"
    end
    menu_view[2][3].t = "Music ("..temp_s..")"
  elseif cb == "mm" then
    menu:setstate(1)
  else
    print("unknown command:"..cb)
  end
end

function lovemenu.update(dt)
  menu:update(dt)
end

function lovemenu.mousepressed(x,y,button)
  menu:mousepressed(x,y,button)
end

return lovemenu
