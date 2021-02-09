#
# Be sure to run `pod lib lint CXStarRatingView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CXStarRatingView'
  s.version          = '0.1.0'
  s.summary          = 'Swift版本的星星评分控件'
  s.description      = <<-DESC
 '支持整星、半星、任意值填充星星，支持点击和滑动评分'
                       DESC

  s.homepage         = 'https://github.com/chunxige/CXStarRatingView.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1193700248@qq.com' => '1193700248@qq.com' }
  s.source           = { :git => 'https://github.com/chunxige/CXStarRatingView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'CXStarRatingView/Classes/*'
  s.swift_versions = '5.0'
end
