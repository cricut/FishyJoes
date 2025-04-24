# __AUTOGEN_WARNING__

#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint __LOWERCASE_MODULE_NAME___flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'cricut___LOWERCASE_MODULE_NAME__'
  s.version          = '0.0.1'
  s.summary          = 'Flutter bindings for __MODULE_NAME__'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.preserve_paths   = [ 'native/lib__MODULE_NAME__-iota.dylib', 'native/lib__MODULE_NAME__.dylib' ]
  s.vendored_libraries = [ 'native/lib__MODULE_NAME__-iota.dylib', 'native/lib__MODULE_NAME__.dylib' ]

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
