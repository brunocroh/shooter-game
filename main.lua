local Player = require 'player'
local Enemy = require 'enemy'
local Bullet = require 'bullet'
local bullets = {}

function love.load()
  Player:load()
  Enemy:load()
end


function love.update(dt)
  Player:update(dt)
  Enemy:update(dt)

  for i = 1, #bullets do
    bullets[i]:update(dt)
    local hit = bullets[i]:checkCollision(Enemy)
    if hit then
      if Enemy.speed > 0 then
        Enemy.speed = Enemy.speed + 50
      else
        Enemy.speed = Enemy.speed - 50
      end
      print('Enemy speed:' .. Enemy.speed)
    end
  end
end

function love.draw()
  Player:draw()
  Enemy:draw()

  for i = 1, #bullets do
    bullets[i]:draw()
  end
end


function love.keypressed(key)
  if key == 'r' then
    love.event.quit('restart')
  end

  Player:keyPressed(key, bullets)
end
