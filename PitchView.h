//
//  PitchView.h
//  CedarTune
//
//  Created by Nick McCarty on 2/17/13.
//  Copyright (c) 2013 Nick McCarty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PitchView : UIView {
    
}

@property (nonatomic) NSNumber *centerPitch;
@property (nonatomic) NSNumber *currentPitch;

-(void)calculateCenterPitch;

@end

