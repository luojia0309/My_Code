switch = 3

lianyu = 5
usp = 0

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
            Sleep(math.random(139,181))
            ReleaseMouseButton(1)
            Sleep(math.random(14,27))
        until not IsMouseButtonPressed(lianyu)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and isenable and arg == usp) then
        local count = 0
        repeat
            local _random = math.random(0, 99)
            if (count < 3) then
                _random = 2
            end
            if (_random % 2 == 0) then
                PressMouseButton(1)
                Sleep(math.random(60,85))
                ReleaseMouseButton(1)
                Sleep(math.random(11,25))
                --OutputLogMessage("High speed: %d\n", _random)
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

end