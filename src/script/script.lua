sounds = {}
sounds.kurtz = {}
sounds.kurtz.placeholder = love.audio.newSource("assets/say1.ogg", "stream" )
sounds.kurtz.intro = love.audio.newSource("assets/say/ki.ogg", "stream" )
sounds.kurtz.death = love.audio.newSource("assets/say/kd.ogg", "stream" )
sounds.kurtz.wave = {}
sounds.kurtz.wave[2] = love.audio.newSource("assets/say/kw2.ogg", "stream" )
sounds.kurtz.wave[3] = love.audio.newSource("assets/say/kw3.ogg", "stream" )
sounds.kurtz.wave[4] = love.audio.newSource("assets/say/kw4.ogg", "stream" )
sounds.kurtz.wave[5] = love.audio.newSource("assets/say/kw5.ogg", "stream" )
sounds.kurtz.wave[6] = love.audio.newSource("assets/say/kw6.ogg", "stream" )
sounds.kurtz.wave[7] = love.audio.newSource("assets/say/kw7.ogg", "stream" )
sounds.kurtz.wave[8] = love.audio.newSource("assets/say/kw8.ogg", "stream" )
sounds.kurtz.wave[9] = love.audio.newSource("assets/say/kw9.ogg", "stream" )
sounds.kurtz.wave[10] = love.audio.newSource("assets/say/kw10.ogg", "stream" )
sounds.kurtz.wave[11] = love.audio.newSource("assets/say/kw11.ogg", "stream" )

sounds.tuxxer = {}
sounds.tuxxer.placeholder = love.audio.newSource("assets/say2.ogg", "stream" )
sounds.tuxxer.intro = love.audio.newSource("assets/say/ti.ogg", "stream" )
sounds.tuxxer.death = love.audio.newSource("assets/say/td.ogg", "stream" )
sounds.tuxxer.wave = {}
sounds.tuxxer.wave[2] = love.audio.newSource("assets/say/tw2.ogg", "stream" )
sounds.tuxxer.wave[3] = love.audio.newSource("assets/say/tw3.ogg", "stream" )
sounds.tuxxer.wave[4] = love.audio.newSource("assets/say/tw4.ogg", "stream" )
sounds.tuxxer.wave[5] = love.audio.newSource("assets/say/tw5.ogg", "stream" )
sounds.tuxxer.wave[6] = love.audio.newSource("assets/say/tw6.ogg", "stream" )
sounds.tuxxer.wave[7] = love.audio.newSource("assets/say/tw7.ogg", "stream" )
sounds.tuxxer.wave[8] = love.audio.newSource("assets/say/tw8.ogg", "stream" )
sounds.tuxxer.wave[9] = love.audio.newSource("assets/say/tw9.ogg", "stream" )
sounds.tuxxer.wave[10] = love.audio.newSource("assets/say/tw10.ogg", "stream" )
sounds.tuxxer.wave[11] = love.audio.newSource("assets/say/tw11.ogg", "stream" )

sounds.charlie = {}
sounds.charlie.placeholder = love.audio.newSource("assets/say3.ogg", "stream" )
sounds.charlie.intro = love.audio.newSource("assets/say/ci.ogg", "stream" )
sounds.charlie.death = love.audio.newSource("assets/say/cd.ogg", "stream" )
sounds.charlie.wave = {}
sounds.charlie.wave[2] = love.audio.newSource("assets/say/cw2.ogg", "stream" )
sounds.charlie.wave[3] = love.audio.newSource("assets/say/cw3.ogg", "stream" )
sounds.charlie.wave[4] = love.audio.newSource("assets/say/cw4.ogg", "stream" )
sounds.charlie.wave[5] = love.audio.newSource("assets/say/cw5.ogg", "stream" )
sounds.charlie.wave[6] = love.audio.newSource("assets/say/cw6.ogg", "stream" )
sounds.charlie.wave[7] = love.audio.newSource("assets/say/cw7.ogg", "stream" )
sounds.charlie.wave[8] = love.audio.newSource("assets/say/cw8.ogg", "stream" )
sounds.charlie.wave[9] = love.audio.newSource("assets/say/cw9.ogg", "stream" )
sounds.charlie.wave[10] = love.audio.newSource("assets/say/cw10.ogg", "stream" )
sounds.charlie.wave[11] = love.audio.newSource("assets/say/cw11.ogg", "stream" )

script = {}

--[[
charlie - military
kurtz - german comp sci
tuxxer - towlie
--]]


function player.kurtz.lifesay()
  sounds.kurtz.intro:play()
  player.say("Kurtz, we ain't making no goddamn cornflakes here. We've only got three tries to get this right.",6,player.charlie)
  player.say("Charlie, do I look like a nerfherder?",2.75)
  player.say("Seriously, guys, we only have three nukes to fry this computer!",5.25,player.tuxxer)
  player.say("If we even make it to the central computer, Tuxxer...",4)
end

function player.kurtz.deathsay()
  sounds.kurtz.death:play()
  player.say("Houston, we have a problem.",2.25)
  player.say("...",1,player.charlie)
  player.say("Kurtz!",1,player.tuxxer)
end

function player.kurtz.wavesay()
  if enemy.cwave == 2 then
    sounds.kurtz.wave[ 2]:play()
    player.say("From a programmer’s point of view,",1.75)
    player.say("the user is a peripheral that types when you issue a read request.",4)
  elseif enemy.cwave == 3 then
    sounds.kurtz.wave[ 3]:play()
    player.say("127.0.0.1 is where the Heart is.",4.5)
  elseif enemy.cwave == 4 then
    sounds.kurtz.wave[ 4]:play()
    player.say("Yes, we have a dress code. You have to dress.",3.5)
  elseif enemy.cwave == 5 then
    sounds.kurtz.wave[ 5]:play()
    player.say("Spock, I do not know too much about these little tribbles yet,",3)
    player.say("but there is one thing that I have discovered.",2.5)
    player.say("I like them ... better than I like you.",3)
  elseif enemy.cwave == 6 then
    sounds.kurtz.wave[ 6]:play()
    player.say("Would it save you a lot of time if I just gave up and went mad now?",4.5)
  elseif enemy.cwave == 7 then
    sounds.kurtz.wave[ 7]:play()
    player.say("He who controls the spice controls the universe.",4)
  elseif enemy.cwave == 8 then
    sounds.kurtz.wave[ 8]:play()
    player.say("I’m sorry, Dave. I’m afraid I can’t do that.",4)
  elseif enemy.cwave == 9 then
    sounds.kurtz.wave[ 9]:play()
    player.say("Strange women lying in ponds distributing swords is no basis for a system of government.",5.5)
    player.say("Supreme executive power derives from a mandate from the masses, not from some farcical aquatic ceremony.",7.5)
  elseif enemy.cwave == 10 then
    sounds.kurtz.wave[10]:play()
    player.say("Help me, Obi-Wan Kenobi; you're my only hope.",3)
  elseif enemy.cwave == 11 then
    sounds.kurtz.wave[11]:play()
    player.say("If at first you don't succeed; call it version 1.0",4.5)
  end
end

function player.tuxxer.lifesay()
  sounds.tuxxer.intro:play()
  player.say("If at first you don't succeed, destroy all the evidence",4)
end

function player.tuxxer.deathsay()
  sounds.tuxxer.death:play()
  player.say("Why are all these lights flashing red? They don't usually do that!",4)
  player.say("God damn it...",1.5,player.charlie)
end

function player.tuxxer.wavesay()
  if enemy.cwave == 2 then
    sounds.tuxxer.wave[ 2]:play()
    player.say("When all else fails, read the directions.",3.5)
  elseif enemy.cwave == 3 then
    sounds.tuxxer.wave[ 3]:play()
    player.say("Welcome to Hell...Here's your accordion.",3)
  elseif enemy.cwave == 4 then
    sounds.tuxxer.wave[ 4]:play()
    player.say("Never hit a guy with glasses. Always use your fists.",4)
  elseif enemy.cwave == 5 then
    sounds.tuxxer.wave[ 5]:play()
    player.say("The only time I open my mouth is to change feet.",4)
  elseif enemy.cwave == 6 then
    sounds.tuxxer.wave[ 6]:play()
    player.say("True friends always stab you in the front.",2.75)
  elseif enemy.cwave == 7 then
    sounds.tuxxer.wave[ 7]:play()
    player.say("I'll have to think twice about it before I give it a second thought.",4)
  elseif enemy.cwave == 8 then
    sounds.tuxxer.wave[ 8]:play()
    player.say("The meek shall inherit the Earth after we're done with it.",4)
  elseif enemy.cwave == 9 then
    sounds.tuxxer.wave[ 9]:play()
    player.say("You're schizophrenic? Gee, that makes four of us.",4)
  elseif enemy.cwave == 10 then
    sounds.tuxxer.wave[10]:play()
    player.say("Floggings will continue until morale improves.",4.5)
  elseif enemy.cwave == 11 then
    sounds.tuxxer.wave[11]:play()
    player.say("Honesty is the best policy. But insanity is a better defense.",5)
  end
end

function player.charlie.lifesay()
  sounds.charlie.intro:play()
  player.say("Gentlemen, we are being killed on the beaches. Lets go inland and be killed.",5.5)
end

function player.charlie.deathsay()
  sounds.charlie.death:play()
  player.say("Aaaarrrrrghhhh!",2.5)
end

function player.charlie.wavesay()
  if enemy.cwave == 2 then
    sounds.charlie.wave[ 2]:play()
    player.say("I never trust a fighting man who doesn't smoke or drink.",3.5)
  elseif enemy.cwave == 3 then
    sounds.charlie.wave[ 3]:play()
    player.say("Whoever said the pen is mightier then the sword obviously never encountered automatic weapons.",5.5)
  elseif enemy.cwave == 4 then
    sounds.charlie.wave[ 4]:play()
    player.say("I'd rather go down the river with seven studs than with a hundred shitheads.",4.5)
  elseif enemy.cwave == 5 then
    sounds.charlie.wave[ 5]:play()
    player.say("I do not like this word \"bomb.\" It is not a bomb. It is a device that is exploding.",6.5)
  elseif enemy.cwave == 6 then
    sounds.charlie.wave[ 6]:play()
    player.say("Give a man fire, and he'll be warm for a day, light a man on fire, and he'll be warm the rest of his life. Ha. Ha. Ha.",8.5)
  elseif enemy.cwave == 7 then
    sounds.charlie.wave[ 7]:play()
    player.say("There is no problem that cannot be solved by the use of high explosives.",5.5)
  elseif enemy.cwave == 8 then
    sounds.charlie.wave[ 8]:play()
    player.say("No bastard ever won a war by dying for his country.",3.5)
    player.say("He won it by making the other poor dumb bastard die for his country.",5)
  elseif enemy.cwave == 9 then
    sounds.charlie.wave[ 9]:play()
    player.say("This is not the end, nor is it even the beginning of the end, but it is the end of the beginning.",6)
  elseif enemy.cwave == 10 then
    sounds.charlie.wave[10]:play()
    player.say("We're surrounded. That simplifies the problem.",3.25)
  elseif enemy.cwave == 11 then
    sounds.charlie.wave[11]:play()
    player.say("Theirs not to reason why, theirs but to do and die",4)
  end
end

return script
