# Firebase-App

# To run the application follow the next steps

<hr>

# 1- Create a Firebase Project
  
  <p> Console => New Project  <p>
  
 <hr>
 
# 2- attach the firebase Project to the IOS Application
  <p> chose IOS=> add this bundle id to the farbase project "Mehdi-Benrefad.FirebaseApp" => download the "GoogleService-Info.plist" file and add it on the project (delete the existing one on the xcode project) </p>
  
  <hr>
  
# 3- install libaries from cocoapods
  <p> open podfile from Command Line "open -a xcode podfile"<br>
  => add these lines on the file<br>
pod 'Firebase/Analytics'<br>
pod 'Firebase/Database'<br>
pod 'Firebase/Auth'<br>
pod 'Firebase/Core'<br>
  => save the file<br>
  => tap "pod install" on the Command Line <br>
  => check if the firebase importation exist on the app delegate <br>
  => check if this function (FirebaseApp.configure()) exist on the application method
</p>

<hr>

# 4- Authentication
  <p> Go to Firebase:"<br>
  =>Activate autentication mode with email and password<br>
  => Add a user by adding it's username and password<br>
</p>


