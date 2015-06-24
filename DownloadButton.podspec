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
  s.screenshots     = "https://cloud.githubusercontent.com/assets/1636737/7920830/2c4470da-08aa-11e5-99be-e7e9a04479f8.png", "https://cloud.githubusercontent.com/assets/1636737/7920909/7403d906-08aa-11e5-92d5-f92a09bc2bdc.png"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Pavel Katunin" => "wk.katunin@gmail.com" }
  s.source           = { :git => "https://github.com/PavelKatunin/DownloadButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KatuninP'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DownloadButton' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

end
