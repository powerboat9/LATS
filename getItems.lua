itemsRequired = {...}

if not turtle then
    printError("This isn't a turtle")
    return nil
end

--[[
The input is as follows:

input = {
    {
        name = "Stone", --The name of the item, for display purposes
        id = 1, --The item ID
        meta = 0, --The metadata of the item, nil if it doesn't mater
        count = 34 --The amount of the item required
    }
}


]]--

local bkColor = (multishell and colors.orange) or colors.black
local txtColor = (multishell and colors.white) or colors.white

term.setBackgroundColor(bkColor)
term.setTextColor(txtColor)

function wipe()
    term.clear()
    term.setCursorPos(1, 1)
end

wipe()

term.write("
