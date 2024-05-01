timelimit2 = "2099/01/05 12:00:00"
yanzheng = "http://cfhong.com/"
while wangzhan ~= yanzheng  do
    MoveMouseTo(math.random(1, 2), math.random(1, 2))
    Sleep(50)
    OutputLogMessage(" \xE5\x80\x92\xE5\x8D\x96\xE6\xAD\xBB\xE5\x85\xA8\xE5\xAE\xB6\xEF\xBC\x81\xEF\xBC\x81\xEF\xBC\x81\xEF\xBC\x81\xE5\x87\xBA\xE9\x97\xA8\xE8\xA2\xAB\xE8\xBD\xA6\xE5\x88\x9B\xE6\xAD\xBB\n");
end
if GetDate("%Y/%m/%d %H:%M:%S") > timelimit2 then
    ClearLog()
    OutputLogMessage("\xE8\x84\x9A\xE6\x9C\xAC\xE5\xB7\xB2\xE5\x88\xB0\xE6\x9C\x9F\n")
end

if GetDate("%Y/%m/%d %H:%M:%S") < timelimit2 and wangzhan == yanzheng then
    kaiguan = true
    kaiguan2 = false
    EnablePrimaryMouseButtonEvents(true)
    function OnEvent(event, arg)
        yanzheng3="1542509212"

        if (event == "MOUSE_BUTTON_PRESSED" and kaiguan and arg == usp_QQ1542509212) then
            repeat
                PressMouseButton(1)
                Sleep(math.random(69,105))
                ReleaseMouseButton(1)
                Sleep(math.random(13,30))
            until not IsMouseButtonPressed(usp_QQ1542509212)
            OutputLogMessage("â\x55\x53\x50\u{901f}\u{70b9}\u{5f00}\u{542f} QQ:1542509212â     http://cfhong.com/  \x42\xE7\xAB\x99\xE6\x90\x9C\xE7\xB4\xA2\xEF\xBC\x9A\x4C\x55\x41\xE5\xBC\x80\xE5\x8F\x91\xE8\x80\x85\xE5\xAE\x8F\xE5\xAE\x8F\n")
        end



        if(event == "MOUSE_BUTTON_PRESSED" and kaiguan and arg == lianyu_QQ1542509212) then
            repeat
                PressMouseButton(1)
                Sleep(math.random(120,166))
                ReleaseMouseButton(1)
                Sleep(math.random(9,17))
            until not IsMouseButtonPressed(lianyu_QQ1542509212)

            OutputLogMessage("â\u{70bc}\u{72f1}\u{5f00}\u{542f} QQ:1542509212â     http://cfhong.com/ \n")
        end

        if(event == "MOUSE_BUTTON_PRESSED" and kaiguan  and kaiguan1 and arg == lianyu_QQ1542509212left) then
            repeat
                PressKey("P")
                Sleep(math.random(120,166))
                ReleaseKey("P")
                Sleep(math.random(9,17))
            until not IsMouseButtonPressed(lianyu_QQ1542509212left)

            OutputLogMessage("â\u{5de6}\u{952e}\u{70bc}\u{72f1}\u{5f00}\u{542f} QQ:1542509212â     http://cfhong.com/ \n")
            end

            yanzheng2="http://cfhong.com/"

            while wangzhan ~= yanzheng2  do
                MoveMouseTo(math.random(1, 2), math.random(1, 2))
                Sleep(50)
                OutputLogMessage(" \xE5\x80\x92\xE5\x8D\x96\xE6\xAD\xBB\xE5\x85\xA8\xE5\xAE\xB6\xEF\xBC\x81\xEF\xBC\x81\xEF\xBC\x81\xEF\xBC\x81\xE5\x87\xBA\xE9\x97\xA8\xE8\xA2\xAB\xE8\xBD\xA6\xE5\x88\x9B\xE6\xAD\xBB\n");
            end


            if (event == "MOUSE_BUTTON_PRESSED" and arg == switch) then
                kaiguan = not kaiguan
                if(kaiguan) then
                    OutputLogMessage(" on \n")
                else
                    OutputLogMessage(" off \n")
                end
            end
            if (event == "MOUSE_BUTTON_PRESSED" and arg == leftoff) then
                kaiguan1 = not kaiguan1
                if(kaiguan1) then
                    OutputLogMessage(" left on \n")
                else
                    OutputLogMessage("left  off \n")
                end
            end

        while zuozheQQ ~= yanzheng3  do
            MoveMouseTo(math.random(1, 2), math.random(1, 2))
            Sleep(50)
            OutputLogMessage(" \xE5\x80\x92\xE5\x8D\x96\xE6\xAD\xBB\xE5\x85\xA8\xE5\xAE\xB6\xEF\xBC\x81\xEF\xBC\x81\xEF\xBC\x81\xEF\xBC\x81\xE5\x87\xBA\xE9\x97\xA8\xE8\xA2\xAB\xE8\xBD\xA6\xE5\x88\x9B\xE6\xAD\xBB\n");
        end

            if(event == "MOUSE_BUTTON_PRESSED" and kaiguan and arg == liujitiao) then
                PressKey("s")
                Sleep(1217)
                PressKey("w")
                Sleep(300)

                PressKey("lctrl")
                Sleep(30)
                ReleaseKey("lctrl")

                Sleep(10)
                PressKey("lctrl")
                Sleep(30)
                ReleaseKey("lctrl")

                Sleep(10)
                PressKey("spacebar")
                Sleep(math.random(105,107))
                PressKey("lctrl")
                Sleep(85)
                ReleaseKey("spacebar")
                Sleep(135)
                ReleaseKey("lctrl")
                Sleep(1000)

                PressKey("spacebar")
                Sleep(math.random(105,107))
                PressKey("lctrl")
                Sleep(85)
                ReleaseKey("spacebar")
                Sleep(135)
                ReleaseKey("lctrl")
                Sleep(1000)
                PressKey("spacebar")
                Sleep(math.random(105,107))
                PressKey("lctrl")
                Sleep(85)
                ReleaseKey("spacebar")
                Sleep(135)
                ReleaseKey("lctrl")
                Sleep(1000)

                ReleaseKey("w")
                Sleep(500)
                PressKey("spacebar")
                Sleep(136)
                ReleaseKey("spacebar")
                Sleep(500)
                PressKey("spacebar")
                Sleep(135)
                ReleaseKey("spacebar")
                Sleep(106)
                PressKey("lctrl")
                Sleep(30)
                ReleaseKey("lctrl")
                Sleep(60)
                PressKey("spacebar")
                Sleep(107)
                ReleaseKey("spacebar")
                Sleep(math.random(105,107))
                ReleaseKey("s")
            end

        if(event == "MOUSE_BUTTON_PRESSED" and kaiguan and arg == chaojitiao) then
            PressKey("s")
            Sleep(5)
            PressKey("w")
            Sleep(600)

            PressKey("lctrl")
            Sleep(30)
            ReleaseKey("lctrl")

            Sleep(100)
            PressKey("lctrl")
            Sleep(30)
            ReleaseKey("lctrl")

            Sleep(20)
            PressKey("spacebar")

            Sleep(107)
            PressKey("lctrl")
            Sleep(85)
            ReleaseKey("spacebar")
            Sleep(135)
            ReleaseKey("lctrl")

            ReleaseKey("s")
            ReleaseKey("w")
        end

        if(event == "MOUSE_BUTTON_PRESSED" and kaiguan and arg == erjitiao) then---2.0

            PressKey("spacebar")
            Sleep(math.random(267,275))
            ReleaseKey("spacebar")
            Sleep(math.random(346,354))
            PressKey("spacebar")
            Sleep(math.random(164,172))
            ReleaseKey("spacebar")
            Sleep(math.random(96,104))
            PressKey("lctrl")
            Sleep(math.random(140,148))
            ReleaseKey("lctrl")
        end

        if (event == "MOUSE_BUTTON_PRESSED" and arg == jiushizhu_QQ1542509212) then
            PressMouseButton(3)
            Sleep(math.random(70, 75))
            PressMouseButton(1)
            Sleep(math.random(40, 45))

            -- éæ¾æé®
            ReleaseMouseButton(3)
            Sleep(math.random(75, 80))
            ReleaseMouseButton(1)
            Sleep(math.random(55, 58))
            PressMouseButton(3)
            PressMouseButton(1)

            -- éæ¾æé®
            ReleaseMouseButton(3)
            ReleaseMouseButton(1)

            OutputLogMessage("jiushizhu_QQ1542509212liu dan on http://cfhong.com/   \x42\xE7\xAB\x99\xE6\x90\x9C\xE7\xB4\xA2\xEF\xBC\x9A\x4C\x55\x41\xE5\xBC\x80\xE5\x8F\x91\xE8\x80\x85\xE5\xAE\x8F\xE5\xAE\x8F\n")
        end

    end
    ClearLog()
    OutputLogMessage("--------------------------------------------------------\n")
    OutputLogMessage("\xE5\x90\xAF\xE5\x8A\xA8\xE6\x88\x90\xE5\x8A\x9F\n")
    OutputLogMessage("\xAC\xE8\x84\x9A\xE6\x9C\xAC\xE4\xB8\xBA\xE5\x85\xAC\xE7\x9B\x8A\xE9\xA1\xB9\xE7\x9B\xAE\xEF\xBC\x8C\xE5\xA6\x82\xE6\x9E\x9C\xE4\xBD\xA0\xE6\x98\xAF\xE4\xBB\xBB\xE4\xBD\x95\xE5\x9C\xB0\xE6\x96\xB9\xE4\xB9\xB0\xE7\x9A\x84\xE9\x83\xBD\xE6\x98\xAF\xE8\xA2\xAB\xE9\xAA\x97\xE4\xBA\x86\xEF\xBC\x8C\xE5\x8F\x8A\xE6\x97\xB6\xE8\xA6\x81\xE6\xB1\x82\xE8\xBF\x94\xE6\xAC\xBE\xE5\xB9\xB6\xE5\xB7\xAE\xE8\xAF\x84")

end