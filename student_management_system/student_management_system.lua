--[[
Author: WaterRun
File: student_management_system.lua
Date: 2025-03-03
Description: 学习程序3: 学生成绩管理系统
]]

--[[
--语法说明  
增:add [学号] [名字] [成绩]
删:delete [学号]
查(全部):listall
改(成绩):update -s [学号] [成绩]
改(名字):update -n [学号] [名字]
退:exit
--约束
学号: 从'000'到'999'  
成绩: 0-100
]]

local students = {} -- 存储学生数据  

local function legal_id(id)
    if type(id) == "string" and id:match("^%d%d%d$") then
        return true
    else
        return false
    end
end

-- 检查输入的成绩是否合法: 0.0-100.0
-- @param score: 待检查的成绩
-- @return boolean: 成绩是否合法
local function legal_score(score)
    if type(score) == "number" and score >= 0.0 and score <= 100.0 then
        return true
    else
        return false
    end
end

-- 为表添加学生数据  
-- @param id: 学生的学号,三位数字字符串
-- @param name: 学生的姓名
-- @param score: 学生的成绩
-- @return boolean: 写入成功与否
local function add(id, name, score) -- 增加数据
    -- 输入检查
    if not legal_id(id) then
        print("Invalid ID: " .. id)
        return false
    end
    if not legal_score(score) then
        print("Invalid score: " .. score)
        return false
    end

    -- 存在性检查
    for _, student in ipairs(students) do
        if student.id == id then
            print('ID already exists: ' .. id)
            return false
        end
    end

    -- 写入数据
    table.insert(students, {id = id, name = name, score = score})
    print('Added successfully: ' .. id)
    return true
end

-- 删除表中的指定学号的学生  
-- @param id: 待删除的学生学号
-- @return boolean: 删除成功与否
local function delete(id) -- 增加数据
    -- 输入检查
    if not legal_id(id) then
        print("Invalid ID: " .. id)
        return false
    end

    -- 移除
    for index, student in ipairs(students) do
        if student.id == id then
            table.remove(students, index)
            print('ID removed: ' .. id)
            return true
        end
    end

    print('ID does not exist: ' .. id)
    return false
end

-- 格式化显示表中的全部数据
-- @return boolean: 表是否非空
local function listall()
    -- 打印表头
    print(string.format("%-10s %-20s %-10s", "ID", "NAME", "SCORE"))
    print(string.rep("=", 40)) -- 打印一条分隔线

    -- 判断表是否为空
    if #students == 0 then
        print("--EMPTY--")
        print("COUNT: 0")
        return false
    end

    -- 按学号升序排序
    table.sort(students, function(a, b)
        return a.id < b.id
    end)

    -- 遍历学生表并格式化输出
    for _, student in ipairs(students) do
        print(string.format("%-10s %-20s %-10.2f", student.id, student.name, student.score))
    end

    -- 打印元素个数
    print("COUNT: " .. #students)
    return true
end

-- 更新指定学号学生的数据
-- @param id: 待更新的学生学号
-- @param name: 更新后的学生姓名.该项为nil不进行更改
-- @param score: 更新后的学生成绩.范围在0.0-100.0.设该项为nil不进行更改
-- @return boolean: 更新是否成功
local function update(id, name, score)
    -- 检查学号是否合法
    if not legal_id(id) then
        print("Invalid ID: " .. tostring(id))
        return false
    end

    -- 检查成绩是否合法（如果提供了新的成绩）
    if score ~= nil and not legal_score(score) then
        print("Invalid score: " .. tostring(score))
        return false
    end

    -- 查找指定学号的学生
    for _, student in ipairs(students) do
        if student.id == id then
            -- 更新姓名（如果提供了新的姓名）
            if name ~= nil then
                student.name = name
            end

            -- 更新成绩（如果提供了新的成绩）
            if score ~= nil then
                student.score = score
            end

            print("Update successful: " .. id)
            return true
        end
    end

    -- 未找到指定学号的学生
    print("ID does not exist: " .. id)
    return false
end

-- 解析输入的指令并执行
-- @param command: 待执行的指令
-- @return boolean: 指令是否非结束程序(exit)
local function parser(command)
    -- 去除首尾空格并统一转换为小写
    command = command:match("^%s*(.-)%s*$")

    -- 退出程序指令
    if command == "exit" then
        print("Program exited")
        return false
    end

    -- 添加学生: add [学号] [名字] [成绩]
    local add_id, add_name, add_score = command:match("^add%s+(%S+)%s+(%S+)%s+(%S+)$")
    if command:match("^add") then
        if not add_id or not add_name or not add_score then
            print("Error: add requires 3 parameters: add [ID] [Name] [Score]")
        else
            add(add_id, add_name, tonumber(add_score))
        end
        return true
    end

    -- 删除学生: delete [学号]
    local delete_id = command:match("^delete%s+(%S+)$")
    if command:match("^delete") then
        if not delete_id then
            print("Error: delete requires 1 parameter: delete [ID]")
        else
            delete(delete_id)
        end
        return true
    end

    -- 查询全部学生: listall
    if command == "listall" then
        listall()
        return true
    end

    -- 更新成绩: update -s [学号] [成绩]
    local update_id, update_score = command:match("^update%s+-s%s+(%S+)%s+(%S+)$")
    if command:match("^update%s+-s") then
        if not update_id or not update_score then
            print("Error: update -s requires 2 parameters: update -s [ID] [Score]")
        else
            update(update_id, nil, tonumber(update_score))
        end
        return true
    end

    -- 更新名字: update -n [学号] [名字]
    local update_id_name, update_name = command:match("^update%s+-n%s+(%S+)%s+(%S+)$")
    if command:match("^update%s+-n") then
        if not update_id_name or not update_name then
            print("Error: update -n requires 2 parameters: update -n [ID] [Name]")
        else
            update(update_id_name, update_name, nil)
        end
        return true
    end

    -- 未知指令
    print("Invalid command: " .. command)
    return true
end

-- 主程序循环  
print("Basic Student Management System\n----------------")
while true do
    io.write(">>> ")
    if not parser(io.read()) then -- parser()返回false: 'exit'指令
        break
    end
end