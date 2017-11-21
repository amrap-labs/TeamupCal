platform :ios, '9.0'

workspace 'TeamupCal'

use_frameworks!

def shared_pods

    pod 'TeamupKit', '~> 0.1'
    pod 'Disk', '~> 0.3'
end

target 'TeamupCal' do
  project './Sources/TeamupCal.xcodeproj'
  target 'TeamupCalTests'

  shared_pods
end

target 'TeamupCal-Example' do
  project './Example/TeamupCal-Example.xcodeproj'

  shared_pods
end