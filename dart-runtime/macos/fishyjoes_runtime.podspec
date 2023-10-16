#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint fishyjoes_runtime.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'fishyjoes_runtime'
  s.version          = '0.0.1'
  s.summary          = 'FishyJoes Runtime for flutter'
  s.description      = 'FishyJoes Runtime for flutter'

  s.homepage         = 'https://github.com/cricut/FishyJoes'
  s.author           = ''

  s.source           = { :path => '.' }
  s.preserve_paths   = 'native/libFishyJoesIotaRuntime.dylib'
  s.vendored_libraries = 'native/libFishyJoesIotaRuntime.dylib'

  s.platform = :osx, '10.11'
end
