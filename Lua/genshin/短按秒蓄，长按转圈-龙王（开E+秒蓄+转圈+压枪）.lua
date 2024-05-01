function OnEvent(event, arg)
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then--5是侧键上，4是侧键下
    x,y = GetMousePosition()
    press_E()
    Sleep(50)
    xuli()
    local i = 0
    while IsMouseButtonPressed(5) do
      MoveMouseRelative(300, 0)--转圈模块，300代表转速，越大越快
      Sleep(10)
      i = i + 1
      if (i % 5 == 0) then
        MoveMouseRelative(0, 60)--压枪模块，60代表镜头下压的幅度，越大越快，上限100
      end
    end
    MoveMouseTo(x,y)
  end
end


--开E模块
function press_E()
  PressKey("E")
  Sleep(150)
  ReleaseKey("E")
end

--秒蓄模块，1是代表鼠标左键
function xuli()
  PressMouseButton(1)
  Sleep(250)
  ReleaseMouseButton(1)
end


-- 另一种
--[[
EnablePrimaryMouseButtonEvents(true) --解锁1号主键，使用1号位前记得先设置另一个键位为主键！
--  数值区
local i=240*1--角速度常数 -- 个人DPI是2000，根据自己的DPI更改240这个数值  “*1”是倍数，你可以更《快》乐的
--本人电脑测得250是刚好一圈0.4秒，但实际操作需要速度慢点，所以使用了240

--  控制函数区
function OnEvent(event, arg) 
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then --秒蓄模块，改生效键改这（秒蓄不可使用1号位，代码冲突）
            MXLE() --E模块,不要E就在这行前面加“--”
            Sleep(10) --保证稳定性
            MXL() --秒蓄
    end
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then  --旋转模块--点按有轻微位移，长按开转
        repeat ZQQ() until not IsMouseButtonPressed(4) --该命令仅在主、侧键（1、4、5）键位生效，且鼠标键位设置内需恢复默认键位（1-主键、4-后退、5-前进）
    end 
end
---功能区
--  转圈圈
function ZQQ()
      Sleep(10)
      MoveMouseRelative(i,0)
      Sleep(10)
end
--  E
function MXLE()
      PressKey("E")
      Sleep(150)
      ReleaseKey("E")
end
--  秒蓄
function MXL()
      PressMouseButton(1)
      Sleep(250)
      ReleaseMouseButton(1)
end
]]