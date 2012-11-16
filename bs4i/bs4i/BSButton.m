//
//  BSButton.m
//  btnTest
//
//  Created by  on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
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
    [self.layer setBorderWidth:1.0f];
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
    
    float redUp, greenUp, blueUp, alphaUp, redDown, greenDown, blueDown, alphaDown;
    alphaUp = alphaDown = 1.0;
    switch (bsType) {
        case BSButtonTypePrimary:
        {
            redUp = 56.0 / 255.0;
            greenUp = 135.0 / 255.0;
            blueUp = 198.0 / 255.0;
            
            redDown = 17.0 / 255.0;
            greenDown = 83.0 / 255.0;
            blueDown = 196.0 / 255.0;
        }
            break;
        case BSButtonTypeInfo:
        {
            redUp = 116.0 / 255.0;
            greenUp = 189.0 / 255.0;
            blueUp = 215.0 / 255.0;
            
            redDown = 79.0 / 255.0;
            greenDown = 149.0 / 255.0;
            blueDown = 176.0 / 255.0;
        }
            break;
        case BSButtonTypeSuccess:
        {
            redUp = 124.0 / 255.0;
            greenUp = 188.0 / 255.0;
            blueUp = 105.0 / 255.0;
            
            redDown = 104.0 / 255.0;
            greenDown = 157.0 / 255.0;
            blueDown = 88.0 / 255.0;
        }
            break;
        case BSButtonTypeWarning:
        {
            redUp = 240.0 / 255.0;
            greenUp = 180.0 / 255.0;
            blueUp = 100.0 / 255.0;
            
            redDown = 234.0 / 255.0;
            greenDown = 151.0 / 255.0;
            blueDown = 65.0 / 255.0;
        }
            break;
        case BSButtonTypeDanger:
        {
            redUp = 219.0 / 255.0;
            greenUp = 106.0 / 255.0;
            blueUp = 100.0 / 255.0;
            
            redDown = 174.0 / 255.0;
            greenDown = 69.0 / 255.0;
            blueDown = 61.0 / 255.0;
        }
            break;
        case BSButtonTypeInverse:
        {
            redUp = 67.0 / 255.0;
            greenUp = 67.0 / 255.0;
            blueUp = 67.0 / 255.0;
            
            redDown = 34.0 / 255.0;
            greenDown = 34.0 / 255.0;
            blueDown = 34.0 / 255.0;
        }
            break;
        case BSButtonTypeLink:
        {
            redUp = greenUp = blueUp = alphaUp = redDown = greenDown = blueDown = alphaDown = 0.0;
        }
            break;
        default:
        {
            redUp = 254.0 / 255.0;
            greenUp = 254.0 / 255.0;
            blueUp = 254.0 / 255.0;
            
            redDown = 230.0 / 255.0;
            greenDown = 230.0 / 255.0;
            blueDown = 230.0 / 255.0;
        }
            break;
    }

    
    normalLayer.colors = [NSArray arrayWithObjects:
                          (id)[UIColor colorWithRed:redUp green:greenUp blue:blueUp alpha:alphaUp].CGColor, 
                          (id)[UIColor colorWithRed:redDown green:greenDown blue:blueDown alpha:alphaDown].CGColor,
                          nil];
}

- (void)initTouchInsideLayer{
    touchInsideLayer = [[CAGradientLayer alloc] init];
    
    float redUp, greenUp, blueUp, alphaUp, redDown, greenDown, blueDown, alphaDown;
    alphaUp = alphaDown = 1.0;
    switch (bsType) {
        case BSButtonTypePrimary:
        {
            redUp = 13.0 / 255.0;
            greenUp = 71.0 / 255.0;
            blueUp = 169.0 / 255.0;
            
            redDown = 16.0 / 255.0;
            greenDown = 82.0 / 255.0;
            blueDown = 195.0 / 255.0;
        }
            break;
        case BSButtonTypeInfo:
        {
            redUp = 68.0 / 255.0;
            greenUp = 129.0 / 255.0;
            blueUp = 152.0 / 255.0;
            
            redDown = 78.0 / 255.0;
            greenDown = 148.0 / 255.0;
            blueDown = 175.0 / 255.0;
        }
            break;
        case BSButtonTypeSuccess:
        {
            redUp = 89.0 / 255.0;
            greenUp = 136.0 / 255.0;
            blueUp = 76.0 / 255.0;
            
            redDown = 103.0 / 255.0;
            greenDown = 156.0 / 255.0;
            blueDown = 87.0 / 255.0;
        }
            break;
        case BSButtonTypeWarning:
        {
            redUp = 203.0 / 255.0;
            greenUp = 131.0 / 255.0;
            blueUp = 55.0 / 255.0;
            
            redDown = 233.0 / 255.0;
            greenDown = 150.0 / 255.0;
            blueDown = 64.0 / 255.0;
        }
            break;
        case BSButtonTypeDanger:
        {
            redUp = 150.0 / 255.0;
            greenUp = 59.0 / 255.0;
            blueUp = 52.0 / 255.0;
            
            redDown = 173.0 / 255.0;
            greenDown = 68.0 / 255.0;
            blueDown = 60.0 / 255.0;
        }
            break;
        case BSButtonTypeInverse:
        {
            redUp = 29.0 / 255.0;
            greenUp = 29.0 / 255.0;
            blueUp = 29.0 / 255.0;
            
            redDown = 33.0 / 255.0;
            greenDown = 33.0 / 255.0;
            blueDown = 33.0 / 255.0;
        }
            break;
        case BSButtonTypeLink:
        {
            redUp = greenUp = blueUp = alphaUp = redDown = greenDown = blueDown = alphaDown = 0.0;
        }
            break;
        default:
        {
            redUp = 199.0 / 255.0;
            greenUp = 199.0 / 255.0;
            blueUp = 199.0 / 255.0;
            
            redDown = 229.0 / 255.0;
            greenDown = 229.0 / 255.0;
            blueDown = 229.0 / 255.0;
        }
            break;
    }
    
    touchInsideLayer.colors = [NSArray arrayWithObjects:
                               (id)[UIColor colorWithRed:redUp green:greenUp blue:blueUp alpha:alphaUp].CGColor, 
                               (id)[UIColor colorWithRed:redDown green:greenDown blue:blueDown alpha:alphaDown].CGColor,
                               nil];
}

@end
