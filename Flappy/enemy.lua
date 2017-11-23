local _enemy = {}


function _enemy:new(x,y, kind)
  enemy = {}
  setmetatable(laser, self)
  self.__index = self
  enemy:_create(x,y, kind)
  return enemy
end

function _enemy:_create(x, y, kind)
 
  self.posX = x
  self.posY = y
  self.type = kind
  
  if (self.type = 1) then
      self.img = love.graphics.newImage("sprites/enemy.png")
      self.width = 60
      self.health = 3
      self.isBoss = false
      self.speed = 3
      self.fireDelay = 90

      self.shotSpeed = 2
   
  
  
  
  else
      self.img = love.graphics.newImage("sprites/boss.png")
 
      self.isBoss = true
      self.fireDelay = 30
      self.shotSpeed = 4
      self.health = 20
      self.width = 120
  end
  self.fireTimer = self.fireDelay
  self.firing = false
  self.goingRight = false
  self.shootPos = self.posX
end




function _enemy:draw()
  love.graphics.draw(self.img, self.posX, self.posY)
end

function _enemy:update()
  
enemyMove()
enemyShoot()


end

function enemyMove()
  
  if (self.type = 1 then)
    if self.posY < 50 then
      enemy.posY = enemy.posY + 5
 
      elseif (enemy.goingRight == true) then
        enemy.posX = enemy.posX+1
        
      elseif enemy.goingRight == false then
       enemy.posX = enemy.posX - 1
       
    end
    
    if enemy.posX < 30 then 
      enemy.goingRight = true 
      elseif enemy.posX > 200 then 
      enemy.goingRight = false end
    else
  
    end
      
   
    
   end
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

end