//
//  BSButton.h
//  btnTest
//
//  Created by  on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
    BSButtonTypeDefault,
    BSButtonTypePrimary,
    BSButtonTypeInfo,
    BSButtonTypeSuccess,
    BSButtonTypeWarning,
    BSButtonTypeDanger,
    BSButtonTypeInverse,
    BSButtonTypeLink
}BSButtonType;

@interface BSButton : UIButton{
    CAGradientLayer *normalLayer, *touchInsideLayer;
    BSButtonType bsType;
}

- (id)initWithType:(BSButtonType)type;

@end
