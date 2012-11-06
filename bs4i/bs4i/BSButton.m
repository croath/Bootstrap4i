//
//  BSButton.m
//  btnTest
//
//  Created by  on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BSButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation BSButton

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:5.0];
        [self.layer setBorderColor:[[UIColor colorWithRed:38.0/255.0 green:103.0/255.0 blue:178.0/255.0 alpha:1.0] CGColor]];
        [self.layer setBorderWidth:0.5];
        [self initLayers];
        [self setProperties];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    touchInsideLayer.frame = rect;
    normalLayer.frame = rect;
}

- (void)setProperties{
    [self addTarget:self action:@selector(pressed) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(moveOut) forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchDragExit)];
}

- (void)pressed{
    [self.layer insertSublayer:touchInsideLayer above:0];
    [normalLayer removeFromSuperlayer];
}

- (void)moveOut{
    [self.layer insertSublayer:normalLayer above:0];
    [touchInsideLayer removeFromSuperlayer];
}

- (void)initLayers{
    normalLayer = [[CAGradientLayer alloc] init];
    normalLayer.colors = [NSArray arrayWithObjects:
                          (id)[UIColor colorWithRed:57.0/255.0 green:136.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor, 
                          (id)[UIColor colorWithRed:17.0/255.0 green:83.0/255.0 blue:196.0/255.0 alpha:1.0].CGColor,
                          nil];
    
    touchInsideLayer = [[CAGradientLayer alloc] init];
    touchInsideLayer.colors = [NSArray arrayWithObjects:
                               (id)[UIColor colorWithRed:13.0/255.0 green:71.0/255.0 blue:169.0/255.0 alpha:1.0].CGColor, 
                               (id)[UIColor colorWithRed:17.0/255.0 green:83.0/255.0 blue:196.0/255.0 alpha:1.0].CGColor,
                               nil];
    
    [self.layer insertSublayer:normalLayer above:0];
}

@end
