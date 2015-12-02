# iOS helloAuthentication application for IBM MobileFirst Services on IBM Bluemix
---
The helloAuthentication sample contains an Objective-C project that you can use to learn more about the Mobile Client Access service.  

Sections covered to use the helloPush sample for Objective-C:

1. [Downloading the helloAuthenciation sample](#downloading-the-helloauthentication-sample)
2. [Configuring the back end for your helloAuthentication application](#configuring-the-back-end-for-your-helloauthentication-application)
3. [Configuring the front end in the helloAuthentication sample](#configuring-the-front-end-in-the-helloauthentication-sample)
4. [Running the iOS app](#running-the-ios-app)

### Before you begin
Before you start, make sure you have:

- A [Bluemix](http://bluemix.net) account.

### Downloading the helloAuthentication sample
Clone the sample from Github with the following command:

git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-helloauthentication

### Configuring the back end for your HelloAuthentication application
Before you can run the helloAuthentication application, you must set up an app on Bluemix.  The following procedure shows you how to create a MobileFirst Services Starter application. A Node.js runtime environment is created so that you can provide server-side functions, such as resource URIs and static files. The Cloudant®NoSQL DB, IBM Push Notifications, and Mobile Client Access services are then added to the app.

Create a mobile backend in the  Bluemix dashboard:

1.	In the Boilerplates section of the Bluemix catalog, click MobileFirst Services Starter.
2.	Enter a name and host for your mobile backend and click Create.
3.	Click **Finish**.

Configure the Mobile Client Access service:

1.	In the Mobile Client Access dashboard, go to the Authentication tab to configure your authentication service.  
2.  Choose your authentication type (this sample has been configured for Facebook authentication).
3.  Enter the required configuration settings (APP ID for Facebook authentication).

**Note:** If you have not previously created a Facebook mobile application, please follow the instructions on how to [Register and Configure an App](https://developers.facebook.com/docs/apps/register#create-app).

### Configuring the front end in the HelloAuthentication sample
1. In a terminal, navigate to the **bms-samples-ios-helloauthentication** directory where the project was cloned
2. Navigate to the helloAuthentication folder
3. If the Cocoapod client is not installed, install it using the following command: `sudo gem install cocoapods`
4. If the Cocoapod repository is not configured, configure it using the following command: `pod setup`
5. Run the `pod install` command to download and install the required dependencies.
6. Open the Xcode workspace: `open helloAuthentication.xcworkspace`. From now on, open the xcworkspace file since it contains all the dependencies and configuration.
7. Open the **AppDelegate.m** and add the corresponding **ApplicationRoute** and
**ApplicationID** in the application **didFinishLaunchingWithOptions** method:


```objective-c
(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//initialize SDK with IBM Bluemix application ID and route
//TODO: Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
IMFClient *imfClient = [IMFClient sharedInstance];
[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			

return YES;
}
```

Setup Facebook authentication

Update the `Info.plist` file with your Facebook App information:

- FacebookAppID: (For example `1581349575427190` , You can get App ID from Facebook developer console)
- FacebookDisplayName: (For example `helloAuth`  , You can get App name from Facebook developer console)

Update URL Types, Item 0, URL Schemes, update Item 0 as follows:

- URL Schemes: (for example `fb1581349575427190` , fb+Client ID from Facebook developer console)
[Learn more about using Facebook as an identity provider](https://www.ng.bluemix.net/docs/#services/mobileaccess/security/id_provs/index-gentopic2.html#usingfacebookauthentication)   

### Running the iOS App
Now you can run the iOS application in your iOS emulator or on a physical device.

When you run the application, you will see a single view application with a **PING BLUEMIX** button. When you click this button the application will test a connection from the client to a protected resource in the backend Bluemix application. Since this is a protected resource, the authentication process will begin. Login to the authenticaiton service (Facebook in this example).  The application will then display if the connection was successful or unsuccessful. In the unsuccessful state an error will be displayed in the application as well as output to the Xcode console. 

**Note:** Inside the **ViewController** a GET request is made to a protected resource in the Node.js runtime on Bluemix. This code has been provided in the MobileFirst Services Starter boilerplate. The Node.js code provided in this boilerplate must be present in order for the sample to work as expected.


**Note:** This application runs on the latest version of XCode (7.0). You may also need to modify the application for Application Transport Security (ATS) changes made in iOS 9. For more info please see the following blog:

[Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/)


### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
