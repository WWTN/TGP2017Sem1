 local _enemy = {}


function _enemy:new(x,y, kind, diff)
  enemy = {}
  setmetatable(enemy, self)
  self.__index = self
  enemy:_create(x,y, kind, diff)
  return enemy
end

function _enemy:_create(x, y, kind, diff)
 
  self.posX = x
  self.posY = y
  self.type = kind
  
  self.goingRight = false -- put here so enemy types can pseudo-override this
  
  
  if (self.type == 1) then --basic enemy type
      self.img = love.graphics.newImage("sprites/enemy.png")
      self.width = 60
      self.health = diff
      self.isBoss = false
      self.speed = 3
      self.fireDelay = 90

      self.shotSpeed = 2
   
  
    elseif (self.type ==2) then --first secondary type
  
  self.img = love.graphics.newImage("sprites/miniboss.png")
      self.width = 60
      self.health = diff +5
      self.isBoss = false
      self.speed = 5
      self.fireDelay = 50

      self.shotSpeed = 1
    else --if no type or invalid type, then enemy defaults to spawning as boss
  
      self.img = love.graphics.newImage("sprites/boss.png")
    self.width = 120
       self.health = diff * 3
      self.isBoss = true
      self.fireDelay = 30
      self.speed = 0
      self.shotSpeed = 4

      
  end
  self.fireTimer = self.fireDelay --stuff that's universal regardless of what kind of enemy has spawned
  self.firing = false
  self.alive = true
  self.shootPos = self.posX
end




function _enemy:draw()
  if self.alive == true then
    love.graphics.draw(self.img, self.posX, self.posY)
  end
end

function _enemy:update() 
  if self.alive == true then
    
    self:move()
    self:shoot()
  end


end

function _enemy:move() --movement patterns differ depending on the type of enemy
  
  if self.type == 1 then
    
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
  
  function _enemy:shoot() --shooting patterns differ depending on enemy type
    self.fireTimer = self.fireTimer - 1
    if self.fireTimer <= 0 then
      
        if self.type == 1 then
          self.shootPos = self.posX + (self.width/2)
         
        else
         
        
          self.shootPos = self.posX + math.random(0,self.width)
      
        end
     
      
      self.firing = true --fires and then resets fire timer so that does not fire endlessley (unless the fire delay is set up so that it will fire endlessley)
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

function _enemy:die() --misleadingly named; checks if unit is alive
  
  
  return self.alive;
end
return _enemy