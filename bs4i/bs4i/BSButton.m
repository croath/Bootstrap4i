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

- (id)initWithType:(BSButtonType)type
{
    self = [super init];
    if (self) {
        // Initialization code
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:5.0];
        [self.layer setBorderWidth:0.5];
        bsType = type;
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
    float red, green, blue, alpha;
    alpha = 1.0;
    switch (bsType) {
        case BSButtonTypePrimary:
        {
            red = 38.0 / 255.0;
            green = 103.0 / 255.0;
            blue = 178.0 / 255.0;
        }
            break;
        case BSButtonTypeInfo:
        {
            red = 90.0 / 255.0;
            green = 155.0 / 255.0;
            blue = 179.0 / 255.0;
        }
            break;
        case BSButtonTypeSuccess:
        {
            red = 105.0 / 255.0;
            green = 159.0 / 255.0;
            blue = 89.0 / 255.0;
        }
            break;
        case BSButtonTypeWarning:
        {
            red = 214.0 / 255.0;
            green = 151.0 / 255.0;
            blue = 74.0 / 255.0;
        }
            break;
        case BSButtonTypeDanger:
        {
            red = 181.0 / 255.0;
            green = 83.0 / 255.0;
            blue = 76.0 / 255.0;
        }
            break;
        case BSButtonTypeInverse:
        {
            red = 48.0 / 255.0;
            green = 48.0 / 255.0;
            blue = 48.0 / 255.0;
        }
            break;
        case BSButtonTypeLink:
        {
            red = green = blue = alpha = 0.0;
        }
            break;
        default:
        {
            red = 208.0 / 255.0;
            green = 208.0 / 255.0;
            blue = 208.0 / 255.0;
        }
            break;
    }
    [self.layer setBorderColor:[[UIColor colorWithRed:red green:green blue:blue alpha:alpha] CGColor]];
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
    [self initNormalLayer];
    [self initTouchInsideLayer];
    [self.layer insertSublayer:normalLayer above:0];
}

- (void)initNormalLayer{
    normalLayer = [[CAGradientLayer alloc] init];
    normalLayer.colors = [NSArray arrayWithObjects:
                          (id)[UIColor colorWithRed:57.0/255.0 green:136.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor, 
                          (id)[UIColor colorWithRed:17.0/255.0 green:83.0/255.0 blue:196.0/255.0 alpha:1.0].CGColor,
                          nil];
}

- (void)initTouchInsideLayer{
    touchInsideLayer = [[CAGradientLayer alloc] init];
    touchInsideLayer.colors = [NSArray arrayWithObjects:
                               (id)[UIColor colorWithRed:13.0/255.0 green:71.0/255.0 blue:169.0/255.0 alpha:1.0].CGColor, 
                               (id)[UIColor colorWithRed:17.0/255.0 green:83.0/255.0 blue:196.0/255.0 alpha:1.0].CGColor,
                               nil];
}

@end
