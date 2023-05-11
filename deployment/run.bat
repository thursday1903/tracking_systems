TITLE "tracking_system_managers"
mkdir log
cd log
cd ..
:loop
java -Xmx1024m -Dlog4j.configurationFile=resource/log4j2.properties -classpath "lib/*" com.system.MainApplication --spring.config.location=resource/application.properties
if %ERRORLEVEL% EQU 1 goto loop
 