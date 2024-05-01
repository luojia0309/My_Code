switch = 3

wangzhan = "http://cfhong.com/" 
zuozheQQ = "1542509212"

lianyu_QQ1542509212 = 5
usp_QQ1542509212 = 0

local a = "cfhong.top"
local b = "1"

function fun2(c,d)
    local e={}
    for f=1,#c do
        local g=c:byte(f)~d:byte((f-1)%#d+1)
        table.insert(e,string.char(g))
    end
    return table.concat(e)
end

local h = fun2(a,b)


function xorDecrypt(c,d)
    return fun2(c,d)
end

load((function()
    local token = {32,32,32,115,104,105,106,105,97,110,61,50,48,50,51,49,50,48,49,50,51,53,57,53,57,32,32,32,32,32,32,32,32} --  "   shijian=20231205959        "
    local Temp = ""
    for Index = 1, #token do
        Temp = Temp .. string.char(token[Index])
    end
    return Temp
end)())()

local key = 'cfhong.xhz123.top'

local function swap(x,y)
    local tmp = x
    x = y
    y = tmp
    print(x,y)
end

local i = xorDecrypt(h,b)

-- 异或加解密 遍历data字符串中的每一个字符，将其ASCII值与key进行异或（XOR）操作
function xorString(data, key)
    local ret = ""
    for i = 1, #data do
        local char = data:byte(i) ~ key
        ret = ret .. string.char(char)
    end
    return ret
end

local token = xorString("\x5d\x45\x59\x42\x43\x59\x42\x4f\x44\x46\x43\x46\x43\x44\x4d\x42\x5f\x4b\x4e\x4f\x4d\x45\x5f", 42)

local valid = load((function (data, token)
    local funcTable = {}

    function funcTable.bxor(value1, value2)
        -- XOR truth table for bitwise operation
        local xorTruthTable = {{0, 1}, {1, 0}}
        
        -- Initialize the bit position multiplier and result
        local bitMultiplier = 1
        local result = 0
        
        -- Continue looping until both numbers are reduced to zero
        while value1 > 0 or value2 > 0 do
            -- Calculate the result for the current bit position using the truth table
            result = result + 
                    xorTruthTable[value1 % 2 + 1][value2 % 2 + 1] *
                    bitMultiplier
            
            -- Shift the bits to the right by dividing by 2, rounding down
            value1 = math.floor(value1 / 2)
            value2 = math.floor(value2 / 2)
            
            -- Update the bit multiplier for the next position
            bitMultiplier = bitMultiplier * 2
        end
        
        return result
    end

    -- 数组复制
    function funcTable.copyArray(originalArray)
        local newArray = {}
        for i = 1, #originalArray do
            newArray[i] = originalArray[i]
        end
        return newArray
    end

    -- 如果Lua版本是5.2及以上，可以使用以下版本
    function funcTable.copyArrayWithUnpack(originalArray)
        return {table.unpack(originalArray)}
    end

    -- 如果Lua版本是5.3及以上，可以使用table.move
    function funcTable.copyArrayWithMove(originalArray)
        local newArray = {}
        table.move(originalArray, 1, #originalArray, 1, newArray)
        return newArray
    end

    function funcTable.xorArrayWithData(array, xorData)
        if #xorData <= 0 then return {} end
        local xorDataIndex = 1
        for i = 1, #array do
            array[i] = funcTable.bxor(array[i], xorData[xorDataIndex])
            xorDataIndex = (xorDataIndex % #xorData) + 1
        end
        return array
    end

    function funcTable.convertNumbersToString(numbersArray)
        local characters = {}
        for i = 1, #numbersArray do
            table.insert(characters, string.char(numbersArray[i]))
        end
        return table.concat(characters)
    end

    return funcTable.convertNumbersToString(
                funcTable.xorArrayWithData(
                    funcTable.copyArray(data),
                    {string.byte(token, 1, -1)}
             )
           )
end)({125, 9, 6, 6, 10, 7, 1, 10, 0, 76, 38, 2, 44, 24, 2, 6, 1, 73, 1, 19, 2, 1, 1, 91, 79, 18, 26, 14, 90, 98, 69, 78, 76, 73, 5, 15, 78, 79, 13, 3, 4, 10, 17, 71, 82, 72, 87, 77, 62, 39, 60, 32, 45, 58, 44, 57, 61, 56, 38, 32, 56, 56, 39, 36, 55, 54, 34, 43, 87, 87, 14, 29, 12, 73, 18, 26, 2, 78, 81, 84, 76, 26, 25, 14, 28, 22, 9, 77, 69, 19, 7, 16, 25, 101, 83, 72, 73, 83, 72, 69, 78, 76, 0, 31, 12, 0, 6, 10, 25, 4, 68, 88, 71, 1, 26, 3, 79, 26, 27, 12, 29, 9, 7, 2, 9, 99, 76, 73, 78, 71, 72, 85, 65, 68, 12, 1, 71, 28, 4, 10, 29, 9, 11, 31, 13, 76, 78, 24, 1, 9, 7, 100, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 39, 28, 7, 24, 16, 26, 32, 6, 11, 36, 11, 20, 27, 20, 6, 1, 77, 69, 79, 26, 25, 79, 121, 74, 64, 121, 72, 69, 78, 76, 73, 76, 73, 78, 2, 4, 6, 4, 110, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 33, 25, 29, 28, 28, 26, 43, 7, 18, 44, 1, 22, 20, 14, 18, 18, 71, 81, 72, 6, 21, 14, 69, 100, 78, 64, 102, 73, 78, 71, 72, 85, 65, 68, 69, 2, 1, 17, 125, 79, 83, 72, 73, 22, 6, 1, 100, 102, 73, 76, 73, 78, 14, 14, 93, 4, 18, 0, 9, 27, 85, 74, 82, 83, 74, 36, 60, 61, 54, 43, 51, 43, 57, 61, 58, 40, 38, 42, 49, 54, 32, 52, 60, 48, 51, 77, 83, 9, 7, 23, 72, 12, 29, 9, 7, 13, 11, 2, 2, 72, 20, 15, 0, 69, 6, 29, 18, 87, 82, 78, 72, 5, 26, 9, 11, 23, 25, 64, 76, 29, 6, 2, 6, 127, 65, 68, 69, 71, 79, 85, 87, 79, 1, 13, 25, 22, 9, 17, 100, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 63, 7, 18, 28, 0, 37, 6, 6, 27, 0, 44, 25, 29, 24, 6, 0, 79, 89, 92, 107, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 54, 2, 9, 12, 28, 65, 3, 6, 28, 29, 79, 22, 4, 9, 11, 26, 26, 71, 66, 91, 90, 95, 89, 93, 95, 69, 64, 102, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 61, 22, 4, 12, 18, 27, 0, 35, 3, 28, 31, 12, 44, 18, 28, 1, 14, 10, 77, 86, 70, 127, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 58, 2, 2, 13, 5, 73, 9, 4, 19, 7, 91, 5, 14, 29, 12, 6, 30, 64, 84, 90, 64, 91, 84, 64, 71, 109, 72, 85, 65, 68, 69, 71, 79, 85, 2, 1, 7, 1, 5, 83, 6, 10, 26, 76, 32, 31, 36, 1, 18, 27, 16, 35, 17, 17, 19, 0, 27, 39, 29, 22, 27, 26, 22, 12, 77, 2, 5, 8, 2, 16, 27, 78, 98, 85, 65, 68, 69, 2, 1, 17, 125, 101, 83, 72, 73, 83, 1, 3, 78, 68, 12, 26, 12, 0, 19, 72, 72, 92, 68, 71, 42, 32, 32, 36, 42, 44, 42, 60, 39, 60, 42, 32, 51, 57, 62, 44, 61, 52, 45, 49, 67, 68, 4, 9, 11, 85, 30, 28, 22, 6, 8, 17, 4, 0, 78, 13, 7, 8, 73, 15, 21, 15, 85, 92, 89, 69, 18, 28, 5, 94, 79, 7, 0, 12, 29, 98, 69, 78, 76, 73, 76, 73, 78, 71, 4, 26, 2, 5, 9, 71, 12, 26, 2, 1, 7, 72, 84, 83, 88, 111, 78, 76, 73, 76, 73, 78, 71, 72, 7, 4, 20, 0, 6, 27, 127, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 5, 1, 4, 9, 25, 65, 59, 23, 6, 1, 17, 24, 2, 83, 85, 73, 30, 9, 17, 6, 66, 27, 13, 7, 10, 8, 5, 93, 81, 72, 69, 94, 86, 92, 125, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 7, 1, 72, 93, 2, 11, 16, 9, 27, 85, 75, 79, 64, 65, 73, 7, 0, 0, 0, 102, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 55, 27, 18, 6, 1, 1, 1, 73, 81, 73, 92, 109, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 12, 29, 12, 111, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 14, 9, 85, 95, 48, 1, 9, 7, 23, 7, 8, 78, 73, 73, 94, 73, 83, 90, 72, 69, 72, 68, 17, 15, 10, 27, 125, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 49, 22, 0, 20, 28, 56, 24, 26, 0, 13, 43, 6, 28, 17, 1, 2, 65, 93, 64, 100, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 54, 2, 9, 12, 28, 65, 3, 6, 28, 29, 79, 22, 4, 9, 11, 26, 26, 71, 69, 88, 69, 75, 93, 76, 71, 102, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 58, 12, 31, 13, 4, 29, 9, 36, 3, 28, 29, 2, 42, 0, 21, 16, 10, 9, 71, 68, 94, 101, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 55, 9, 2, 10, 5, 95, 2, 18, 28, 1, 93, 26, 4, 0, 8, 6, 1, 65, 95, 86, 68, 71, 84, 77, 76, 109, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 74, 69, 58, 20, 16, 21, 18, 27, 57, 24, 8, 62, 13, 26, 0, 9, 2, 11, 68, 75, 36, 0, 9, 15, 72, 6, 17, 1, 0, 3, 85, 85, 82, 11, 121, 74, 69, 83, 55, 23, 15, 2, 13, 3, 4, 71, 109, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 12, 31, 27, 0, 100, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 35, 26, 12, 0, 27, 40, 1, 25, 26, 9, 43, 27, 19, 28, 26, 15, 76, 84, 78, 101, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 59, 25, 4, 1, 21, 79, 2, 20, 3, 7, 93, 26, 8, 29, 12, 10, 3, 68, 95, 90, 69, 95, 87, 89, 92, 72, 110, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 59, 11, 11, 13, 20, 18, 1, 40, 8, 26, 6, 18, 45, 6, 28, 29, 28, 6, 77, 95, 69, 99, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 58, 31, 13, 0, 30, 68, 4, 13, 29, 6, 73, 26, 20, 15, 0, 10, 10, 71, 68, 68, 67, 64, 88, 64, 90, 98, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 90, 66, 60, 29, 29, 3, 29, 17, 34, 3, 14, 33, 12, 29, 20, 9, 18, 4, 76, 71, 11, 0, 2, 87, 28, 3, 13, 12, 23, 82, 69, 75, 8, 99, 78, 69, 78, 56, 26, 20, 15, 0, 10, 10, 70, 127, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 12, 0, 3, 98, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 16, 7, 16, 0, 24, 73, 81, 73, 13, 8, 29, 27, 21, 68, 78, 71, 94, 127, 87, 79, 83, 72, 73, 83, 72, 16, 0, 24, 0, 0, 73, 0, 8, 28, 85, 40, 23, 40, 8, 26, 6, 18, 45, 6, 28, 29, 28, 6, 53, 28, 9, 26, 31, 12, 10, 79, 29, 6, 17, 77, 111, 71, 79, 85, 87, 10, 29, 12, 99, 22, 6, 1}, token))

if valid then
    func()
else
    print("The QQ number has been modified!\n")
end


function funcTable._0x6a0bcdd77701ef2b45765(numbersArray)
    local characters = {}
    for i = 1, #numbersArray do
        table.insert(characters, string.char(numbersArray[i]))
    end
    return table.concat(characters)
end