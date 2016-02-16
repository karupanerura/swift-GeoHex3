#
# Be sure to run `pod lib lint GeoHex3.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GeoHex3"
  s.version          = "0.1.0"
  s.summary          = "GeoHex 3.2 framework for Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       GeoHex 3.2 framework for Swift.
                       A wrapper for c-geohex3.
                       DESC

  s.homepage         = "https://github.com/karupanerura/swift-GeoHex3"
  s.license          = 'MIT'
  s.author           = { "karupanerura" => "karupa@cpan.org" }
  s.source           = { :git => "https://github.com/karupanerura/swift-GeoHex3.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/karupanerura'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'CoreLocation'
end
