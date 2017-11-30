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
  
  self.goingRight = false -- put here so enemy types can pseudo-override this
  
  
  if (self.type == 1) then
      self.img = love.graphics.newImage("sprites/enemy.png")
      self.width = 60
      self.health = 3
      self.isBoss = false
      self.speed = 3
      self.fireDelay = 90

      self.shotSpeed = 2
   
  
  
  
  else
      self.img = love.graphics.newImage("sprites/boss.png")
    self.width = 120
       self.health = 20
      self.isBoss = true
      self.fireDelay = 30
      self.speed = 0
      self.shotSpeed = 4

      
  end
  self.fireTimer = self.fireDelay
  self.firing = false
  self.alive = true
  self.shootPos = self.posX
end




function _enemy:draw()
  love.graphics.draw(self.img, self.posX, self.posY)
end

function _enemy:update()
  if self.alive == true then
    
    enemyMove()
    enemyShoot()
  end


end

function enemyMove()
  
  if (self.type == 1) then
    if self.posY < 50 then
      self.posY = self.posY + 5
 
      elseif (self.goingRight == true) then
        self.posX = self.posX+1
        
      elseif self.goingRight == false then
       self.posX = self.posX - 1
       
    end
    
    if self.posX < 30 then 
      self.goingRight = true 
      elseif self.posX > 200 then 
      self.goingRight = false end
    else
  
    end
      
   
    
   end
  
  function enemyShoot()
    self.fireTimer = self.fireTimer - 1
    if self.fireTimer <= 0 then
      
        if self.type == 1 then
          self.shootPos = self.posX + (self.width/2)
         
        else
         
        
          self.shootPos = self.posX + math.random(0,self.width)
      
        end
     
      
      self.firing = true
      self.fireTimer = self.fireDelay
      
    else
      self.firing = false
    end
    
    end
  
function _enemy:hurt()
   self.health = self.health - 1
   
    if self.health <= 0  then
     
     self.alive = false
    
  end
  
  end

