function powerUpLoad()  
  powerUp = {}
  powerUp.healthSprite = love.graphics.newImage("sprites/health_powerup.png")
  powerUp.bulletSprite = love.graphics.newImage("sprites/bullet_powerup.png")
  powerUp.invulnerabilitySprite = love.graphics.newImage("sprites/invulnerability_powerup.png")
  powerUp.type = 0
  powerUp.power = ""
  powerUp.x = math.random(40, 300)
  powerUp.y = -50
  powerUp.height = 30
  powerUp.width = 30
  powerUp.fallSpeed = 3
  powerUp.appear = false
  powerUp.isOn = false
  powerUp.appearDelay = math.random(350, 900)
  powerUp.delay = 300
  powerUp.timer = powerUp.delay
  powerUp.appearTimer = powerUp.appearDelay
  
end 

function powerUpDraw()
  
 if (powerUp.appear == true and powerUp.isOn == false) then
  if (powerUp.power == "health") then
    love.graphics.draw(powerUp.healthSprite, powerUp.x, powerUp.y)
  elseif (powerUp.power == "bullets") then
    love.graphics.draw(powerUp.bulletSprite, powerUp.x, powerUp.y)
  elseif (powerUp.power == "invulnerability") then
    love.graphics.draw(powerUp.invulnerabilitySprite, powerUp.x, powerUp.y)
  end
 end
  
end


function powerUpUpdate()
  WhichpowerUp()
  PowerUpMovement()
  powerUpAppearTimer()
  
end

function powerUpTimer()
  powerUp.timer = powerUp.timer - 1
  
 --[[ if powerUp.timer <= 0 then
    powerUp.isOn = false  
    powerUp.timer = powerUp.delay
  end]]--
  
end


function PowerUpMovement()
  if (powerUp.appear == true and powerUp.isOn == false) then
    powerUp.y = powerUp.y + powerUp.fallSpeed
  end
  
  if (powerUp.y >= 680) then
    powerUp.y = -50
    powerUp.appear = false
  end
  
  if powerUp.y + powerUp.height < 0 then
    powerUp.x = math.random(40, 300)
  end
  
  
end


function WhichpowerUp()
  if (powerUp.appear == true and (powerUp.y + powerUp.height <= 0)) then
    
    powerUp.type = math.random(1,3)
    if (powerUp.type == 1) then
      powerUp.power = "invulnerability"
    elseif (powerUp.type == 2) then
      powerUp.power = "health"
    elseif (powerUp.type == 3) then
      powerUp.power = "bullets"
    end
  end

end


function powerUpAppearTimer()
  if powerUp.appear == false then
    powerUp.appearTimer = powerUp.appearTimer - 1
  end
  
  if powerUp.isOn == true or powerUp.y >= 1280/2 then 
    powerUp.appearTimer = powerUp.appearDelay
  end
  
  if (powerUp.appearTimer <= 0) then
    powerUp.appear = true
  end
  
end
