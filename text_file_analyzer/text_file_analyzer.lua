--[[
Author: WaterRun
File: text_file_analyzer.lua
Date: 2025-03-04
Description: 学习程序4: 文本文件统计工具
]]

-- 统计数据初始化  
local result = {
    characters = 0,
    words = 0,
    lines = 0,
}

-- 读取数据
io.write('FILE PATH: ')
local path = io.read()
local file = io.open(path, "r") -- 只读
if not file then
    error('CAN NOT FIND ' .. path)
end

-- 遍历文件的每一行
for line in file:lines() do
    result.lines = result.lines + 1                          -- 行数 +1
    result.characters = result.characters + #line + 1        -- 字符数 + 当前行字符数（+1 是换行符）
    for _ in string.gmatch(line, "%S+") do                   -- 使用模式匹配统计单词
        result.words = result.words + 1
    end
end

-- 关闭并输出
file:close()
print('--RESULT--\nLINES: ' .. result.lines .. '\nLINESWORDS: ' .. result.words .. '\nCHARACTERS: ' .. result.characters)
