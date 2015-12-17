# iOS helloAuthentication Sample Application for Bluemix Mobile Services

The helloAuthentication sample contains an Objective-C project that you can use to learn more about the Mobile Client Access service.  

Use the following steps to configure the helloAuthentication sample for Objective-C:

1. [Download the helloAuthentication sample](#download-the-helloauthentication-sample)
2. [Configure the mobile backend for your helloAuthentication application](#configure-the-mobile-backend-for-your-helloauthentication-application)
3. [Configure the front end in the helloAuthentication sample](#configure-the-front-end-in-the-helloauthentication-sample)
4. [Run the iOS app](#run-the-ios-app)

### Before you begin
Before you start, make sure you have:

- A [Bluemix](http://bluemix.net) account.

### Download the helloAuthentication sample
Clone the sample from Github with the following command:

`git clone https://github.com/ibm-bluemix-mobile-services/bms-samples-ios-helloauthentication``

### Configure the mobile backend for your helloAuthentication application
Before you can run the helloAuthentication application, you must set up an app on Bluemix.  The following procedure shows you how to create a MobileFirst Services Starter application. A Node.js runtime environment is created so that you can provide server-side functions, such as resource URIs and static files. The Cloudant® NoSQL DB, IBM Push Notifications, and Mobile Client Access services are then added to the app.

#### Create a mobile backend in the Bluemix dashboard:

1.	In the **Boilerplates** section of the Bluemix catalog, click **MobileFirst Services Starter**.
2.	Enter a name and host for your mobile backend and click **Create**.
3.	Click **Finish**.
4. Get information about your app. <br/> After the provisioning process is complete, you will see a a page for your newly provisioned mobile backend. Click the **Mobile Options** link in top right part of a screen to find your *appRoute* and *appGUID*. Keep this screen open in your browser; you will need these parameters in the next steps.

#### Configure the Mobile Client Access service

1.	In the Mobile Client Access dashboard, go to the **Authentication** tab to configure your authentication service.  
2.  Choose your authentication type (this sample has been configured for Facebook authentication).
3.  Enter the required configuration settings (APP ID for Facebook authentication).

>**Note:** If you have not previously created a Facebook mobile application, follow the instructions on how to [Register and Configure an App](https://developers.facebook.com/docs/apps/register#create-app).

### Configure the front end in the helloAuthentication sample
1. In a terminal, navigate to the `bms-samples-ios-helloauthentication` directory where the project was cloned.
2. Navigate to the `helloAuthentication` folder.
3. If the CocoaPods dependency manager is not installed, install it with the following command:
`sudo gem install cocoapods`
4. If the CocoaPods repository is not configured, run the following command: `pod setup`
5. Run the `pod install` command to download and install the required dependencies.
6. Open the Xcode workspace: `open helloAuthentication.xcworkspace`. From now on, open the `.xcworkspace` file, because it contains all the dependencies and configuration.
7. Open the `AppDelegate.m` file. Add the corresponding **ApplicationRoute** and
**ApplicationID** in the application `didFinishLaunchingWithOptions` method:

```objective-c
(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//initialize SDK with IBM Bluemix application ID and route
//TODO: Enter a valid ApplicationRoute for initializaWithBacken Route and a valid ApplicationId for backenGUID
IMFClient *imfClient = [IMFClient sharedInstance];
[imfClient initializeWithBackendRoute:@"<APPLICATION_ROUTE>" backendGUID:@"<APPLICATION_ID>"];			

return YES;
}
```

### Set up Facebook authentication
Update the `Info.plist` file with your Facebook App information:

- **FacebookAppID** (For example `1581349575427190`): You can get the App ID from the Facebook developer console.
- **FacebookDisplayName** (For example `helloAuth`): You can get App name from Facebook developer console.

Update URL Types, Item 0, URL Schemes, update Item 0 as follows:

- **URL Schemes**: (for example `fb1581349575427190` , fb+Client ID from Facebook developer console)
[Learn more about using Facebook as an identity provider](https://www.ng.bluemix.net/docs/#docs/services/mobileaccess/security/facebook/index.html)   

### Run the iOS app
Now you can run the iOS application in your iOS emulator or on a physical device.

When you run the application, you will see a single view application with a **PING BLUEMIX** button. When you click this button the application tests a connection from the client to a protected resource in the backend Bluemix application. Because this is a protected resource, the authentication process will begin. Log in to the authentication service (Facebook in this example).  The application will then display if the connection was successful or unsuccessful. In the unsuccessful state, an error is displayed in the application and the output to the Xcode console.

>**Note:** Inside the **ViewController**, a GET request is made to a protected resource in the Node.js runtime on Bluemix. This code has been provided in the MobileFirst Services Starter boilerplate. The Node.js code provided in this boilerplate must be present in order for the sample to work as expected.


**Note:** This application runs on the latest version of XCode (V7.0). You might need to modify the application for Application Transport Security (ATS) changes made in iOS 9. For more information, see the following blog entry: [Connect Your iOS 9 App to Bluemix](https://developer.ibm.com/bluemix/2015/09/16/connect-your-ios-9-app-to-bluemix/).


### License
This package contains sample code provided in source code form. The samples are licensed under the under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 and may also view the license in the license.txt file within this package. Also see the notices.txt file within this package for additional notices.
