function powerupLoad()  
  powerUP = {}
  powerUP.key = 0
  powerUP.chosen 
  powerUP.x = 300
  powerUP.fallSpeed = 3
  powerUP.appear = false
  powerUP.delay = 1000
  powerUp.timer = powerUp.delay
end 

function powerupDraw()

  
end

function powerUpUpdate()
  WhichPowerUp()
  PowerUpTimer
end


function WhichPowerUp()
  if (powerUP.appear == true) then
    powerUP.key = math.random(1, 4)
    
    if powerUP.key == 1 then
        powerUP.chosen = require "invulnerability"
    elseif powerUP.key == 2 then
      powerUP.chosen = require "shield"
    elseif powerUP.key == 3 then
      powerUP.chosen  = "bullets"
    elseif powerUP.key == 4 then
      powerUP.chosen = "whatever"      
    end 
  end
end

function PowerUpTimer()
  powerUP.timer = powerUP.timer - 1
  if powerUP.timer <= 0 then
    powerUP.appear = true
    powerUP.timer = powerUP.delay
  else
    powerUP.appear = false
  end
end



