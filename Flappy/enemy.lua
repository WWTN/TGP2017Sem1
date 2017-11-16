local _enemy = {}


function _enemy:new(x,y,width,height)
  enemy = {}
  setmetatable(laser, self)
  self.__index = self
  laser:_create(x,y,width,height)
  return laser
end

function _enemy:Create()
  
  end
function enemyLoad()
  
  enemy = {}
  enemy.img = love.graphics.newImage("sprites/enemy.png")
  enemy.posX = 60
  enemy.posY = -60
  enemy.width = 60
  enemy.resetPosition = -60
  enemy.health = 3
  enemy.healthReset = 3
  enemy.countDefeated = 0
  enemy.bossThreshold = 1
  enemy.isBoss = false
  enemy.speed = 3
  enemy.fireDelay = 90
  enemy.fireTimer = enemy.fireDelay
  enemy.shotSpeed = 2
  enemy.shootPos = enemy.posX
  enemy.goingRight = false
  enemy.firing = false
  gameOver = false
  
end

function enemyDraw()
  love.graphics.draw(enemy.img, enemy.posX, enemy.posY)
end

function enemyUpdate()
  
enemyMove()
enemyShoot()


end

function enemyMove()
      if enemy.posY < 50 then
      enemy.posY = enemy.posY + 5
 
      elseif (enemy.goingRight == true and enemy.isBoss == false) then
        enemy.posX = enemy.posX+1
        
      elseif enemy.goingRight == false and enemy.isBoss == false then
       enemy.posX = enemy.posX - 1
       
    end
    
    if enemy.posX < 30 then 
      enemy.goingRight = true 
    elseif enemy.posX > 200 then 
      enemy.goingRight = false end
   
    
  end
  
  function enemyShoot()
    enemy.fireTimer = enemy.fireTimer - 1
    if enemy.fireTimer <= 0 then
      enemy.shootPos = enemy.posX + 30
      if enemy.isBoss == true then
       enemy.shootPos = enemy.posX + math.random(0,120)
      end
      enemy.firing = true
      enemy.fireTimer = enemy.fireDelay
      
    else
      enemy.firing = false
    end
    
    end
  
function enemyHurt()
   enemy.health = enemy.health - 1
   
    if enemy.health == 0 and enemy.isBoss == false then
     
     enemy.countDefeated = enemy.countDefeated +1
     
     if enemy.countDefeated >= enemy.bossThreshold then
       enemyBossLoad()
     end
     enemy.posY = enemy.resetPosition
     enemy.health = enemy.healthReset
     
   elseif enemy.health ==0 and enemy.isBoss == true then
     gameOver = true
     
    end
  end

function enemyBossLoad()
enemy.img = love.graphics.newImage("sprites/boss.png")
enemy.isBoss = true
enemy.resetPosition = -120
enemy.fireDelay = 30
enemy.shotSpeed = 4
enemy.healthReset = 20
enemy.width = 120
enemy.posX = 120
end