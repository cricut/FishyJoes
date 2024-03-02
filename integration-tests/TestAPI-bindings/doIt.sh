#rm -f .build/arm64-apple-macosx/debug/libTestAPI.dylib
rm -f .build/arm64-apple-macosx/debug/libTestAPI-iota.dylib
/Applications/Xcode_15.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-build --product TestAPI-iota --configuration debug -j 1 -Xlinker -rpath -Xlinker @loader_path
#cp .build/arm64-apple-macosx/debug/libTestAPI.dylib kotlin/src/generated/resources/mac/libTestAPI.dylib
cp .build/arm64-apple-macosx/debug/libTestAPI-iota.dylib dart/macos/native/libTestAPI-iota.dylib

