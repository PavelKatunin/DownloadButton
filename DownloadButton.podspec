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
  s.screenshots     = "https://cloud.githubusercontent.com/assets/1636737/7920524/59c4fd24-08a8-11e5-8ac0-ea8667f335c1.png", "https://cloud.githubusercontent.com/assets/1636737/7920522/59c3c5a8-08a8-11e5-9a74-6de19e5c1047.png", "https://cloud.githubusercontent.com/assets/1636737/7920525/59c7bbea-08a8-11e5-9bd1-a584502a2356.png"
  s.license          = 'Apache License, Version 2.0'
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
