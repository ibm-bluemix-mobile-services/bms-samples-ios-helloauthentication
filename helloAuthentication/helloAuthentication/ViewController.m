//
//  ViewController.m
//  helloAuthentication
//
//  Created by Joshua Alger on 11/16/15.
//  Copyright © 2015 IBM. All rights reserved.
//

#import "ViewController.h"
#import <IMFCore/IMFCore.h>
#import <FacebookSDK/FacebookSDK.h>
#import <IMFFacebookAuthentication/IMFFacebookAuthenticationHandler.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testBluemixConnection:(id)sender{
    
    ///Testing the connection to Bluemix by sending a request to a protected resources on the Node.js application. This Node.js piece was provided in the MobileFirst Services Starter boilerplate. The below request uses the applicationRoute that was provided when initializing the IMFClient in the AppDelegate.
    IMFClient *imfClient = [IMFClient sharedInstance];
    NSString *backendURL = [NSString stringWithFormat:@"%@/protected",imfClient.backendRoute];
    [[IMFFacebookAuthenticationHandler sharedInstance] registerWithDefaultDelegate];

    IMFResourceRequest* request = [IMFResourceRequest requestWithPath:backendURL];
    [request setHTTPMethod:@"GET"];
    [request sendWithCompletionHandler:^(IMFResponse *response, NSError *error) {
        
        if (error != nil) {
            NSLog(@"%@",error);
            _topLabel.text = @"Bummer";
            _bottomLabel.text = @"Something Went Wrong";
            if (error.localizedDescription!=nil){
                NSString *errorMsg =  [NSString stringWithFormat: @"%@ Please verify the ApplicationRoute and ApplicationID.", error.localizedDescription];
                _errorTextView.text = errorMsg;
            }
            
        } else {
            NSLog(@"You have connected to Bluemix successfully");
            _topLabel.text = @"Yay!";
            _bottomLabel.text = @"You Are Connected";
            _errorTextView.text = @"";
            
        }
    }];
}

@end
