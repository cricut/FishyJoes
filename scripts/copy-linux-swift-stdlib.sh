#!/bin/zsh
set -euo pipefail

if [[ ! -d kotlin-runtime ]]; then
    echo "Not in root of FishyJoes"
    exit 1
fi

source ./scripts/_read-tool-versions.sh --verbose

alternateLibPaths=()
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

        # If the library isn't found by name where it's supposed to be, search for a same-name library in the fallback paths
        if [[ ! -f $lib ]]; then
            for alt in $alternateLibPaths; do
                altLib=$alt/$(basename $lib)
                if [[ -f $altLib ]]; then
                    lib=$altLib
                    break
                fi
            done
        fi

        if [[ ! -f $lib ]]; then
            echo "not found in $(dirname $lib): $(basename $lib)"
            continue
        fi

        echo "copying $lib"
        cp $lib $destination/
        echo $(basename $lib) >> $libListFile
        for dep in $(patchelf --print-needed $lib); do
            unprocessedLibs+=("$(dirname $lib)/$dep")
        done
    done
}

if [[ "${FISHYJOES_ANDROID:-}" != "0" ]]; then
    # Copy android libs
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

        platformDir=kotlin-runtime/src/generated/resources/lib/$ndkName
        mkdir -p $platformDir

        if [[ -v $XDG_CONFIG_HOME ]]; then
            spmDir=$XDG_CONFIG_HOME/swiftpm
        else
            spmDir=$HOME/.swiftpm
        fi

        androidRoots=(
            $spmDir/swift-sdks/$swiftAndroidSDK.artifactbundle/swift-android/swift-resources/usr/lib/swift-$arch/android/libFoundation.so
            $spmDir/swift-sdks/$swiftAndroidSDK.artifactbundle/swift-android/swift-resources/usr/lib/swift-$arch/android/libFoundationXML.so
            $spmDir/swift-sdks/$swiftAndroidSDK.artifactbundle/swift-android/swift-resources/usr/lib/swift-$arch/android/libswiftSwiftOnoneSupport.so

            # Uncomment this if networking is needed
            # $spmDir/swift-sdks/$swiftAndroidSDK.artifactbundle/swift-android/usr/lib/swift/android/libFoundationNetworking.so
        )
        alternateLibPaths=($spmDir/swift-sdks/$swiftAndroidSDK.artifactbundle/swift-android/ndk-sysroot/usr/lib/$triple)
        copyLibrariesAndDependencies $platformDir $androidRoots

        patchelf --page-size 16384 --add-needed libz.so $platformDir/libFoundationXML.so
    done
fi

# Copy ubuntu libs

if [[ "${FISHYJOES_UBUNTU:-}" != "0" ]]; then
    runtimeLibraryPath=$(swift -print-target-info | jq -r '.paths.runtimeLibraryPaths[0]')
    ubuntuRoots=(
        $runtimeLibraryPath/libFoundation.so
        $runtimeLibraryPath/libFoundationXML.so
        /usr/lib/x86_64-linux-gnu/libxml2.so.2

        # Uncomment this if networking is needed
        # $runtimeLibraryPath/libFoundationNetworking.so
    )

    platformDir=kotlin-runtime/src/generated/resources/linux
    mkdir -p $platformDir
    alternateLibPaths=()

    # Put list of dependency libraries into text file, so they can be extracted from the jar before loading main library
    libListFile=kotlin-runtime/src/generated/resources/linux/stdlib.txt
    printf '' >$libListFile

    copyLibrariesAndDependencies $platformDir $ubuntuRoots
    cat $libListFile
fi
