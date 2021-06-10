# Firebase-App

# 1- Create a Firebase Project
  
  <p> Console => New Project  <p>
  
 
# 1- attach the firebase Project to the IOS Application
  <p> chose IOS=> add this bundle id to the farbase project "Mehdi-Benrefad.FirebaseApp" => download the "GoogleService-Info.plist" file and add it on the project (delete the existing one on the xcode project) </p>
  
# 2- install libaries from cocoapods
  <p> open podfile from Command Line "open -a xcode podfile"
  => add these lines on the file
pod 'Firebase/Analytics'
pod 'Firebase/Database'
pod 'Firebase/Auth'
pod 'Firebase/Core'
  => save the file
  => tap "pod install" on the Command Line
</p>
