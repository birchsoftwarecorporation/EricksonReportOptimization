rem http://wiki.pentaho.com/display/EAI/Kitchen+User+Documentation
rem http://infocenter.pentaho.com/help/index.jsp?topic=%2Fpdi_user_guide%2Freference_pan.html

rem Add the Arizona drive so it will reattach during the scheduled task
@echo off

Reno= R: \\pdb05p\Reno
Sacramen= S: \\pdb05p\Sacramento


NET USE G: /delete /y
NET USE R: /delete /y
NET USE S: /delete /y
NET USE G: \\pfs05v\Chandler
NET USE R: \\pdb05p\Reno
NET USE S: \\pdb05p\Sacramento

C:\ReportOptimization\pentaho\data-integration\Pan.bat -file="C:\ReportOptimization\ETL\Extract Job Card Data.ktr" -logfile=C:\ReportOptimization\logs\jobcard-output.log -level=Basic
