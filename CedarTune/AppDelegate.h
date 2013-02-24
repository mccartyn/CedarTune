//
//  AppDelegate.h
//  CedarTune
//
//  Created by Nick McCarty on 2/9/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdBase.h"

@class ViewController;
@class PdAudioController;
@class PdDispatcher;


@interface AppDelegate : UIResponder <UIApplicationDelegate, PdReceiverDelegate> {
    
    UIWindow *window;
    ViewController *viewController;
	PdAudioController *audioController;
    PdDispatcher *dispatcher;
}


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@end


