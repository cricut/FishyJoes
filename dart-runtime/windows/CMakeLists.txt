# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin to fail to compile for some
# customers of the plugin.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "fishyjoes_runtime")
project(${PROJECT_NAME})

set(FISHYJOES_SHARED_LIB_NAME "FishyJoesIotaRuntime.dll")
set(FISHYJOES_SHARED_LIB_PATH "${CMAKE_CURRENT_SOURCE_DIR}/native/${FISHYJOES_SHARED_LIB_NAME}")

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(fishyjoes_runtime_bundled_libraries
  ${FISHYJOES_SHARED_LIB_PATH}
  PARENT_SCOPE
)
