//
//  PitchView.m
//  CedarTune
//
//  Created by Nick McCarty on 2/17/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import <math.h>
#import "PitchView.h"

@implementation PitchView

//synthesize our property containers
@synthesize centerPitch = _centerPitch;
@synthesize currentPitch = _currentPitch;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setCenterPitch:(NSNumber*)centerPitch {
    _centerPitch = centerPitch;
}

-(void)setCurrentPitch:(NSNumber*)currentPitch {
    _currentPitch = currentPitch;
    NSLog(@"currentPitch = %f",self.currentPitch.floatValue);
}


-(void)calculateCenterPitch {
    float tmp = 12.0;
    float fl_currentPitch = self.currentPitch.floatValue;
    tmp = floor(fl_currentPitch) / tmp;
    self.centerPitch = [NSNumber numberWithFloat:fl_currentPitch]; //does this create a NSNumber object for nothing?
    NSLog(@"CenterPitch = %f",self.centerPitch.floatValue);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    float halfWidth = self.frame.size.width/2;
    float height = self.frame.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 6.0);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextMoveToPoint(context, halfWidth, height);
    CGContextStrokePath(context);
    
    float dx = (self.currentPitch.floatValue - self.centerPitch.floatValue) / 2.0000;
    NSLog(@"dx = %f",dx);
    if(-1 < dx && dx < 1) //-1 and 1 bounds are because MIDI notes increase/decrease by 1 s
    {
        CGContextSetLineWidth(context, 2.0);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    } else {
        CGContextSetLineWidth(context, 2.0);
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        dx = (dx < 0) ? -1 : 1;
    }
      
    float phi = dx * M_PI_4;
    NSLog(@"phi = %f",phi);
    CGContextMoveToPoint(context, halfWidth, height);
    CGContextAddLineToPoint(context, halfWidth + sin(phi) * height * .9, height - cos(phi) * height * .9);
    CGContextStrokePath(context);
}

@end
