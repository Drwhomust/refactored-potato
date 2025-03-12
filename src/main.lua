function love.load()
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
end

function love.draw()
    love.graphics.print(time, 0, 0)
    love.graphics.circle("fill", player.x, player.y, 12)
end

