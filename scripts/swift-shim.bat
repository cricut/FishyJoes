IF defined PATH set OldPath=%PATH%
IF defined Path set OldPath=%Path%
set PATH=
set Path=%OldPath%
swift %*
