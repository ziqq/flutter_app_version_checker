#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_app_version_checker.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_app_version_checker'
  s.version          = '1.1.0'
  s.license          = { :type => 'MIT', :file => './../LICENSE' }
  s.homepage         = 'https://github.com/ziqq/flutter_app_version_checker'
  s.authors           = { 'Anton Ustinoff' => 'a.a.ustinoff@gmail.com' }
  s.summary          = ' lightweight flutter plugin to check if your app is up-to-date on Google Play Store or Apple App Store'
  s.source           = { :git => 'https://github.com/ziqq/flutter_app_version_checker.git', :tag => s.version.to_s }
  s.module_name      = 'flutter_app_version_checker'
  s.swift_version = '5.0'

  s.ios.deployment_target  = '9.0'

  s.source_files = 'Classes/**/*'
  s.platforms = { :ios => '9.0' }
  s.dependency 'Flutter'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64, i386' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
