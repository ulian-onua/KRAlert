Pod::Spec.new do |s|

  s.name         = "KRAlert"

  s.version      = "0.0.8"

  s.summary      = "KRAlert is a wrapper of UIAlertController to simplify its usage in typical cases"

  s.homepage     = "https://github.com/ulian-onua/KRAlert"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Julian Drapaylo" => "ulian.onua@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRAlert.git", :tag => "0.0.8" }

  s.source_files = "Source/*.{swift}"

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '4.2',
  }

  s.frameworks = "Foundation", "UIKit"

  s.requires_arc = true

end
