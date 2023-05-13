Cls

Dim x As Integer

' integer is just 2 bytes. the file should be 2 bytes now

file$ = "map2.bin"



Open file$ For Binary As #1

' numbers are stored as LITTLE EDIAN!!!

' python int.from_bytes(b, "little")

Get #1, , x

Close #1

Print x

Sleep

