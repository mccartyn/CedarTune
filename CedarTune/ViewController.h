//
//  ViewController.h
//  CedarTune
//
//  Created by Nick McCarty on 2/9/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "/Developer/usr/pd-for-ios/libpd/objc/PdDispatcher.h"



@interface ViewController : UIViewController {
    PdDispatcher *dispatcher;
    void *patch;
}

-(IBAction)playE:(id)sender;
-(IBAction)playA:(id)sender;
-(IBAction)playD:(id)sender;
-(IBAction)playG:(id)sender;
-(IBAction)playB:(id)sender;
-(IBAction)playE2:(id)sender;


@end
