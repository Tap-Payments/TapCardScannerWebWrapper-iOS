Pod::Spec.new do |s|
  s.name             = 'TapCardScannerWebWrapper-iOS'
  s.version          = '0.0.10'
  s.summary          = 'Common data models for used across different Tap sdks SharedDataModels-iOS.'
  s.homepage         = 'https://github.com/Tap-Payments/TapCardScannerWebWrapper-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'o.rabie' => 'o.rabie@tap.company', 'h.sheshtawy' => 'h.sheshtawy@tap.company' }
  s.source           = { :git => 'https://github.com/Tap-Payments/TapCardScannerWebWrapper-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'
  s.swift_version = '5.0'
  s.source_files  = "Sources/TapCardScannerWebWrapper-iOS/Logic/**/*.{h,m,swift}"
  s.resources = "Sources/TapCardScannerWebWrapper-iOS/Assets/**/*.{json,xib,pdf,png,gif,storyboard}"
  s.dependency 'SharedDataModels-iOS', '>= 0.0.14'
  s.dependency 'TapCardVlidatorKit-iOS', '>= 1.0.26'
end
