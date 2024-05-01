switch = 3

lianyu = 0
usp = 5
cache_jump=4

isenable = true

function OnEvent(event, arg)

    if (event == "MOUSE_BUTTON_PRESSED" and arg == switch) then
        isenable = not isenable
        if(isenable) then
            OutputLogMessage(" on \n")
        else
            OutputLogMessage(" off \n")
        end
    end

    if(event == "MOUSE_BUTTON_PRESSED" and isenable and arg == lianyu) then
        repeat
            PressMouseButton(1)
            Sleep(math.random(125,171))
            ReleaseMouseButton(1)
            Sleep(math.random(11,23))
        until not IsMouseButtonPressed(lianyu)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and isenable and arg == usp) then
        local count = 0
        local _slow = math.random(8, 10)
        repeat
            local _random = math.random(0, 99)
            if (count < 3) then
                _random = 2
            end
            if (_random % 2 == 0 or count % 7 == 0) then
                PressMouseButton(1)
                Sleep(math.random(60,88))
                ReleaseMouseButton(1)
                Sleep(math.random(11,25))
                --OutputLogMessage("High speed: %d\n", _random)
            elseif (count % _slow == 0) then
                PressMouseButton(1)
                Sleep(math.random(79,128))
                ReleaseMouseButton(1)
                Sleep(math.random(19,45))
                 _slow = math.random(7, 9)
                count = -1
            else
                PressMouseButton(1)
                Sleep(math.random(66,101))
                ReleaseMouseButton(1)
                Sleep(math.random(13,30))
                --OutputLogMessage("low speed: %d\n", _random)
            end
            count = count + 1
       until not IsMouseButtonPressed(usp)
    end

    if(event == "MOUSE_BUTTON_PRESSED" and isenable and arg == cache_jump) then
        local timing = 0
        --OutputLogMessage("start: \n")
        PressKey("w")
        --Sleep(5)
        timing = math.random(5, 11)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)
        PressKey("s")
        --Sleep(277)
        timing = math.random(99, 122)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)

        PressKey("lctrl")
        --Sleep(40)
        timing = math.random(36, 66)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)
        ReleaseKey("lctrl")
        --Sleep(77)
        timing = math.random(44, 66)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)

        PressKey("lctrl")
        --Sleep(43)
        timing = math.random(44, 55)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)
        ReleaseKey("lctrl")
        --Sleep(66)
        timing = math.random(50, 66)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)

        PressKey("lctrl")
        --Sleep(30)
        timing = math.random(27, 33)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)
        ReleaseKey("lctrl")
        --Sleep(690)
        timing = math.random(650, 750)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)

        PressKey("spacebar")
        --Sleep(77)
        timing = math.random(22, 33)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)

        PressKey("lctrl")
        --Sleep(85)
        timing = math.random(77, 88)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)
        ReleaseKey("spacebar")
        --Sleep(135)
        timing = math.random(129, 144)
        OutputLogMessage("%d \t", timing)
        Sleep(timing)
        ReleaseKey("lctrl")
        --Sleep(25)
        timing = math.random(20, 40)
        OutputLogMessage("%d \n", timing)
        Sleep(timing)

        ReleaseKey("w")
        ReleaseKey("s")
    end
end