@echo off
setlocal enabledelayedexpansion

:: hosts 파일 경로
set HOSTS_FILE=C:\Windows\System32\drivers\etc\hosts

:: 백업 파일 생성
copy "%HOSTS_FILE%" "%HOSTS_FILE%.iris_vpn_route.bak"

:: 삭제할 항목 설정
set TARGET0=#eval.iris.go.kr ^& Connected Service HOSTS Changte(TIPA)
set TARGET1=210.219.53.115 eval.iris.go.kr
set TARGET2=210.219.53.116 pdfv.iris.go.kr
set TARGET3=210.219.53.113 eform.iris.go.kr
set TARGET4=210.219.53.113 report.iris.go.kr
set TARGET5=210.219.53.119 vcs.iris.go.kr

:: hosts 파일에서 해당 항목들을 삭제
findstr /v "%TARGET0%" "%HOSTS_FILE%" | findstr /v "%TARGET1%" | findstr /v "%TARGET2%" | findstr /v "%TARGET3%" | findstr /v "%TARGET4%" | findstr /v "%TARGET5%" > "%HOSTS_FILE%.tmp"

move /Y "%HOSTS_FILE%.tmp" "%HOSTS_FILE%"

echo iris hosts route delete SUCCESS!!!
pause
