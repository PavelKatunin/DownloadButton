//
//  UIButton+PKDownloadButton.m
//  Download
//
//  Created by Pavel on 01/06/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "UIButton+PKDownloadButton.h"
#import "UIImage+PKDownloadButton.h"
#import "UIColor+PKDownloadButton.h"

@implementation UIButton (PKDownloadButton)

- (void)configureDefaultAppearance {
    UIImage *backImage = [UIImage buttonBackgroundWithColor:[UIColor defaultDwonloadButtonBlueColor]];
    [self setBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f)]
                    forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage highlitedButtonBackgroundWithColor:[UIColor defaultDwonloadButtonBlueColor]]
                    forState:UIControlStateHighlighted];
}

- (void)cleanDefaultAppearance {
    [self setBackgroundImage:nil forState:UIControlStateNormal];
    [self setBackgroundImage:nil forState:UIControlStateHighlighted];
    [self setAttributedTitle:nil forState:UIControlStateNormal];
    [self setAttributedTitle:nil forState:UIControlStateHighlighted];
}

@end
