//
//  AppDelegate.h
//  CedarTune
//
//  Created by Nick McCarty on 2/9/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "/Developer/usr/pd-for-ios/libpd/objc/PdAudioController.h"

@class ViewController;



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic, readonly) PdAudioController *audioController;


@end
