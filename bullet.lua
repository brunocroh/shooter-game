local Bullet = {}
Bullet.__index = Bullet

local asset = love.graphics.newImage("assets/bullet.png")

function Bullet:new(x,y)
  local instance = setmetatable({}, Bullet)
  instance.image = asset
  instance.x = x
  instance.y = y
  instance.speed = 500
  instance.dead = false

  instance.width = asset:getWidth()
  instance.height = asset:getHeight()

  return instance
end

function Bullet:update(dt)
  self.y = self.y + self.speed * dt
end

function Bullet:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:checkCollision(b)
  local a = self
  return a.y + a.height > b.y
    and a.y < b.y + b.height
    and a.x + a.width > b.x
    and a.x < b.x + b.width
end

return Bullet
