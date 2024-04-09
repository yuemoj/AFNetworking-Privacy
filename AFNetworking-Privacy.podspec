Pod::Spec.new do |s|
  s.name     = 'AFNetworking-Privacy'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A delightful networking framework for Apple platforms.'
  s.homepage = 'https://github.com/yuemoj/AFNetworking-Privacy.git'
  # s.social_media_url = 'https://twitter.com/AFNetworking'
  s.author   = { "yuemoj" => "yj_745@163.com" }
  s.source   = { :git => 'https://github.com/yuemoj/AFNetworking-Privacy.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  # s.tvos.deployment_target = '9.0'

  s.ios.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking' }
  s.osx.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking' }
  s.watchos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking-watchOS' }
  # s.tvos.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER' => 'com.alamofire.AFNetworking' }

  s.source_files = 'AFNetworking/AFNetworking.h'
  s.resource_bundles = {'AFNetworking-Privacy' => ['AFNetworking/PrivacyInfo.xcprivacy']}

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking/AFSecurityPolicy.{h,m}'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.osx.deployment_target = '10.10'
    # ss.tvos.deployment_target = '9.0'

    ss.source_files = 'AFNetworking/AFNetworkReachabilityManager.{h,m}'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworking-Privacy/Serialization'
    ss.ios.dependency 'AFNetworking-Privacy/Reachability'
    ss.osx.dependency 'AFNetworking-Privacy/Reachability'
    # ss.tvos.dependency 'AFNetworking-Privacy/Reachability'
    ss.dependency 'AFNetworking-Privacy/Security'

    ss.source_files = 'AFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'
  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '9.0'
    # ss.tvos.deployment_target = '9.0'
    ss.dependency 'AFNetworking-Privacy/NSURLSession'

    ss.source_files = 'UIKit+AFNetworking'
  end
end
