splashlib = {}

splashlib.postbeep = love.audio.newSource( "splashlib/postbeep.ogg", "stream" )

splashlib.bg = love.graphics.newImage("splashlib/bg.png")
splashlib.fg = love.graphics.newImage("splashlib/fg.png")

splashlib.font = love.graphics.newFont("splashlib/commodore64.ttf",16)

function splashlib.roman(year)
  local r = ""
  roman = {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"}
  decim = {1000,900,500,400,100,90,50,40,10,9,5,4,1}  
  local m
  for i = 1,#roman do
    m = math.floor(year/decim[i])
    r = r .. string.rep(roman[i],m)
    year = year % decim[i]
  end
  return r
end

splashlib.strings = {}
splashlib.strings_limit = 80
splashlib.strings_newlines = 31
splashlib.copy = "josefnpat © "..splashlib.roman(2012)
splashlib.sub = "PROUDLY PRESENTS ..."
splashlib.strings[1] = 
"          .S_SsS_S.    .S    sSSs    sSSs   .S   .S_sSSs      sSSSSs           \n"..
"         .SS~S*S~SS.  .SS   d%%SP   d%%SP  .SS  .SS~YS%%b    d%%%%SP           \n"..
"         S%S `Y' S%S  S%S  d%S'    d%S'    S%S  S%S   `S%b  d%S'               \n"..
"         S%S     S%S  S%S  S%|     S%|     S%S  S%S    S%S  S%S                \n"..
"         S%S     S%S  S&S  S&S     S&S     S&S  S%S    S&S  S&S                \n"..
"         S&S     S&S  S&S  Y&Ss    Y&Ss    S&S  S&S    S&S  S&S                \n"..
"         S&S     S&S  S&S  `S&&S   `S&&S   S&S  S&S    S&S  S&S                \n"..
"         S&S     S&S  S&S    `S*S    `S*S  S&S  S&S    S&S  S&S sSSs           \n"..
"         S*S     S*S  S*S     l*S     l*S  S*S  S*S    S*S  S*b `S%%           \n"..
"         S*S     S*S  S*S    .S*P    .S*P  S*S  S*S    S*S  S*S   S%           \n"..
"         S*S     S*S  S*S  sSS*S   sSS*S   S*S  S*S    S*S   SS_sSSS           \n"..
"         SSS     S*S  S*S  YSS'    YSS'    S*S  S*S    SSS    Y~YSSY           \n"..
"                 SP   SP                   SP   SP                             \n"..
"                 Y    Y                    Y    Y                              \n"..
"\n"..
"     sSSs    sSSs   .S_sSSs    sdSS_SSSSSSbs   .S   .S_sSSs      sSSs  S.      \n"..
"    d%%SP   d%%SP  .SS~YS%%b   YSSS~S%SSSSSP  .SS  .SS~YS%%b    d%%SP  SS.     \n"..
"   d%S'    d%S'    S%S   `S%b       S%S       S%S  S%S   `S%b  d%S'    S%S     \n"..
"   S%|     S%S     S%S    S%S       S%S       S%S  S%S    S%S  S%S     S%S     \n"..
"   S&S     S&S     S%S    S&S       S&S       S&S  S%S    S&S  S&S     S&S     \n"..
"   Y&Ss    S&S_Ss  S&S    S&S       S&S       S&S  S&S    S&S  S&S_Ss  S&S     \n"..
"   `S&&S   S&S~SP  S&S    S&S       S&S       S&S  S&S    S&S  S&S~SP  S&S     \n"..
"     `S*S  S&S     S&S    S&S       S&S       S&S  S&S    S&S  S&S     S&S     \n"..
"      l*S  S*b     S*S    S*S       S*S       S*S  S*S    S*S  S*b     S*b     \n"..
"     .S*P  S*S.    S*S    S*S       S*S       S*S  S*S    S*S  S*S.    S*S.    \n"..
"   sSS*S    SSSbs  S*S    S*S       S*S       S*S  S*S    S*S   SSSbs   SSSbs  \n"..
"   YSS'      YSSP  S*S    SSS       S*S       S*S  S*S    SSS    YSSP    YSSP  \n"..
"                   SP               SP        SP   SP                          \n"..
"                   Y                Y         Y    Y                           \n"..
"\n"..
splashlib.sub..string.rep(" ",splashlib.strings_limit-string.len(splashlib.copy)-string.len(splashlib.sub))..splashlib.copy

splashlib.offsetx = (love.graphics.getWidth()-splashlib.font:getWidth(string.rep("X",80)))/2
splashlib.offsety = (love.graphics.getHeight()-splashlib.font:getHeight()*splashlib.strings_newlines)/2 

splashlib.alpha = 0
function splashlib.draw()
  local old_font = love.graphics.getFont()
  love.graphics.setFont(splashlib.font) 
  local r,g,b,a = love.graphics.getColor()
  if not splashlib.fade  then
    love.graphics.setColor(0,255,0,math.floor(splashlib.alpha*9/10))
  else
    love.graphics.setColor(0,255,0,math.floor(math.floor(splashlib.fade_alpha)))
  end
  love.graphics.draw(splashlib.bg,love.graphics.getWidth()/2-400-50,love.graphics.getHeight()/2-300-50)
  for i = 1,#splashlib.strings do
    love.graphics.print(string.sub(splashlib.strings[i],0,string.len(splashlib.strings[i])*splashlib.alpha/255),splashlib.offsetx,(i-1)*splashlib.font:getHeight()+splashlib.offsety)  
  end
  love.graphics.setColor(0,255,0,math.floor(splashlib.alpha/2))
  love.graphics.draw(splashlib.fg,love.graphics.getWidth()/2-400,love.graphics.getHeight()/2-300)
  love.graphics.setColor(r,g,b,a)
  if old_font then
    love.graphics.setFont(old_font)
  end
end

splashlib.t = 0
splashlib.fade = false
splashlib.fade_alpha = 255
function splashlib.update(dt)
  if not splashlib.sound_play then
    love.audio.play(splashlib.postbeep)
    splashlib.sound_play = true
  end
  splashlib.t = splashlib.t + dt
  if splashlib.fade then
    splashlib.fade_alpha = splashlib.fade_alpha - dt*100
    if splashlib.fade_alpha < 0 then
      splashlib.fade_alpha = 0
      splashlib.done = true
    end
  else
    if splashlib.alpha < 255 then
      splashlib.alpha = math.floor(splashlib.t^2*15)
    else
      splashlib.alpha = 255
      if splashlib.t > 10-2.55 then
        splashlib.fade = true
      end
    end
  end
end

return splashlib
