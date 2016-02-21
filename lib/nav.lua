local pos = vector.new()
local rot = 0

function getRotVector()
    return ({
        vector.new(1, 0, 0),
        vector.new(0, 0, 1),
        vector.new(-1, 0, 0),
        vector.new(0, 0, -1)
    })[rot + 1]
end

local wood = {}
local leafs = {}

function right()
    turtle.turnRight()
    rot = (rot + 1) % 4
end

function left()
    turtle.turnLeft()
    rot = (rot - 1) % 4
end

function up()
    if turtle.up() then
        pos = pos + vector.new(0, 1, 0)
        return true
    end
    return false
end

function down()
    if turtle.down() then
        pos = pos + vector.new(0, -1, 0)
        return true
    end
    return false
end

function forward()
    if turtle.forward() then
        pos = pos + getRotVector()
        return true
    end
    return false
end

function back()
    if turtle.back() then
        pow = pos - getRotVector()
        return true
    end
    return false
end
