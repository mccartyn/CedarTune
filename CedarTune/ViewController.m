//
//  ViewController.m
//  CedarTune
//
//  Created by Nick McCarty on 2/9/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    dispatcher = [[PdDispatcher alloc] init];
    [PdBase setDelegate:dispatcher];
    patch = [PdBase openFile:@"tuner.pd" path:[[NSBundle mainBundle] resourcePath]];
    
    UIImage *image = [UIImage imageNamed:@"fender_strat.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.frame;
    [self.view addSubview:imageView];
    [self.view sendSubviewToBack:imageView];
    
    if(!patch){
        NSLog(@"Failed to open patch");
        //Gracefully handle failure TBD
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button callbacks

-(void)playNote:(int)n {
    [PdBase sendFloat:n toReceiver:@"midiNote"];
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

@end
