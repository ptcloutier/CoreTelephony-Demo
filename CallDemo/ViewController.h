//
//  ViewController.h
//  CallDemo
//
//  Created by perrin cloutier on 11/15/16.
//  Copyright © 2016 ptcloutier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>

@interface ViewController : UIViewController

 @property (nonatomic, strong) NSString *myNumber;
- (IBAction)callButtonPressed:(id)sender;

 @end

