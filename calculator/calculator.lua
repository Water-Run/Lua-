--[[
Author: WaterRun
File: calculator.lua
Date: 2025-02-27
Description: 学习程序1: 四则计算器
]]

-- 执行加法
-- @param num_f 被加数
-- @param num_r 加数
local function add(num_f, num_r) --加法
    return num_f + num_r        
end

-- 执行减法
-- @param num_f 被减数
-- @param num_r 减数
local function minus(num_f, num_r) --减法
    return num_f - num_r
end

-- 执行乘法
-- @param num_f 被乘数
-- @param num_r 乘数
local function multiply(num_f, num_r) --乘法
    return num_f * num_r
end

-- 执行除法
-- @param num_f 被除数
-- @param num_r 除数
-- @raise 除数为0
local function divide(num_f, num_r) --除法
    if num_r == 0 then
        error('divide by zero')
    end
    return num_f / num_r
end

local operations = {
    ["+"] = add,
    ["-"] = minus,
    ["*"] = multiply,
    ["/"] = divide,
}

-- 主循环
while true do

    local operators = {
        ["+"] = true,
        ["-"] = true,
        ["*"] = true,
        ["/"] = true,
    }
    io.write("operator>>>")
    local operator = io.read()
    if not operators[operator] then
        error('invalid operator')    
    end

    io.write("numbers(spilt by space)>>>")
    local numbers = io.read()
    local num_f, num_r = numbers:match("^(%S+)%s+(%S+)$")

    if not num_f or not num_r then
        error('can not parse numbers')
    end

    num_f = tonumber(num_f)
    num_r = tonumber(num_r)
    if num_f == nil or num_r == nil then
        error('invalid type')
    end

    print("result:" .. operations[operator](num_f, num_r))
end
