@echo off
cls
echo.
echo.
echo.
echo.
echo.
rem "C:\Program Files (x86)\Dev-Cpp\MinGW64\bin\g++" graphic.cpp

"C:\Program Files (x86)\Dev-Cpp\MinGW64\bin\g++" graphic.cpp -IC:\mingw\include\SDL2 -LC:\mingw\lib -w -Wl,-subsystem,windows -lmingw32 -lSDL2main -lSDL2 -o graphic


graphic

rem del a.exe
rem "C:\Program Files (x86)\Dev-Cpp\MinGW64\bin\g++" -I "F:\mayday folder\RPG_OOP\repo\rpg\C++\include\SDL2" -L "F:\mayday folder\RPG_OOP\repo\rpg\C++\lib" -Wl,-subsystem,windows -lmingw32 -lSDL2main -lSDL2 -o graphic
rem -Iinclude -lmingw32 -lSDL2main -lSDL2 graphic.cpp