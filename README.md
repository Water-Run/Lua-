# Lua项目学习  

一些由GPT生成的Lua编程任务,编写以逐步入门Lua.  

---

`已完成`  
### **1. 计算器 (Calculator)**

#### 项目描述
创建一个简单的命令行计算器，支持基本的数学运算：加法、减法、乘法和除法。

#### 功能需求
1. 用户可以选择运算类型（加、减、乘、除）。
2. 用户输入两个数字，程序输出计算结果。
3. 如果输入无效（如除以零或非数字输入），程序应提示错误信息。
4. 用户可以多次执行操作，直到选择退出。

#### 技术需求
- 条件分支 (`if`/`else` 判断)。
- 数值输入与转换 (`io.read` 和 `tonumber`)。
- 循环结构 (`while` 循环)。
- 错误处理（如检查除数是否为零）。

---

`已完成`  
### **2. 简易猜数字游戏 (Number Guessing Game)**

#### 项目描述
创建一个猜数字游戏，程序随机生成一个1到100的数字，用户根据提示猜测，直到正确为止。

#### 功能需求
1. 程序随机生成一个1到100的数字。
2. 用户输入猜测值：
   - 如果猜测正确，提示“恭喜，猜对了！”并退出游戏。
   - 如果猜得过高，提示“太大了！”。
   - 如果猜得过低，提示“太小了！”。
3. 游戏记录用户的猜测次数，结束时显示总猜测次数。
4. 用户可以选择重新开始游戏或退出。

#### 技术需求
- 随机数生成 (`math.random`)。
- 条件判断和循环。
- 用户输入与输出。
- 模块化代码（将提示、检查等逻辑封装为函数）。

---

`已完成`  
### **3. 学生成绩管理系统 (Student Grades Manager)**

#### 项目描述
实现一个简单的学生成绩管理系统，支持添加学生、删除学生、更新成绩和查看成绩。

#### 功能需求
1. 主菜单：
   - 添加学生及其成绩。
   - 删除学生。
   - 更新学生成绩。
   - 查看所有学生及其成绩。
   - 退出程序。
2. 数据存储在 Lua 的表（`table`）中。
3. 用户输入必须校验有效性（如姓名不能为空、成绩必须是数字）。

#### 技术需求
- Lua 表的使用（增删改查操作）。
- 数据校验。
- 循环菜单实现。
- 基础模块化设计（将管理操作拆分为多个函数）。

---

`未开工`  
### **4. 文本文件统计工具 (Text File Analyzer)**

#### 项目描述
编写一个程序读取本地文本文件，并统计以下内容：
- 总字符数。
- 总单词数。
- 总行数。

#### 功能需求
1. 用户输入文件路径，程序读取文件内容。
2. 程序输出文件的统计信息：
   - 总字符数（包括空格）。
   - 总单词数（以空格分隔单词）。
   - 总行数。
3. 如果文件不存在或路径不正确，提示错误。
4. 支持用户多次分析不同文件。

#### 技术需求
- 文件操作（`io.open`、`file:read`）。
- 字符串处理（`string` 模块）。
- 错误处理（检查文件路径有效性）。
- 循环结构和用户输入。

---

`未开工`  
### **5. 简易任务管理器 (To-Do List Manager)**

#### 项目描述
实现一个简单的任务管理器，用户可以添加任务、查看任务列表、标记任务完成和删除任务。

#### 功能需求
1. 主菜单：
   - 添加任务（输入任务描述）。
   - 查看任务列表（显示任务及其状态：未完成或已完成）。
   - 标记任务为完成。
   - 删除任务。
   - 退出程序。
2. 所有任务存储在 Lua 表中，使用键值对表示任务状态（完成/未完成）。
3. 输入校验：任务描述不能为空。

#### 技术需求
- 表的高级操作（动态增删元素）。
- 条件判断与循环。
- 输入校验与错误处理。
- 基础用户界面（命令行交互）。

---

`未开工`  
### **6. 简单贪吃蛇游戏 (Simple Snake Game)**

#### 项目描述
制作一个基于命令行的简单贪吃蛇游戏，适合学习 Lua 的逻辑控制和动态表操作。

#### 功能需求
1. 游戏在固定大小的网格中运行（例如：10x10）。
2. 初始时，蛇的长度为1，玩家通过按键（W/A/S/D）控制蛇的移动方向。
3. 每次蛇吃到食物，长度增加1，食物随机出现在网格上。
4. 如果蛇撞墙或撞到自己，游戏结束。
5. 实时显示网格状态（蛇、空地和食物）。

#### 技术需求
- 表的动态操作（表示蛇的身体）。
- 循环与条件判断。
- 随机数生成（生成食物位置）。
- 基础事件处理（模拟按键输入）。
