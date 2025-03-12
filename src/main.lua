function love.load()
    sti = require 'lib/sti'
    camera = require 'lib/camera'
    love.graphics.setDefaultFilter("nearest", "nearest")

    gameMap = sti('maps/world.lua')

    cam = camera()

    time = 1

    player = {}
    player.x = 400
    player.y = 300
    player.speed = 4
end

function love.update()
    time = time + 1

    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end

    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end

    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w/2 then
        cam.x = w/2
    end

    if cam.y < h/2 then
        cam.y = h/2
    end

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end

    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end
end

function love.draw()
    love.graphics.print(time, 0, 0)

    cam:attach()
        gameMap:drawLayer(gameMap.layers["tree"])
        gameMap:drawLayer(gameMap.layers["building"])
        gameMap:drawLayer(gameMap.layers["ground"])
        gameMap:drawLayer(gameMap.layers["brick"])
        love.graphics.circle("fill", player.x, player.y, 12)
    cam:detach()
end

