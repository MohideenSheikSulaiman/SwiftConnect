Pod::Spec.new do |s|
  s.name             = 'SwiftConnect'
  s.version          = '1.0.0'
  s.summary          = 'SwiftConnect, simple yet powerful networking abstraction layer'
  
  s.description      = <<-DESC
SwiftConnect is a lightweight network abstraction layer, built on top of Alamofire. It can be used to dramatically simplify interacting with RESTful JSON web-services.
                       DESC
                       
  s.homepage         = 'https://github.com/tareksabry1337/SwiftConnect'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tarek Sabry' => 'tareksabry444@outlook.com' }
  s.source           = { :git => 'https://github.com/tareksabry1337/SwiftConnect.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'SwiftConnect/Classes/**/*'
  s.dependency 'Alamofire', '5.1.0'
  s.swift_version = '5.0'
end
