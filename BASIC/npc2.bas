$Resize:Stretch
Screen 13


Type Npc
    islive As Integer
    name As String
    speech As String
End Type


px = 0
py = 0
size = 32
tnow = 0


Dim map(5, 5) As Npc

map(2, 2).islive = 1
map(2, 2).name = "Bill"
map(2, 2).speech = "Have you played Atari today?"


map(3, 0).islive = 1
map(3, 0).name = "Jon T. Hater"
map(3, 0).speech = "I hate games!!!!"


Do
    GoSub drawMap
    GoSub checkTile
    Sleep
    k$ = InKey$

    If k$ = "w" Then
        py = py - 1 ' could be better lmao
    ElseIf k$ = "s" Then py = py + 1
    ElseIf k$ = "d" Then px = px + 1
    ElseIf k$ = "a" Then px = px - 1
    ElseIf k$ = "t" Then GoSub talk
    Else
    End If
Loop

System



talk:


If tnow = 1 Then
    name$ = map(px, py).name
    speech$ = map(px, py).speech
    Cls
    Print
    Print " "; name$; ":"
    e = 1
    Print
    Print "   ";
    While e < Len(speech$) + 1
        Print Mid$(speech$, e, 1);
        e = e + 1
        _Delay .02
    Wend
    Do
    Loop Until InKey$ = "t"
End If
Return


checkTile:
If px >= 0 And px < 5 And py >= 0 And py < 5 Then
    If map(px, py).islive = 1 Then
        GoSub popUp
        tnow = 1
        Return
    End If
End If
tnow = 0
Return

popUp:
'Line (0, 0)-(100, 20), 0, BF
'Line (0, 0)-(100, 20), 15, B
Print "press t to talk"
Return

drawMap:
Cls
For y = 0 To 4
    For x = 0 To 4
        If x = px And y = py Then
            'Print "p";
            Line (x * size, y * size)-(x * size + size, y * size + size), 15, BF
        ElseIf map(x, y).islive = 1 Then

            Line (x * size, y * size)-(x * size + size, y * size + size), 10, BF

        Else
            Line (x * size, y * size)-(x * size + size, y * size + size), 15, B
        End If
    Next x
    Print
Next y
Return


Sub speak (person As Npc)
    Print person.speech
    Sleep
End Sub

