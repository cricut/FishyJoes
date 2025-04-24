# __AUTOGEN_WARNING__

# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin to fail to compile for some
# customers of the plugin.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "__LOWERCASE_MODULE_NAME___flutter")
project(${PROJECT_NAME} LANGUAGES CXX)

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(cricut___LOWERCASE_MODULE_NAME___bundled_libraries
  ${CMAKE_CURRENT_SOURCE_DIR}/native/lib__MODULE_NAME__.so
  ${CMAKE_CURRENT_SOURCE_DIR}/native/lib__MODULE_NAME__-iota.so
  PARENT_SCOPE
)
