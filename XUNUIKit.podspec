#
# Be sure to run `pod lib lint XUNUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XUNUIKit'
  s.version          = '1.0.1'
  s.summary          = 'A tiny ui tools set.'

  s.description      = <<-DESC
    XUNUIKit supply some tools and methods for high frequency use in UI development. Wish XUNUIKit can help you with development.
                       DESC

  s.homepage         = 'https://github.com/ListenXunInNight/XUNUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'https://github.com/ListenXunInNight' => 'listenxun@gmail.com' }
  s.source           = { :git => 'https://github.com/ListenXunInNight/XUNUIKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'XUNUIKit/Classes/**/*'
end
