#!/bin/zsh
set -euo pipefail

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

source ./scripts/_read-tool-versions.sh --verbose

libSearchPaths=()
# names of all copied libaries will be copied into this file
libListFile=/dev/null

# copyLibrariesAndDependencies installDestination lib1.so lib2.so ...
# copies all libraries into the destination and any dependencies that can be found in the same directory
function copyLibrariesAndDependencies {
    local destination=$1; shift
    local unprocessedLibs=($@)

    mkdir -p $destination

    # Declare associative array to keep track of already copied libraries
    local -A processed
    while (( ${#unprocessedLibs} )); do
        local lib=${unprocessedLibs[1]}
        shift unprocessedLibs
        if (( ${processed[$lib]:-0} )); then continue; fi
        processed[$lib]=1

        # If the library isn't an absolute path, search for the library in libSearchPaths
        if [[ ! $lib =~ ^/ ]]; then
            for dir in $libSearchPaths; do
                if [[ -f $dir/$lib ]]; then
                    lib=$dir/$lib
                    break
                fi
            done
        fi

        if [[ ! -f $lib ]]; then
            echo "library not found: $lib, skipping"
            continue
        fi

        echo "copying $lib"
        cp $lib $destination/
        echo $(basename $lib) >> $libListFile
        for dep in $(patchelf --print-needed $lib); do
            unprocessedLibs+=($dep)
        done
    done
}

didSomething=0
if [[ ! -z ${FISHYJOES_ANDROID_DEST:-} ]]; then
    didSomething=1
    echo "Installing android swift stdlib to $FISHYJOES_ANDROID_DEST"
    for arch in armv7 x86_64 aarch64; do
        case $arch in
            armv7)
                ndkName=armeabi-v7a;
                triple=arm-linux-androideabi;
                ;;
            x86_64)
                ndkName=x86_64;
                triple=x86_64-linux-android;
                ;;
            aarch64)
                ndkName=arm64-v8a;
                triple=aarch64-linux-android;
                ;;
        esac

        platformDir=$FISHYJOES_ANDROID_DEST/$ndkName
        mkdir -p $platformDir

        if [[ -v XDG_CONFIG_HOME ]]; then
            spmDir=$XDG_CONFIG_HOME/swiftpm
        else
            spmDir=$HOME/.swiftpm
        fi

        stdlibDir=$spmDir/swift-sdks/swift-$swiftAndroidSDK.artifactbundle/swift-android/swift-resources/usr/lib/swift-$arch/android
        androidRoots=(
            $stdlibDir/libFoundation.so
            $stdlibDir/libFoundationXML.so
            $stdlibDir/libswiftSwiftOnoneSupport.so

            # Uncomment this if networking is needed
            # $stdlibDir/libFoundationNetworking.so
        )
        libSearchPaths=(
            $stdlibDir
            $spmDir/swift-sdks/$swiftAndroidSDK.artifactbundle/swift-android/ndk-sysroot/usr/lib/$triple
        )
        copyLibrariesAndDependencies $platformDir $androidRoots

        patchelf --page-size 16384 --add-needed libz.so $platformDir/libFoundationXML.so
    done
fi

# Copy ubuntu libs

if [[ ! -z ${FISHYJOES_UBUNTU_DEST:-} ]]; then
    didSomething=1
    echo "Installing ubuntu swift stdlib to $FISHYJOES_UBUNTU_DEST"
    runtimeLibraryPath=$(swift -print-target-info | jq -r '.paths.runtimeLibraryPaths[0]')
    ubuntuRoots=(
        $runtimeLibraryPath/libFoundation.so
        $runtimeLibraryPath/libFoundationXML.so
        /usr/lib/x86_64-linux-gnu/libxml2.so.2

        # Uncomment this if networking is needed
        # $runtimeLibraryPath/libFoundationNetworking.so
    )

    platformDir=$FISHYJOES_UBUNTU_DEST
    mkdir -p $platformDir

    # Put list of dependency libraries into text file for java, so they can be extracted from the jar before loading main library
    libListFile=$FISHYJOES_UBUNTU_DEST/stdlib.txt
    printf '' >$libListFile

    libSearchPaths=($runtimeLibraryPath)
    copyLibrariesAndDependencies $platformDir $ubuntuRoots
    cat $libListFile
fi

if [[ $didSomething -eq 0 ]]; then
    echo "Nothing installed. Set either FISHYJOES_ANDROID_DEST or FISHYJOES_UBUNTU_DEST to select a destination"
    exit 1
fi
