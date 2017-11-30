function powerUpLoad()  
  powerUp = {}
  powerUp.sprite = love.graphics.newImage()
  powerUp.type = 0
  powerUp.x = 300
  powerUp.y = -120
  powerUp.height = 30
  powerUp.width = 30
  powerUp.fallSpeed = 3
  powerUp.appear = false
  powerUp.delay = 1000
  powerUp.timer = powerUp.delay
end 

function powerUpDraw()
 if (powerUp.appear == true) then
    love.
  end
  
end

function powerUpUpdate()
  WhichpowerUp()
  powerUpTimer()
end


function WhichpowerUp()
  if (powerUp.appear == true) then
    powerUp.type = math.random(1,4)
    if (powerUp.type == 1) then
      --Invulnerbility code
      
      
    end
    
  end

end

function powerUpTimer()
  powerUp.timer = powerUp.timer - 1
  if powerUp.timer <= 0 then
    powerUp.appear = true
    powerUp.timer = powerUp.delay
  else
    powerUp.appear = false
  end
end

end