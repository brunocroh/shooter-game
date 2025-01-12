local Player = require 'player'
local Enemy = require 'enemy'

function love.load()
  Player:load()
  Enemy:load()
end


function love.update(dt)
  Player:update(dt)
  Enemy:update(dt)
end

function love.draw()
  Player:draw()
  Enemy:draw()
end


function love.keypressed(key)
  if key == 'r' then
    love.event.quit('restart')
    
  end
end

local function checkCollision(a, b)
  return a.x + a.width > b.x
    and a.x < b.x + b.width
    and a.y + a.height > b.y
    and a.y < b.y + b.height
end
