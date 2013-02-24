//
//  ViewController.m
//  CedarTune
//
//  Created by Nick McCarty on 2/9/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (strong, atomic) IBOutlet PitchView *pitchView;
@property (nonatomic, retain) PdDispatcher *dispatcher;

@end

@implementation ViewController

@synthesize pitchView;
@synthesize dispatcher;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    pitchView.centerPitch  = @64;
    pitchView.currentPitch = @0;
    
    //Add one for the fiddle component in our tuner patch.
    dispatcher = [[PdDispatcher alloc] init];
    [PdBase setDelegate:dispatcher];
    [dispatcher addListener:self forSource:@"fiddleOut"];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button callbacks


-(void)playNote:(int)n {
    [PdBase sendFloat:n toReceiver:@"midinote"];
    [PdBase sendBangToReceiver:@"trigger"];
}

-(void)playE:(id)sender {
    NSLog(@"Playing E");
    [self playNote:40];
}

-(void)playA:(id)sender {
    NSLog(@"Playing A");
    [self playNote:45];
}

-(void)playD:(id)sender {
    NSLog(@"Playing D");
    [self playNote:50];
}

-(void)playG:(id)sender {
    NSLog(@"Playing G");
    [self playNote:55];
}

-(void)playB:(id)sender {
    NSLog(@"Playing B");
    [self playNote:59];
}

-(void)playE2:(id)sender {
    NSLog(@"Playing E2");
    [self playNote:64];
}

#pragma pitchView 


-(void)receiveList:(NSArray *)list fromSource:(NSString *)source{
    pitchView.currentPitch = [list objectAtIndex:2];
    /*Check the amplitude to be between some threshold and set the center pitch.
     essentially we are trying to capture the center pitch as the most prominent first heard note and keep it like that until a new louder note is sounded*/
    NSLog(@"Current amplitude = %@",[list objectAtIndex:3]);
    if([list objectAtIndex:3] > [NSNumber numberWithFloat:80.0])
    {
        [self.pitchView calculateCenterPitch];
    }
    [self.pitchView setNeedsDisplay];
}



@end
