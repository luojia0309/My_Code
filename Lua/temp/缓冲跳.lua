-- version 2.0
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




-- version 1.0
if(event == "MOUSE_BUTTON_PRESSED" and isenable and arg == chaojitiao) then
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