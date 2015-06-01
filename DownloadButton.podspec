#
# Be sure to run `pod lib lint DownloadButton.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DownloadButton"
  s.version          = "0.1.0"
  s.summary          = "Customizable Appstore style download button."
  s.description      = <<-DESC
                       Customizable Appstore style download button, and other UI components

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/PavelKatunin/DownloadButton"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Pavel Katunin" => "wk.katunin@gmail.com" }
  s.source           = { :git => "https://github.com/PavelKatunin/DownloadButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KatuninP'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DownloadButton' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

end
