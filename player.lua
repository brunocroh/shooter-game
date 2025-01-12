
local asset = love.graphics.newImage('assets/panda.png')

local isDown = love.keyboard.isDown

local player = {}


function player:load()
  player = {
    img = asset,
    x = love.graphics.getWidth() / 2 - asset:getWidth() /2,
    y = 10,
    width = 110,
    height = 90,
    speed = 300,
  }
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

return player
