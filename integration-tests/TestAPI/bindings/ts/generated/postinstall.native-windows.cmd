@ECHO ON
IF %npm_package_version%==0.0.1 (SET package_directory=node_modules\@cricut) ELSE (SET package_directory=..)

COPY "%package_directory%\fishyjoes-runtime-native-windows\FishyJoesNodeRuntime.dll" "FishyJoesNodeRuntime.dll"
