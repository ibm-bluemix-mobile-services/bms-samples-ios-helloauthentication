# HelloAuthentication application for IBM MobileFirst Services on IBM Bluemix
---
The HelloAuthentication sample contains an Objective-C project that you can use to learn the Mobile Client Access service.  
### Configure the back end for your HelloAuthentication application
Before you can run the helloAuthentication application, you must set up an app on Bluemix.  By setting up this app, service instances for the data, push, security, and monitoring functions of the app are configured.

1. Sign up for a [Bluemix](http://bluemix.net) Account.
2. Create a mobile app.  In the Boilerplates section Bluemix catalog, click **MobileFirst Services Starter**.  Choose a **Name** and click **Create**.
3. Set up at least one Authentication method on Bluemix for your mobile App (The sample is currently configured for Facebook)

### Downloading the samples
Clone the samples from IBM DevOps Services with the following command:

git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-helloauthentication


### Configure the front end in the HelloAuthentication sample
1. In a terminal, navigate to the bms-samples-ios-helloauthentication/helloAuthentication directory where the project was cloned
3. Install Cocoapod client if not already installed `sudo gem install cocoapods`
4. Configure the Cocoapod repository if not already configured `pod setup`
3. Run the `pod install` command to download and install dependecies.
4. Open the Xcode workspace: `open helloAuthentication.xcworkspace`. From now on, open the xcworkspace file since it has the corret dependencies and configuration.
4. Open the AppDelegate and add the corresponding ApplicationRoute and
ApplicationID in the application didFinishLaunchingWithOptions method:


Objective C:

(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//initialize SDK with IBM Bluemix application ID and route
//TODO: Please Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
IMFClient *imfClient = [IMFClient sharedInstance];
[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			

return YES;
}


####Setup Facebook authentication

Update the `Info.plist` file with your Facebook App information:

- FacebookAppID: (For example `1581349575427190` , You can get App ID from Facebook developer console)
- FacebookDisplayName: (For example `helloAuth`  , You can get App name from Facebook developer console)

Update URL Types, Item 0, URL Schemes, update Item 0 as follows:

- URL Schemes: (for example `fb1581349575427190` , fb+Client ID from Facebook developer console)
[Learn more about using Facebook as an identity provider](https://www.ng.bluemix.net/docs/#services/mobileaccess/security/id_provs/index-gentopic2.html#usingfacebookauthentication)   

### Run the iOS App
Now you can run your iOS application in your mobile emulator or on your device.

You will see a single view application with a "PING BLUEMIX" button. When you click this button the application will test the connection from the client to a protected resource in the backend Bluemix application. Since this is a protected resource, the authentication process will begin. Login to the authenticaiton service (Facebook in this example).  The application will then display if the connection was successful or unsuccessful. In the unsuccessful state an error will be displayed in the log as well as in the application. 

Note: Inside the ViewController a Get request to the Node.js runtime on Bluemix. This code has been provided in the MobileFirst Services Starter boilerplate.


Note: This application has been built to run on the latest version of XCode (7.0) as well as the latest version of Swift (2.0). Also the application has updated to allow "NSAllowsArbitraryLoads" for NSAppTransportSecurity as a workaround for the Application Transport Security settings introduced in iOS 9. For more info please see the following blog:

[Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)

### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
