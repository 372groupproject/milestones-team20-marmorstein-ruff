-- create objects with tables
-- timer for enemy spawning
enemyTimerMax = 0.4
enemyTimer = enemyTimerMax

-- enemyimg

enemies = {}


function love.load()
  bg = love.graphics.newImage("space bg.png")
end

function love.update(dt)
  --updates the game's frame-by-frame state
  --quit game
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end
  
  --create enemies
  enemyTimer = enemyTimer - (1 * dt)
  if enemyTimer < 0 then 
    enemyTimer = enemyTimerMax
    
    newEnemy = {x = (math.random(10, love.graphics.getWidth() - 10)), y = -10} --img = enemyimg
    table.insert(enemies, newEnemy)
  end
  
  --update enemy positions
  for i, enemy in ipairs(enemies) do
    enemy.y = enemy.y + (200 *dt)
    
    --remove enemies once they go off screen
    if enemy.y > love.graphics.getHeight() then
      table.remove(enemies, i)
    end 
  
  end
end

function love.draw(dt)
  --draws the game state to the screen
  --background
  love.graphics.draw(bg, 0, 0, 0, 2, 2)
  --player
  love.graphics.ellipse("fill", love.mouse.getX(), 500, 50, 50)
end

function love.mousepressed(x,y,button)
  if button == 1 then
    love.graphics.ellipse("fill",x,y,5,5)
  end
end
