@echo off
DEL eventMacros.txt
for /r "C:\Users\Alan\Google Drive\Bot\eventMacros\upAte99Remake" %%a in (*.event) do type "%%a" >> "eventMacros.txt"