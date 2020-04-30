--collision detection function, returns true if objects are overlapping
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

-- create objects with tables
-- timer for enemy spawning
enemyTimerMax = 1
enemyTimer = enemyTimerMax 
enemyimg = nil
enemies = {}
playerAlive = true
player = nil
canShoot = true
canShootTimerMax = 0.3
canShootTimer = canShootTimerMax
bullets = {}
score = 0

function love.load()
  bulletImg = love.graphics.newImage('bullet.png')
  bg = love.graphics.newImage("space bg.png")
  enemyimg = love.graphics.newImage("enemy.png")
  player = love.graphics.newImage("spaceship.png")
  
  --load audio
  music = love.audio.newSource("Retro_music.mp3", "stream")
  music:setLooping(true)
  music:play()
  
  loseSound = love.audio.newSource("Lose.wav", "static")
  shootSound = love.audio.newSource("shoot.wav", "static")
  deathSound = love.audio.newSource("enemy_hit.wav", "static")
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
    
    newEnemy = {x = (math.random(10, love.graphics.getWidth() - 10)), y = -10, img = enemyimg}
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

  canShootTimer = canShootTimer - (1 * dt)
  if(canShootTimer < 0) then
    canShoot = true
  end
  
  if(love.mouse.isDown(1)) and canShoot and playerAlive then
    newBullet = {x= love.mouse.getX() + (player:getWidth()/4), y = 500,img = bulletImg}
    table.insert(bullets,newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
    shootSound:play()
  end

  --collision detection
  for i, enemy in ipairs(enemies) do
    --player death
    if(CheckCollision(enemy.x, enemy.y, enemyimg:getWidth(), enemyimg:getHeight(), 
        love.mouse.getX(), 500, player:getWidth(), player:getHeight()) and playerAlive) then
        table.remove(enemies,i)
        playerAlive = false
        music:stop()
        loseSound:play()
    end
  end
  
  for i, enemy in ipairs(enemies) do
    for j, bullet in ipairs(bullets) do
      if CheckCollision(enemy.x, enemy.y, enemyimg:getWidth(), enemyimg:getHeight(), bullet.x, bullet.y, bullet.img:getWidth(), bullet.img:getHeight()) then
        table.remove(bullets, j)
        table.remove(enemies, i)
        deathSound:play()
        score = score + 1
      end
    end
  end
  
  --handle restarting the game when R is pressed
  if not playerAlive and love.keyboard.isDown('r') then
    --remove all bulets and enemies
    enemies = {}
    --reset timer
    enemyTimer = enemyTimerMax
    
    playerAlive = true
    
    music:play()
  end
  
  --bullets
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (350 * dt)
    if bullet.y < 0 then
      table.remove(bullets,i)
    end
  end
  
end

function love.draw(dt)
  --draws the game state to the screen
  --background
  love.graphics.draw(bg, 0, 0, 0, 2, 2)
  --player
  if playerAlive then
    love.graphics.draw(player, love.mouse.getX(), 500)
  else 
    love.graphics.print("You died, press 'R' to restart\n\t\tYour score was: " .. tostring(score), love.graphics:getWidth()/2-75, love.graphics:getHeight()/2-10)
  end
  --enemies
  for i, enemy in ipairs(enemies) do
    love.graphics.draw(enemy.img, enemy.x, enemy.y)
  end
  --bullets
  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end
end