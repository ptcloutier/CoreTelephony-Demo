//
//  ViewController.m
//  CallDemo
//
//  Created by perrin cloutier on 11/15/16.
//  Copyright © 2016 ptcloutier. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"

static void *CallStateContext = &CallStateContext;

@interface ViewController ()

@property (nonatomic) CTCallCenter *callCenter;
@property (nonatomic) CTCall *call;

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *myNumber = @"9176931910";
    self.myNumber = myNumber;
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CallStateDidChange:) name:@"CTCallStateDidChange" object:nil];

    self.callCenter = [[CTCallCenter alloc] init];
    
    self.callCenter.callEventHandler = ^(CTCall* call) {
        // announce that we've had a state change in our call center
        NSDictionary *dict = [NSDictionary dictionaryWithObject:call.callState forKey:@"callState"]; [[NSNotificationCenter defaultCenter] postNotificationName:@"CTCallStateDidChange" object:nil userInfo:dict];
    };
}


- (IBAction)callButtonPressed:(id)sender {
    
    NSURL* callUrl=[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", self.myNumber]];
    if([[UIApplication sharedApplication] canOpenURL:callUrl]) {
        [[UIApplication sharedApplication] openURL:callUrl];
        
    }
}


- (void)CallStateDidChange:(NSNotification *)notification {
//    NSLog(@"Notification : %@", notification);
    NSString *callInfo = [[notification userInfo] objectForKey:@"callState"];
    if([callInfo isEqualToString: CTCallStateDialing]) {
        //The call state, before connection is established, when the user initiates the call.
        NSLog(@"***** call is dialing *****");
    }
    if([callInfo isEqualToString: CTCallStateIncoming]) {
        //The call state, before connection is established, when a call is incoming but not yet answered by the user.
        NSLog(@"***** call is incoming *****");
    }
    if([callInfo isEqualToString: CTCallStateConnected]) {
        //The call state when the call is fully established for all parties involved.
        NSLog(@"***** call connected *****");
        
    }
    if([callInfo isEqualToString: CTCallStateDisconnected]) {
        //The call state Ended.
        NSLog(@"***** call ended *****");
    }
}


@end
