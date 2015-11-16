//
//  ViewController.h
//  helloAuthentication
//
//  Created by Joshua Alger on 11/16/15.
//  Copyright © 2015 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UIButton *pingButton;
@property (weak, nonatomic) IBOutlet UITextView *errorTextView;

@end

