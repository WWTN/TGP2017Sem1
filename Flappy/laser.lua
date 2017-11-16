local _laser = {}

function _laser:new(x,y,width,height)
  laser = {}
  setmetatable(laser, self)
  self.__index = self
  laser:_create(x,y,width,height)
  return laser
end

function _laser:_create(x,y,width,height, sprite)
       self.xPos = x 
       self.yPos = y
       self.width = width
       self.height = height
       self.sprite = love.graphics.newImage("sprites/shotYou.png")
end

function _laser:draw()
   love.graphics.draw(self.sprite, self.xPos, self.yPos)
   self.yPos = self.yPos - 3
 end
 
 function _laser:getX()
   return self.xPos
 end
 
 function _laser:getY()
   return self.yPos
 end
 
 function CheckColision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return _laser