local _laserE = {}

function _laserE:new(x,y,width,height,spd) 
  laserE = {}
  setmetatable(laserE, self)
  self.__index = self
  laserE:_create(x,y,width,height, love.graphics.newImage("sprites/shotEnemy.png"), spd)
  return laserE
end

function _laserE:_create(x,y,width,height, sprite, spd)
       self.xPos = x 
       self.yPos = y
       self.width = width
       self.height = height
       self.sprite = love.graphics.newImage("sprites/shotEnemy.png")
       self.shootSpeed = spd
end

function _laserE:draw()
   love.graphics.draw(self.sprite, self.xPos, self.yPos)
   self.yPos = self.yPos + self.shootSpeed
 end
 
 function _laserE:getX()
   return self.xPos
 end
 
 function _laserE:getY()
   return self.yPos
 end
 
 function CheckColision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return _laserE