function love.load()
    time = 1
end

function love.update()
    time = time + 1
end

function love.draw()
    love.graphics.print(time, 0, 0)
end

