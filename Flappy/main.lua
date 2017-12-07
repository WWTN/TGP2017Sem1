require "background"
require "player"
require "asteroid"
require "enemygen"


local Laser = require "laser"
local index = 0
local touchCount = 1;
lasers = {}

local EnemyLaser = require "enemylaser"
local index2 = 0
enemylasers = {}

local Enemies = require "enemy"
local enemyIndex = 0
enemies = {}

function love.load()
  
  gamestate = "play"
  backgroundLoad()
  playerLoad()
  gameOver = false
  math.randomseed(os.time())
  table.insert(enemies, Enemies:new(0, 0, 1))
  enemyIndex = enemyIndex+1
  --table.insert(enemylasers,EnemyLaser:new(enemy.shootPos,enemy.posY,8,32, enemy.shotSpeed))
     --       index2 = index2 + 1
 
  winImg = love.graphics.newImage("sprites/win.png")
  loseImg = love.graphics.newImage("sprites/lose.png")
  
  
end

function love.draw()
 backgroundDraw()
  if gamestate == "play" then
    playerDraw()
    
      for k, v in pairs(lasers) do
        v:draw()
      end
      
       for k, v in pairs(enemylasers) do
        v:draw()
      end
   
   
      for k,v in pairs(enemies) do
        v:draw()
        end
  elseif gamestate == "win" then
  love.graphics.draw(winImg, 50, 100)
  elseif gamestate == "lose" then
  love.graphics.draw(loseImg, 50, 100)
  end
end

function love.update(dt)
  
  if gameOver == false and gameLoss == false then
    playerUpdate()
    
    enemyGenerationCheck(dt)
    
    for k,v in pairs(enemies) do
      v:update()
    end
  
      if (ship.isFiring == true) then
        table.insert(lasers,Laser:new(ship.posX+30,ship.posY,8,32))
        index = index + 1
      end
      for k,v in pairs(enemies) do
          if (v.firing == true) then
            table.insert(enemylasers,EnemyLaser:new(v.shootPos,v.posY,8,32, v.shotSpeed))
            index2 = index2 + 1
          end
        end
      
   for k1, v1 in pairs(enemies) do
       for k, v in pairs(lasers) do
      hitTest = CheckCollision(v.xPos, v.yPos, v.width, v.height, v1.posX, v1.posY, v1.width, v1.width)
   
        if hitTest == true then
          v.xPos = -1000
          v1:hurt()
        end
      end
       
       
       
  end
    
    
    for k, v in pairs(enemylasers) do
      hitTest = CheckCollision(v.xPos, v.yPos, v.width, v.height,ship.posX, ship.posY, 60, 60)
        if hitTest == true then
          v.xPos = -1000
          takeDamage()
        end
    end
    
    
    
  elseif gameOver == true then
    gamestate = "win"
    
  elseif gameLoss == true then
    
    gamestate = "lose"
    
    hitTest = CheckCollision(love.mouse.getX(), love.mouse.getY(), 1, 1,50, 100, 120, 60)
    if hitTest == true then
      love.load()
      end
  end
end
  


function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
