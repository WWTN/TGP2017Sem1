require "background"
require "player"
require "asteroid"
require "enemy"
require "powerups"

local Laser = require "laser"
local index = 0
local touchCount = 1;
lasers = {}

local EnemyLaser = require "enemylaser"
local index2 = 0
enemylasers = {}

local power = require "power"


function love.load()
  
  gamestate = "play"
  backgroundLoad()
  playerLoad()
  enemyLoad()
  powerUpLoad()  
  
  math.randomseed(os.time())
 
  winImg = love.graphics.newImage("sprites/win.png")
  loseImg = love.graphics.newImage("sprites/lose.png")
end

function love.draw()
 backgroundDraw()
  if gamestate == "play" then
    playerDraw()
    game_screen()
      for k, v in pairs(lasers) do
        v:draw()
      end
      
       for k, v in pairs(enemylasers) do
        v:draw()
      end
    enemyDraw()
  elseif gamestate == "win" then
  love.graphics.draw(winImg, 50, 100)
  elseif gamestate == "lose" then
  love.graphics.draw(loseImg, 50, 100)

end

powerUpDraw()
end

function love.update(dt)
  
  if gameOver == false and gameLoss == false then
    playerUpdate()
    enemyUpdate()
    powerUpUpdate()
      if (ship.isFiring == true) then
        table.insert(lasers,Laser:new(ship.posX+30,ship.posY,8,32))
        index = index + 1
      end
      
      if (enemy.firing == true) then
        table.insert(enemylasers,EnemyLaser:new(enemy.shootPos,enemy.posY,8,32, enemy.shotSpeed))
        index2 = index2 + 1
        end
  
    for k, v in pairs(lasers) do
      hitTest = CheckCollision(v.xPos, v.yPos, v.width, v.height, enemy.posX, enemy.posY, enemy.width, enemy.width)
   
    if hitTest == true then
      v.xPos = -1000
      enemyHurt()
      end
    end
    for k, v in pairs(enemylasers) do
      hitTest = CheckCollision(v.xPos, v.yPos, v.width, v.height,ship.posX, ship.posY, 60, 60)
        if hitTest == true then
          v.xPos = -1000
          takeDamage()
        end
    end
    
    hitTest = 
    
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
