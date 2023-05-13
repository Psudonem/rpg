' $dynamic
$Resize:Stretch

Screen 13

Cls
scale = 12
Type entry
    x As Integer
    y As Integer
    t As Integer
End Type

Type camera
    x As Integer
    y As Integer
    scale As Integer
End Type
Dim cam As camera
cam.x = 0
cam.y = 0
cam.scale = 12

Dim map(100) As entry
Dim curMap(32, 32) As Integer

Dim entryCount As Integer
Dim x As Integer
Dim y As Integer
Dim t As Integer

' integer is just 2 bytes. the file should be 2 bytes now

file$ = "bigTown.bin"

'Print "press any key to load map"
'Sleep

Open file$ For Binary As #1

' numbers are stored as LITTLE EDIAN!!!

' python int.from_bytes(b, "little")

Get #1, , entryCount

Print entryCount

ReDim map(entryCount) As entry

For j = 0 To entryCount - 1
    Get #1, , x
    Get #1, , y
    Get #1, , t
    'Print x, y, t
    map(j).x = x
    map(j).y = y
    map(j).t = t
    curMap(x, y) = t
Next j

Close #1

'Print x

'Sleep


Cls


Do
    Cls
    For j = 0 To entryCount - 1
        '        PSet (map(j).x, map(j).y)
        x = map(j).x
        y = map(j).y
        scale = cam.scale
        t = map(j).t

        fx1 = x * scale + cam.x
        fy1 = y * scale + cam.y
        fx2 = x * scale + scale + cam.x
        fy2 = y * scale + scale + cam.y

        If t = 1 Then
            Line (fx1, fy1)-(fx2, fy2), _RGB(255, 100, 100), BF

        ElseIf t = 2 Then
            Line (fx1, fy1)-(fx2, fy2), _RGB(155, 0, 0), BF
        ElseIf t = 3 Then
            Line (fx1, fy1)-(fx2, fy2), _RGB(0, 200, 200), B
        ElseIf t = 4 Then
            Line (fx1, fy1)-(fx2, fy2), _RGB(200, 200, 0), BF
        End If

    Next j
    _Delay .01
    k$ = InKey$

    If k$ = "d" Then
        cam.x = cam.x - 1
    ElseIf k$ = "a" Then
        cam.x = cam.x + 1
    ElseIf k$ = "s" Then
        cam.y = cam.y + 1
    ElseIf k$ = "w" Then
        cam.y = cam.y - 1
    End If
Loop



