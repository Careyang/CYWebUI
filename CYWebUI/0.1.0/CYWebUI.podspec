#
# Be sure to run `pod lib lint CYWebUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CYWebUI'
  s.version          = '0.1.0'
  s.summary          = '方便加载网页，自用.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    自己方便加载网页，不想每次重写代码，就这样吧。
                       DESC

  s.homepage         = 'https://github.com/Careyang/CYWebUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mastercy919@hotmail.com' => 'mastercy919@hotmail.com' }
  s.source           = { :git => 'https://github.com/Careyang/CYWebUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CYWebUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CYWebUI' => ['CYWebUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
