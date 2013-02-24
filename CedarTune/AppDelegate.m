//
//  AppDelegate.m
//  CedarTune
//
//  Created by Nick McCarty on 2/9/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import "AppDelegate.h"
#import "PdAudioController.h"

@interface AppDelegate()
@property (nonatomic, retain) PdAudioController *audioController;
@property (nonatomic, retain) PdDispatcher *dispatcher;
@end

@implementation AppDelegate


@synthesize window;
@synthesize viewController;
@synthesize audioController;
@synthesize dispatcher;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.audioController = [[PdAudioController alloc] init];
    if([self.audioController configurePlaybackWithSampleRate:44100 numberChannels:2 inputEnabled:YES mixingEnabled:NO] != PdAudioOK){
        NSLog(@"failed to initialize audio components");
    }

    
    //We are using fiddle~ in our tuner.pd patch so we need to include the external
    //Fiddle~ code since it is not pard of libPD by default. (see Making Musical Apps, page 101)
    fiddle_tilde_setup();
    
    //Now we can open the patch, set up our listeners, and turn on the auido
    void *patch = [PdBase openFile:@"tuner.pd" path:[[NSBundle mainBundle] resourcePath]];
    NSLog(@"opened patch");
    
    if(!patch){
        NSLog(@"Failed to open patch");
        //Gracefully handle failure TBD
    }

    //You need to create a "listener" for each message.
    //self.spamListener = [[PdListener alloc] init];
    //[dispatcher addListener:spamListener forSource:@"spam"];

    //Add one for the fiddle component in our tuner patch.
    //self.fiddleListener = [[PdListener alloc] init];
    //[dispatcher addListener:fiddleListener forSource:@"fiddleOut"];
    
    NSLog(@"Set up Audio Components");
    [self.audioController setActive:YES];
	[self.audioController print];
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //self.window.rootViewController = self.viewController;
    //[self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end


