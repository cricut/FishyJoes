# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin to fail to compile for some
# customers of the plugin.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "fishyjoes_runtime")
project(${PROJECT_NAME})

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(fishyjoes_dart_bundled_libraries
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libFishyJoesIotaRuntime.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libBlocksRuntime.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libdispatch.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libFoundation.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libFoundationNetworking.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libFoundationXML.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswift_Concurrency.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswift_Differentiation.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswift_RegexParser.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswift_StringProcessing.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswiftCore.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswiftDispatch.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswiftDistributed.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswiftRemoteMirror.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/libswiftSwiftOnoneSupport.so
  PARENT_SCOPE
)
