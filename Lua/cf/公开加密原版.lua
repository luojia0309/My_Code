switch = 3

lianyu = 5
usp = 0

isenable = true

-- 异或加解密 遍历data字符串中的每一个字符,将其ASCII值与key进行异或(XOR)操作
function xorString(data, key)
    local key_value = string.byte(key)
    local ret = ""
    for i = 1, #data do
        local char = data:byte(i) ~ key_value
        ret = ret .. string.char(char)
    end
    return ret
end


local token = xorString("\x5d\x45\x59\x42\x43\x59\x42\x4f\x44\x46\x43\x46\x43\x44\x4d\x42\x5f\x4b\x4e\x4f\x4d\x45\x5f", '*')

local func = load(
    (function (data, token)
        local funcTable = {}

        function funcTable.bxor(value1, value2)
            -- XOR truth table for bitwise operation
            local xorTruthTable = {{0, 1}, {1, 0}}

            -- Initialize the bit position multiplier and ret
            local bitMultiplier = 1
            local ret = 0

            -- Continue looping until both numbers are reduced to zero
            while value1 > 0 or value2 > 0 do
                -- Calculate the ret for the current bit position using the truth table
                ret = ret +
                        xorTruthTable[value1 % 2 + 1][value2 % 2 + 1] *
                        bitMultiplier

                -- Shift the bits to the right by dividing by 2, rounding down
                value1 = math.floor(value1 / 2)
                value2 = math.floor(value2 / 2)

                -- Update the bit multiplier for the next position
                bitMultiplier = bitMultiplier * 2
            end

            return ret
        end

        -- 数组复制
        function funcTable.copyArray(originalArray)
            local newArray = {}
            for i = 1, #originalArray do
                newArray[i] = originalArray[i]
            end
            return newArray
        end

        function funcTable.xorArrayWithData(originalArray, xorData)
            if #xorData <= 0 then return {} end
            local xorDataIndex = 1
            for i = 1, #originalArray do
                originalArray[i] = funcTable.bxor(originalArray[i], xorData[xorDataIndex])
                xorDataIndex = (xorDataIndex % #xorData) + 1
            end
            return originalArray
        end

        function funcTable.convertNumbersToString(originalArray)
            local characters = {}
            for i = 1, #originalArray do
                table.insert(characters, string.char(originalArray[i]))
            end
            return table.concat(characters)
        end

        return funcTable.convertNumbersToString(
            funcTable.xorArrayWithData(
                funcTable.copyArray(data),
                {string.byte(token, 1, -1)}
            )
        )
    end)({125, 6, 0, 13, 7, 18, 10, 9, 11, 76, 84, 76, 29, 28, 18, 13, 127, 7, 17, 11, 4, 27, 28, 24, 1, 83, 39, 7, 54, 30, 0, 0, 24, 65, 9, 31, 11, 9, 28, 89, 65, 5, 23, 0, 70, 127, 125, 79, 83, 72, 73, 26, 14, 69, 70, 9, 31, 9, 7, 26, 71, 85, 72, 65, 70, 40, 40, 58, 38, 50, 48, 49, 61, 61, 39, 39, 43, 49, 60, 59, 41, 58, 61, 34, 44, 87, 65, 5, 11, 3, 79, 20, 5, 8, 83, 85, 84, 83, 27, 18, 7, 24, 10, 4, 64, 78, 19, 0, 16, 15, 110, 69, 71, 79, 85, 87, 79, 83, 72, 0, 0, 13, 11, 15, 14, 5, 9, 73, 83, 71, 6, 26, 21, 68, 12, 20, 10, 27, 22, 13, 31, 13, 99, 83, 72, 69, 78, 76, 73, 76, 73, 7, 1, 64, 28, 18, 1, 11, 6, 13, 25, 18, 70, 83, 28, 1, 22, 6, 111, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 40, 26, 1, 7, 26, 7, 36, 6, 20, 37, 0, 29, 31, 8, 11, 12, 70, 69, 72, 26, 15, 68, 71, 78, 101, 85, 87, 79, 83, 72, 73, 83, 72, 0, 2, 31, 12, 102, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 32, 6, 28, 25, 6, 28, 41, 1, 11, 36, 9, 26, 29, 6, 15, 16, 73, 70, 69, 8, 9, 19, 87, 77, 90, 98, 73, 83, 72, 69, 78, 76, 73, 76, 12, 0, 3, 98, 85, 65, 68, 69, 2, 1, 17, 125, 101, 83, 72, 73, 83, 1, 3, 70, 9, 31, 9, 7, 26, 71, 85, 72, 65, 70, 40, 40, 58, 38, 50, 48, 49, 61, 61, 39, 39, 43, 49, 60, 59, 41, 58, 61, 34, 44, 87, 65, 5, 11, 3, 79, 28, 4, 10, 29, 9, 11, 31, 13, 69, 15, 2, 13, 76, 8, 28, 0, 72, 72, 92, 68, 9, 14, 14, 27, 14, 26, 90, 72, 29, 27, 13, 11, 100, 76, 73, 76, 73, 78, 71, 72, 85, 19, 1, 21, 2, 14, 1, 125, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 62, 21, 13, 6, 18, 41, 10, 18, 28, 16, 53, 26, 7, 28, 6, 29, 64, 84, 71, 102, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 38, 27, 10, 22, 24, 65, 30, 9, 17, 6, 66, 27, 13, 7, 10, 8, 5, 93, 80, 87, 92, 75, 94, 77, 70, 70, 90, 98, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 39, 4, 8, 0, 6, 28, 16, 58, 0, 6, 27, 12, 49, 29, 17, 26, 3, 7, 68, 88, 71, 109, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 58, 31, 13, 0, 30, 68, 4, 13, 29, 6, 73, 26, 20, 15, 0, 10, 10, 71, 68, 67, 67, 65, 95, 64, 90, 98, 69, 78, 76, 73, 76, 73, 78, 71, 29, 27, 21, 13, 9, 71, 1, 26, 3, 79, 58, 27, 36, 28, 29, 22, 11, 46, 28, 24, 29, 1, 9, 56, 7, 4, 23, 22, 2, 11, 93, 27, 6, 18, 6, 16, 6, 65, 111, 78, 76, 73, 76, 12, 0, 3, 98, 127, 65, 68, 69, 71, 6, 19, 87, 71, 22, 30, 12, 29, 28, 69, 83, 81, 73, 78, 36, 33, 50, 59, 48, 62, 38, 48, 51, 59, 58, 57, 48, 35, 58, 44, 32, 59, 32, 42, 78, 73, 13, 7, 10, 71, 1, 6, 4, 10, 4, 5, 3, 16, 87, 14, 29, 12, 73, 18, 26, 2, 78, 81, 84, 76, 28, 29, 23, 65, 85, 21, 12, 0, 9, 101, 85, 87, 79, 83, 72, 73, 83, 72, 9, 1, 15, 8, 0, 73, 13, 8, 29, 27, 21, 68, 88, 71, 95, 127, 87, 79, 83, 72, 73, 83, 72, 69, 28, 9, 25, 9, 8, 26, 109, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 5, 28, 11, 4, 2, 76, 54, 30, 8, 0, 3, 7, 24, 65, 89, 69, 10, 14, 1, 31, 65, 1, 9, 7, 23, 7, 8, 70, 92, 69, 76, 80, 87, 78, 98, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 26, 14, 69, 70, 15, 6, 25, 7, 26, 71, 84, 85, 82, 77, 69, 19, 7, 16, 25, 101, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 59, 23, 6, 1, 17, 24, 2, 83, 85, 73, 65, 98, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 0, 9, 11, 127, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 0, 8, 71, 64, 42, 19, 5, 11, 3, 0, 24, 87, 74, 83, 90, 73, 78, 85, 69, 94, 69, 73, 24, 1, 11, 9, 98, 85, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 60, 27, 9, 26, 29, 42, 7, 0, 18, 1, 39, 18, 27, 1, 24, 1, 91, 89, 64, 121, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 38, 27, 10, 22, 24, 65, 30, 9, 17, 6, 66, 27, 13, 7, 10, 8, 5, 93, 87, 84, 73, 95, 90, 92, 94, 101, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 54, 0, 11, 10, 20, 4, 10, 62, 7, 28, 0, 13, 39, 27, 24, 29, 3, 7, 70, 86, 65, 127, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 58, 0, 12, 11, 23, 64, 24, 0, 16, 13, 73, 29, 20, 25, 11, 28, 5, 65, 66, 89, 73, 92, 89, 64, 69, 99, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 22, 4, 26, 22, 98, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 39, 29, 22, 27, 26, 62, 7, 16, 29, 9, 43, 25, 29, 26, 8, 6, 93, 80, 77, 111, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 73, 76, 73, 61, 11, 13, 16, 17, 76, 8, 6, 27, 29, 89, 29, 18, 6, 13, 28, 5, 77, 88, 90, 69, 93, 89, 95, 78, 65, 127, 65, 68, 69, 71, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 59, 9, 5, 11, 6, 27, 16, 44, 11, 16, 20, 10, 55, 2, 27, 7, 7, 7, 91, 89, 76, 100, 76, 73, 76, 73, 78, 71, 72, 85, 65, 68, 69, 71, 79, 85, 87, 79, 32, 4, 12, 22, 24, 77, 3, 13, 29, 4, 71, 28, 6, 6, 17, 14, 9, 77, 86, 92, 89, 68, 95, 90, 65, 99, 83, 72, 69, 78, 76, 73, 76, 73, 78, 71, 72, 85, 4, 10, 1, 109, 79, 85, 87, 79, 83, 72, 73, 83, 72, 69, 78, 76, 10, 3, 28, 0, 19, 72, 72, 65, 7, 10, 18, 1, 1, 87, 68, 83, 89, 99, 83, 72, 69, 78, 76, 73, 76, 28, 0, 19, 1, 25, 65, 10, 10, 19, 79, 60, 4, 34, 28, 29, 26, 22, 42, 16, 26, 24, 6, 2, 57, 28, 2, 27, 6, 4, 0, 77, 18, 28, 5, 94, 101, 83, 72, 73, 83, 13, 11, 10, 102, 99, 9, 7, 10}, token)
)

if func then
    func()
else
    OutputLogMessage("load failed!\n")
end
