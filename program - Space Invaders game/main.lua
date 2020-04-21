
function love.update()
  --updates the game's frame-by-frame state
end

function love.draw()
  --draws the game state to the screen
  love.graphics.ellipse("fill", love.mouse.getX(), 500, 50, 50)
  end