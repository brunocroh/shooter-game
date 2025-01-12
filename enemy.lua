local asset = love.graphics.newImage('assets/snake.png')

local enemy = {}

function enemy:load()
  enemy.img = asset
  enemy.x = love.graphics.getWidth() / 2 - asset:getWidth() /2
  enemy.y = love.graphics.getHeight() - asset:getHeight() - 10
  enemy.width = asset:getWidth()
  enemy.height = asset:getHeight()
  enemy.speed = 300
end

  function enemy:update(dt)
    enemy.x = enemy.x + enemy.speed * dt

    if enemy.x + enemy.width >= love.graphics.getWidth() or enemy.x <= 0 then
      enemy.speed = enemy.speed * -1
    end
  end

  function enemy:draw()
    love.graphics.draw(enemy.img, enemy.x, enemy.y)
  end

  return enemy
