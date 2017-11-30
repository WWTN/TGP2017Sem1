local _power = {}

function _power:new(x, y, width, height, spd)
  power = {}
  setmetatable(power, self)
  self.__index = self
  power:_create(x, y, width, height, love.graphics.newImage(), spd)
  return power
  --power.img = love.graphics.newImage()
  --power.x = 720/4
  --power.y = 0
 -- power.width = 0
 -- power.height = 0
 -- power.appearTimer = 0
 -- power.appear = false
 -- power.isOn = false  
end

function _power:_create(x, y, width. height. sprite, spd)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.sprite = sprite
  self.fallSpd = spd
end

function _power:draw()
  love.graphics.draw(self.sprite, self.x, self.y)
  self.y = self.y + self.fallSpd
end

function _power:getX()
  return self.x
end

function _power:getY()
  return self.y
end

function CheckCollision(x1, y2, w1, h1, x2, y2, w2, h2)

  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

return _power