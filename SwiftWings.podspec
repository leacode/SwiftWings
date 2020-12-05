Pod::Spec.new do |s|
  s.name             = 'SwiftWings'
  s.version          = '1.6.0'
  s.summary          = 'A collection of Swift extensions for all platforms'
  s.homepage         = 'https://github.com/leacode/SwiftWings'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leacode' => 'lichunyu@vip.qq.com' }
  s.source           = { :git => 'https://github.com/leacode/SwiftWings.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target  = '10.11'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3']
  
  s.source_files   = 'Sources/**/*.swift'
  
  s.frameworks     = 'Foundation'

end
