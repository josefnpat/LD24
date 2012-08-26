sounds = {}
sounds.kurtz = {}
sounds.kurtz.placeholder = love.audio.newSource("assets/say1.wav", "stream" )

sounds.tuxxer = {}
sounds.tuxxer.placeholder = love.audio.newSource("assets/say2.wav", "stream" )

sounds.charlie = {}
sounds.charlie.placeholder = love.audio.newSource("assets/say3.wav", "stream" )

script = {}

function player.kurtz.lifesay()
  sounds.kurtz.placeholder:play()
  player.say("OK, my turn!",1)
end

function player.kurtz.deathsay()
  sounds.kurtz.placeholder:play()
  player.say("I'm dead!",1)
end

function player.kurtz.wavesay()
  sounds.kurtz.placeholder:play()
  player.say("Wave "..enemy.cwave.."!",2)
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
  sounds.tuxxer.placeholder:play()
  player.say("Wave "..enemy.cwave.."!",2)
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
  sounds.charlie.placeholder:play()
  player.say("Wave "..enemy.cwave.."!",2)
end

return script
