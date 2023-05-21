' $dynamic
$Resize:Stretch

Screen 13, 0, 0, 1

Cls
scale = 12

Type npc
    n As String
    speech As String
    x As Integer
    y As Integer
    t As Integer

End Type


Type player
    x As Integer
    y As Integer
    gold As Integer
End Type

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


Dim p As player
p.x = 10
p.y = 10


Dim map(100) As entry


Dim Shared curMap(32, 32) As Integer
Dim Shared npcs(32, 32) As npc

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


Dim in As Integer
Dim in2 As Integer
Dim b As _Byte
Dim s As String


Open "bigtown_npc.bin" For Binary As #1
Cls
Get #1, , in ' amount of npcs
For i = 0 To in - 1
    n$ = ""
    Get #1, , in2  'name length
    For j = 0 To in2 - 1
        Get #1, , b
        n$ = n$ + Chr$(b)
    Next j
    Print n$

    msg$ = ""
    Get #1, , in2
    For j = 0 To in2 - 1
        Get #1, , b
        msg$ = msg$ + Chr$(b)
    Next j
    Print msg$


    Get #1, , x
    Get #1, , y

    npcs(x, y).n = n$
    npcs(x, y).speech = msg$

    Print x, y
    PCopy 0, 1
    Sleep

Next i
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

        Line (p.x * scale, p.y * scale)-(p.x * scale + scale, p.y * scale + scale), 15, BF

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
    PCopy 0, 1
    _Delay .01
    k$ = InKey$

    If k$ = "d" Then

        If isBlank(p.x + 1, p.y) = 1 Then p.x = p.x + 1

        '        cam.x = cam.x - 1
    ElseIf k$ = "a" Then
        If isBlank(p.x - 1, p.y) = 1 Then p.x = p.x - 1
        '       cam.x = cam.x + 1
    ElseIf k$ = "s" Then
        If isBlank(p.x, p.y + 1) = 1 Then p.y = p.y + 1
        '      cam.y = cam.y + 1
    ElseIf k$ = "w" Then
        If isBlank(p.x, p.y - 1) = 1 Then p.y = p.y - 1
        '     cam.y = cam.y - 1
    End If

    'cam.x = (32 - p.x) * scale
    'can.y = (32 - p.y) * scale
Loop

Sub isNpc (ix, iy)
    If curMap(ix, iy) = 3 Then
        s$ = npcs(ix, iy).speech
        For z = 0 To Len(s$)
            Cls
            Print
            Print npcs(ix, iy).n + " says..."
            Print

            If Mid$(s$, z, 1) = " " Then Sound 73 + Int(Rnd * 100), 1

            Print Left$(s$, z)

            PCopy 0, 1
            _Delay 0.05
        Next z
        Sleep
    End If
End Sub

Function isBlank (ix As Integer, iy As Integer)
    outt = 0
    If ix < 32 And ix >= 0 Then
        If iy < 32 And iy >= 0 Then
            If curMap(ix, iy) = 0 Then
                outt = 1
            ElseIf curMap(ix, iy) = 3 Then
                isNpc ix, iy
            End If
        End If
    End If
    isBlank = outt
End Function
