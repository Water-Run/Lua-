--[[
Author: WaterRun
File: guess_number.lua
Date: 2025-02-27
Description: 学习程序2: 猜数字
]]

-- 判断输入是否正确,并给出对应提示
-- @param user_input  用户输入的数字
-- @param correct_number 正确的数字
-- @raise 如果输入的值不在0-100之间
-- @return 正确与否
local function check(user_input, correct_number)
    
    if user_input > 100 or user_input < 1 then
        error('Exceed input limit of 0-100')
    end

    if user_input > correct_number then
        print('Bigger')
    elseif user_input < correct_number then
        print('Smaller')
    else
        print('Correct')
        return true
    end

    return false
end

-- 主循环
print("GUESS NUMBER LUA\n 'quit' to quit, 'restart' to restart")
KEEP_PLAYING = true
while KEEP_PLAYING do

    math.randomseed(os.time())
    local target = math.random(1, 100)
    print('Target number generated')
    
    -- 单词猜测循环
    while true do
        io.write('>>>')
        local input = io.read()
        if input == 'exit' then
            KEEP_PLAYING = false
            break
        elseif input == 'restart' then
            break
        end

        if string.match(input, "^%-?%d+$") == nil then
            error('Input not int')
        end

        if check(tonumber(input), target) then
            print('-------')
            break
        end
    end

end