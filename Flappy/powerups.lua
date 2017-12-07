function powerUpLoad()  
  powerUp = {}
  powerUp.sprite = love.graphics.newImage("sprites/health_powerup.png")
  powerUp.type = 0
  powerUp.power = ""
  powerUp.x = 100
  powerUp.y = -20
  powerUp.height = 30
  powerUp.width = 30
  powerUp.fallSpeed = 3
  powerUp.appear = false
  powerUp.delay = 30
  powerUp.timer = powerUp.delay
  
end 

function powerUpDraw()
 if (powerUp.appear == true) then
    love.graphics.draw(powerUp.sprite, powerUp.x, powerUp.y)
end
  
end


function powerUpUpdate()
  WhichpowerUp()
  powerUpTimer()
  PowerUpMovement()
  
end


function PowerUpMovement()
  if (powerUp.appear == true) then
    powerUp.y = powerUp.y + powerUp.fallSpeed
  end
  
  if (powerUp.y >= 1280/2) then
    powerUp.appear = false
    powerUp.y = -20
  end
  
end


function WhichpowerUp()
  if (powerUp.appear == true) then
    powerUp.type = math.random(1,3)
    if (powerUp.type == 1) then
      powerUp.power = "invulnerability"
    elseif (powerUp.type == 2) then
      powerUp.power = "health"
    elseif (powerUp.type == 3) then
      powerUp.power = "bullets"
    end
    
  else 
    powerUp.type = 0
    powerUp.power = ""
  end

end


function powerUpTimer()
  powerUp.timer = powerUp.timer - 1
  
  if (powerUp.timer <= 0) then
    powerUp.appear = true
    powerUp.timer = powerUp.delay
  end
  
end
