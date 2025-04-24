REM __AUTOGEN_WARNING__

@ECHO ON
IF %npm_package_version%==0.0.1 (SET package_directory=node_modules\@cricut) ELSE (SET package_directory=..)
__NODE_POSTINSTALL_windows__
