# Firebase-App

# 1- Create a Firebase Project
  
  <p> Console => New Project  <p>
  
 
# 1- attach the firebase Project to the IOS Application
  <p> chose IOS=> add this bundle id to the farbase project "Mehdi-Benrefad.FirebaseApp" => download the "GoogleService-Info.plist" file and add it on the project (delete the existing one on the xcode project) </p>
  
# 2- install libaries from cocoapods
  <p> open podfile from Command Line "open -a xcode podfile"<br>
  => add these lines on the file<br>
pod 'Firebase/Analytics'<br>
pod 'Firebase/Database'<br>
pod 'Firebase/Auth'<br>
pod 'Firebase/Core'<br>
  => save the file<br>
  => tap "pod install" on the Command Line
</p>
