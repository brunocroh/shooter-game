local Bullet = require 'bullet'

local asset = love.graphics.newImage('assets/panda.png')
local isDown = love.keyboard.isDown
local player = {}

function player:load()
  player.img = asset
  player.x = love.graphics.getWidth() / 2 - asset:getWidth() /2
  player.y = 10
  player.width = 110
  player.height = 90
  player.speed = 300
end

function player:update(dt)
  if isDown('a') then
    player.x = player.x + (player.speed * -1) * dt
  end

  if isDown('d') then
    player.x = player.x + player.speed * dt
  end

  if player.x + player.width > love.graphics.getWidth() then
    player.x = love.graphics.getWidth() - player.width
  end

  if player.x  < 0 then
    player.x = 0
  end
end

function player:draw()
  love.graphics.draw(player.img, player.x, player.y)
end

function player:keyPressed(key, bullets)
  if key == 'space' then
    table.insert(bullets, Bullet:new(self.x + self.height / 2, self.y + self.height))
  end
end

return player
