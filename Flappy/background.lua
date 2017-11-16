function backgroundLoad()
    background= love.graphics.newImage("sprites/bg.png")
    
    stars1 = {}
    stars1.img = love.graphics.newImage("sprites/stars1.png")
    stars1.pos1 = 0
    stars1.pos2 = -800
    
    stars2 = {}
    stars2.img = love.graphics.newImage("sprites/stars2.png")
    stars2.pos1 = 0
    stars2.pos2 = -400
    
  backgroundQuad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
end

function backgroundDraw()
 love.graphics.draw(background, backgroundQuad, 0, 0)
 
 love.graphics.draw(stars1.img, 0, stars1.pos1)
 love.graphics.draw(stars1.img, 0, stars1.pos2)
 
love.graphics.draw(stars2.img, 0, stars2.pos1)
love.graphics.draw(stars2.img, 0, stars2.pos2)
 
 stars1.pos1 = stars1.pos1 + 1
 stars1.pos2 = stars1.pos2 + 1
 
 if (stars1.pos1 >= 800) then stars1.pos1 = -800
 end
 
 if (stars1.pos2 >= 800) then stars1.pos2 = -800 
 end
 
 
 stars2.pos1 = stars2.pos1 + 0.5
 stars2.pos2 = stars2.pos2 + 0.5
 
 if (stars2.pos1 >= 800) then stars2.pos1 = -800
 end
 
 if (stars2.pos2 >= 800) then stars2.pos2 = -800 
   end
end