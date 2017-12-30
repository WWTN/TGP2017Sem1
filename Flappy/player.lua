local laserAudio = love.audio.newSource('Audio/Player/PlayerLaser.wav')
local hurtAudio = love.audio.newSource('Audio/Player/Hit_Hurt.wav') 
local shieldAudio = love.audio.newSource('Audio/Player/Shield.wav')

function playerLoad()
  ship = {}
  ship.posX = 150
  ship.posY = 400
  ship.isFiring = false
  ship.fireCooldown = 60
  ship.coolDown = 60
  ship.health = 5
  ship.healthIncrease = false
  ship.tempInvul = false
  ship.invulTimer = 30
  ship.bulletPU = false
  ship.sprite = love.graphics.newImage("sprites/flappy.png")
  ship.bulletImage = love.graphics.newImage("sprites/shipBulletPU.png")
  ship.shieldImage = love.graphics.newImage("sprites/shipShield.png")
  ship.healthImage = love.graphics.newImage("sprites/ShipPlusHealth.png")
  ship.img = ship.sprite
  gameLoss = false
  
  shieldAudio:setLooping(true)
  shieldAudio:setVolume(0.25)
end

function playerDraw()
  if ship.bulletPU == true then
    ship.img = ship.bulletImage
  else  
    ship.img = ship.sprite
  end
  
  love.graphics.draw(ship.img, ship.posX, ship.posY)
    
    if ship.tempInvul == true then
      love.graphics.draw(ship.shieldImage, ship.posX, ship.posY)
    elseif ship.healthIncrease == true then
      love.graphics.draw(ship.healthImage, ship.posX, ship.posY)
      ship.healthIncrease = false
    end
    
end

function playerUpdate()
  
  if love.mouse.isDown(1) then
    moveToMouse()
   
  else
    
    fire()
  end
  
  if ship.invulTimer > 0 then
    ship.invulTimer = ship.invulTimer-1
    ship.tempInvul = true
    shieldAudio:play()
  else
    ship.tempInvul = false
    shieldAudio:stop()
  end
end

function moveToMouse()
  pointX = love.mouse.getX() - 30
  pointY = love.mouse.getY() - 30
  
   if ship.posX > pointX then
     ship.posX = ship.posX - ((ship.posX-pointX)/ 10)
   elseif ship.posX < pointX then
     ship.posX = ship.posX + ((pointX - ship.posX)/ 10)
   end
   
     if ship.posY > pointY then
     ship.posY = ship.posY - ((ship.posY-pointY)/ 10)
   elseif ship.posY < pointY then
     ship.posY = ship.posY + (((pointY - ship.posY)/ 10))
   end
   
end

function fire()
  if (ship.bulletPU == true) then
    ship.coolDown = 30
  else
    ship.coolDown = 60
  end
  
  ship.fireCooldown = ship.fireCooldown -1
  
    if ship.fireCooldown == 0 then
      laserAudio:play()
      ship.isFiring = true
      ship.fireCooldown = ship.coolDown
     -- count = count + 1
    else
      ship.isFiring = false
    end

  end
  
  function takeDamage()
    if ship.tempInvul == false then
      ship.health = ship.health-1
      hurtAudio:play()
        if ship.health <= 0 then
          ship.img = love.graphics.newImage("sprites/shipShield.png")
          gameLoss = true
        else
          ship.invulTimer = 120
        end    
      end
      
   end