script = {}

function player.kurtz.lifesay()
  player.say("OK, my turn!",1)
end

function player.kurtz.deathsay()
  player.say("I'm dead!",1)
end

function player.kurtz.wavesay()
  player.say("Wave "..enemy.cwave.."!",2)
end

function player.tuxxer.lifesay()
  player.say("OK, my turn!",1)
end

function player.tuxxer.deathsay()
  player.say("I'm dead!",1)
end

function player.tuxxer.wavesay()
  player.say("Wave "..enemy.cwave.."!",2)
end

function player.charlie.lifesay()
  player.say("OK, my turn!",1)
end

function player.charlie.deathsay()
  player.say("I'm dead!",1)
end

function player.charlie.wavesay()
  player.say("Wave "..enemy.cwave.."!",2)
end

return script
