# Pods for Yamori

platform :ios, '9.3'

use_frameworks!

inhibit_all_warnings!

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.1'
        end
    end
end

def install_pods
  pod 'ActionKit'
  pod 'AssistantKit'
  pod 'Firebase'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Crashlytics'
  pod 'Fabric'
  pod 'Firebase/RemoteConfig'
  pod 'AlamofireSwiftyJSON'
  pod 'DeployGateSDK'
  pod 'GoogleSignIn'
  pod 'HydraAsync', :git => 'ssh://git@github.kddi.com/auhome-developer/Hydra.git'
  pod 'InstantiateStandard'
  pod 'KeychainAccess'
  pod 'Kingfisher', '~> 4.0'
  pod 'ObjectMapper'
  pod 'R.swift'
  pod 'ReachabilitySwift'
  pod 'SnapKit'
  pod 'SwiftDate'
  pod 'SVProgressHUD'
  pod 'Toast-Swift', :git => 'https://github.com/scalessec/Toast-Swift', :branch => 'feature/Swift-4'
  pod 'UIColor_Hex_Swift'
  pod 'XCGLogger'
  pod 'Siren'
  pod 'Charts'
  pod 'GoogleAnalytics'
  pod 'SwiftyUserDefaults'
  pod 'Tabman', :git => 'ssh://git@github.kddi.com/auhome-developer/Tabman.git'
  pod 'AutoInsetter', :git => 'ssh://git@github.kddi.com/auhome-developer/AutoInsetter.git'
  pod 'lottie-ios'
  pod 'SideMenuController', :git => 'ssh://git@github.kddi.com/auhome-developer/SideMenuController.git'
end

target 'auHome-Production-DeployGate' do
  install_pods
end

target 'auHome-AppStore' do
  install_pods
end

target 'auHome-Staging' do
  install_pods
end

target 'auHome' do
  install_pods

  target 'auHomeTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Firebase'
  end

  target 'auHomeUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'withHome' do
  install_pods
end

target 'withHome-Staging' do
  install_pods
end

target 'withHome-Production-DeployGate' do
  install_pods
end

target 'withHome-AppStore' do
  install_pods
end
