sounds = {}
sounds.kurtz = {}
sounds.kurtz.placeholder = love.audio.newSource("assets/say1.wav", "stream" )
sounds.kurtz.intro = sounds.kurtz.placeholder--love.audio.newSource("assets/say/ki.wav", "stream" )
sounds.kurtz.death = sounds.kurtz.placeholder--love.audio.newSource("assets/say/kd.wav", "stream" )
sounds.kurtz.wave = {}
sounds.kurtz.wave[2] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k2.wav", "stream" )
sounds.kurtz.wave[3] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k3.wav", "stream" )
sounds.kurtz.wave[4] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k4.wav", "stream" )
sounds.kurtz.wave[5] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k5.wav", "stream" )
sounds.kurtz.wave[6] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k6.wav", "stream" )
sounds.kurtz.wave[7] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k7.wav", "stream" )
sounds.kurtz.wave[8] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k8.wav", "stream" )
sounds.kurtz.wave[9] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k9.wav", "stream" )
sounds.kurtz.wave[10] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k10.wav", "stream" )
sounds.kurtz.wave[11] = sounds.kurtz.placeholder--love.audio.newSource("assets/say/k11.wav", "stream" )

sounds.tuxxer = {}
sounds.tuxxer.placeholder = love.audio.newSource("assets/say2.wav", "stream" )
sounds.tuxxer.intro = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/ti.wav", "stream" )
sounds.tuxxer.death = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/td.wav", "stream" )
sounds.tuxxer.wave = {}
sounds.tuxxer.wave[2] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t2.wav", "stream" )
sounds.tuxxer.wave[3] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t3.wav", "stream" )
sounds.tuxxer.wave[4] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t4.wav", "stream" )
sounds.tuxxer.wave[5] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t5.wav", "stream" )
sounds.tuxxer.wave[6] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t6.wav", "stream" )
sounds.tuxxer.wave[7] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t7.wav", "stream" )
sounds.tuxxer.wave[8] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t8.wav", "stream" )
sounds.tuxxer.wave[9] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t9.wav", "stream" )
sounds.tuxxer.wave[10] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t10.wav", "stream" )
sounds.tuxxer.wave[11] = sounds.tuxxer.placeholder--love.audio.newSource("assets/say/t11.wav", "stream" )

sounds.charlie = {}
sounds.charlie.placeholder = love.audio.newSource("assets/say3.wav", "stream" )
sounds.charlie.intro = sounds.charlie.placeholder--love.audio.newSource("assets/say/ci.wav", "stream" )
sounds.charlie.death = sounds.charlie.placeholder--love.audio.newSource("assets/say/cd.wav", "stream" )
sounds.charlie.wave = {}
sounds.charlie.wave[2] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c2.wav", "stream" )
sounds.charlie.wave[3] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c3.wav", "stream" )
sounds.charlie.wave[4] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c4.wav", "stream" )
sounds.charlie.wave[5] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c5.wav", "stream" )
sounds.charlie.wave[6] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c6.wav", "stream" )
sounds.charlie.wave[7] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c7.wav", "stream" )
sounds.charlie.wave[8] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c8.wav", "stream" )
sounds.charlie.wave[9] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c9.wav", "stream" )
sounds.charlie.wave[10] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c10.wav", "stream" )
sounds.charlie.wave[11] = sounds.charlie.placeholder--love.audio.newSource("assets/say/c11.wav", "stream" )

script = {}

function player.kurtz.lifesay()
  sounds.kurtz.placeholder:play()
  player.say("Kurtz, don't screw around. We've only got three tries to get this right.",3,player.charlie)
  player.say("If at first you don't succeed, destroy all the evidence.",3)
  player.say("Seriously, we only have three nukes to fry this computer!",3,player.tuxxer)
  player.say("That is if we even make it to the central computer...",3)
end

function player.kurtz.deathsay()
  sounds.kurtz.placeholder:play()
  player.say("Shit! Housten, we may have a probl...",3)
  player.say("...",3,player.charlie)
  player.say("Kurtz!",3,player.tuxxer)
end

function player.kurtz.wavesay()
  if enemy.cwave == 2 then
    sounds.kurtz.wave[ 2]:play()
  elseif enemy.cwave == 3 then
    sounds.kurtz.wave[ 3]:play()
  elseif enemy.cwave == 4 then
    sounds.kurtz.wave[ 4]:play()
  elseif enemy.cwave == 5 then
    sounds.kurtz.wave[ 5]:play()
  elseif enemy.cwave == 6 then
    sounds.kurtz.wave[ 6]:play()
  elseif enemy.cwave == 7 then
    sounds.kurtz.wave[ 7]:play()
  elseif enemy.cwave == 8 then
    sounds.kurtz.wave[ 8]:play()
  elseif enemy.cwave == 9 then
    sounds.kurtz.wave[ 9]:play()
  elseif enemy.cwave == 10 then
    sounds.kurtz.wave[10]:play()
  elseif enemy.cwave == 11 then
    sounds.kurtz.wave[11]:play()
  end
end

function player.tuxxer.lifesay()
  sounds.tuxxer.placeholder:play()
  player.say("OK, my turn!",1)
end

function player.tuxxer.deathsay()
  sounds.tuxxer.placeholder:play()
  player.say("I'm dead!",1)
end

function player.tuxxer.wavesay()
  if enemy.cwave == 2 then
    sounds.tuxxer.wave[ 2]:play()
  elseif enemy.cwave == 3 then
    sounds.tuxxer.wave[ 3]:play()
  elseif enemy.cwave == 4 then
    sounds.tuxxer.wave[ 4]:play()
  elseif enemy.cwave == 5 then
    sounds.tuxxer.wave[ 5]:play()
  elseif enemy.cwave == 6 then
    sounds.tuxxer.wave[ 6]:play()
  elseif enemy.cwave == 7 then
    sounds.tuxxer.wave[ 7]:play()
  elseif enemy.cwave == 8 then
    sounds.tuxxer.wave[ 8]:play()
  elseif enemy.cwave == 9 then
    sounds.tuxxer.wave[ 9]:play()
  elseif enemy.cwave == 10 then
    sounds.tuxxer.wave[10]:play()
  elseif enemy.cwave == 11 then
    sounds.tuxxer.wave[11]:play()
  end
end

function player.charlie.lifesay()
  sounds.charlie.placeholder:play()
  player.say("OK, my turn!",1)
end

function player.charlie.deathsay()
  sounds.charlie.placeholder:play()
  player.say("I'm dead!",1)
end

function player.charlie.wavesay()
  if enemy.cwave == 2 then
    sounds.charlie.wave[ 2]:play()
  elseif enemy.cwave == 3 then
    sounds.charlie.wave[ 3]:play()
  elseif enemy.cwave == 4 then
    sounds.charlie.wave[ 4]:play()
  elseif enemy.cwave == 5 then
    sounds.charlie.wave[ 5]:play()
  elseif enemy.cwave == 6 then
    sounds.charlie.wave[ 6]:play()
  elseif enemy.cwave == 7 then
    sounds.charlie.wave[ 7]:play()
  elseif enemy.cwave == 8 then
    sounds.charlie.wave[ 8]:play()
  elseif enemy.cwave == 9 then
    sounds.charlie.wave[ 9]:play()
  elseif enemy.cwave == 10 then
    sounds.charlie.wave[10]:play()
  elseif enemy.cwave == 11 then
    sounds.charlie.wave[11]:play()
  end
end

return script
