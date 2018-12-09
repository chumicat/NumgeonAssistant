[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=120
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=3e178355-037f-435e-810f-b54c4b2a47ac
Description=NumgeonAssistant
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
// 參數
x_off = 7
y_off = 7
acc = 1
dl = 0
x_range = 300
y_range = 200

// 圖片path
path = "C:\numgeonAssistant\1x\"
colors = "r"
nt = 1
typ = ".bmp"
total = path + colors + CStr(nt) + typ

// 回合紀錄變數
exist = Array(False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False, False)
x_pos = Array(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
y_pos = Array(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1)
Dim result

// Main
//KeyPress "Space", 1
MoveTo 15, 45
//KeyPress "Space", 1
Call check()
Call sizeType()
Call moveAndClick()

Sub moveAndClick()
  nt = 0
  For 25
    If exist(nt) Then 
  	  MoveTo x_pos(nt), y_pos(nt)
  	  Delay 70
  	  LeftClick 3
  	  Delay dl
    End If
  	nt = nt + 1
  Next
End Sub

Sub check()
  nt = 1
  For 25
    total = path + "w" + CStr(nt) + typ
    FindPic 0,0,x_range,y_range,total,acc,intX,intY
    If intX > 0 And intY > 0 Then 
      exist(nt - 1) = True
      x_pos(nt - 1) = intX + x_off
      y_pos(nt - 1) = intY + y_off
    End If
  
    total = path + "r" + CStr(nt) + typ
    FindPic 0,0,x_range,y_range,total,acc,intX,intY
    If intX > 0 And intY > 0 Then 
      exist(nt - 1) = True
      x_pos(nt - 1) = intX + x_off
      y_pos(nt - 1) = intY + y_off
    End If
  
    nt = nt + 1
  Next
End Sub

// 檢查大小回傳到result，0:不完整；1:16*16；2:25*25
Sub sizeType()
  result_16 = True
  i = 0
  For 16
    result_16 = result_16 AND exist(i)
    i = i + 1
  Next

  result_25 = result_16
  For 9
    result_25 = result_25 AND exist(i)
    i = i + 1
  Next
  
  If result_25 Then 
  	result = 2
  ElseIf result_16 Then
    result = 1
  Else 
    result = 0
  End If
  //MessageBox(result)
End Sub



