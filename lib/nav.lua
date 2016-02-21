local pos = vector.new()
local rot = 0

local shortenText(txt, length)
    local shortened = #txt > 8
    return (txt:sub(1, (shortened and 8) or -1) .. ((shortened and "...") or "")):replace(" ", "_")
end

local getRotVector = function()
    return ({
        vector.new(1, 0, 0),
        vector.new(0, 0, 1),
        vector.new(-1, 0, 0),
        vector.new(0, 0, -1)
    })[rot + 1]
end

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

local maps = {}

function newMaps(...)
    for k, name in args do
        if maps[name] then
            printError("[WARN] Overriding Map " .. shortenText(name, 8))
        end
        maps[name] = {
            ["dict"] = {},
            ["points"] = {},
            ["nextIndex"] = 1
        }
    end
end

function removeMaps(...)
    for k, name in args do
        maps[name] = nil
    end
end

function insertPoint(mapName, pointName, pointX, pointY, pointZ)
    local pointPos = vector.new(pointX, pointY, pointZ)
    
    local index = maps[mapName].nextIndex
    
    if maps[mapName].dict[pointName] then
        printError("[WARN] Overriding Point " .. shortenText(pointName, 8) .. " on map " .. shortenText(name, 8))
        index = maps[name].dict[pointName]
    else
        while 
        maps[mapName].nextIndex = index + 1
    end
    maps[mapName].points[index] = {
        ["name"] = pointName,
        ["pos"] = pointPos
    }
    maps[mapName].dict[pointName] = index
end

function removePoint(mapName, pointName)
    maps[mapName].points[(maps[mapName].dict[pointName])] = nil
    maps[mapName].dict[pointName] = nil
    
