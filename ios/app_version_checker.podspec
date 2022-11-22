#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint app_version_checker.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'app_version_checker'
  s.version          = '1.0.0'
  s.summary          = ' lightweight flutter plugin to check if your app is up-to-date on Google Play Store or Apple App Store'
  s.description      = <<-DESC
  lightweight flutter plugin to check if your app is up-to-date on Google Play Store or Apple App Store
                       DESC
  s.homepage         = 'https://github.com/ziqq/flutter_app_version_checker'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'a.a.ustinoff@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
