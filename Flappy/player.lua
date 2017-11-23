function playerLoad()
  ship = {}
  ship.img = love.graphics.newImage("sprites/flappy.png")
  ship.posX = 150
  ship.posY = 400
  ship.isFiring = false
  ship.fireCooldown = 60
  ship.health = 3
  ship.tempInvul = true
  ship.invulTimer = 30
  ship.shieldImage = love.graphics.newImage("sprites/shipShield.png")
  gameLoss = false
end

function playerDraw()
  love.graphics.draw(ship.img, ship.posX, ship.posY)
  if ship.tempInvul == true then
    love.graphics.draw(ship.shieldImage, ship.posX, ship.posY)
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
  else
    ship.tempInvul = false
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
  ship.fireCooldown = ship.fireCooldown -1
  
  if ship.fireCooldown == 0 then
    ship.isFiring = true
    ship.fireCooldown = 60
  else
    ship.isFiring = false
    end
  end
  
  function takeDamage()
    if ship.tempInvul == false then
      ship.health = ship.health-1
        if ship.health <= 0 then
          ship.img = love.graphics.newImage("sprites/shipShield.png")
          gameLoss = true
        else
          ship.invulTimer = 120
        end
        
      end
   end