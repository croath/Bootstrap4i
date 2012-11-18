//
//  BSTextField.m
//  bs4i
//
//  Created by  on 12-11-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BSTextField.h"

@implementation BSTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBorderStyle:UITextBorderStyleRoundedRect];
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    if (self.editing) {
        [self.layer setBorderWidth:1.5];
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:5.0f];
        [self.layer setBorderColor:[UIColor colorWithRed:131.0/255.0 green:186.0/255.0 blue:233.0/255.0 alpha:1.0].CGColor];
    } else {
        [self.layer setBorderWidth:0.0];
        [self.layer setMasksToBounds:NO];
        [self.layer setCornerRadius:0.0f];
        [self.layer setBorderColor:[UIColor colorWithRed:131.0/255.0 green:186.0/255.0 blue:233.0/255.0 alpha:0.0].CGColor];
    }
}

@end
