//
//  UIButton+PKDownloadButton.m
//  Download
//
//  Created by Pavel on 01/06/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "UIButton+PKDownloadButton.h"
#import "UIImage+PKDownloadButton.h"

@implementation UIButton (PKDownloadButton)

- (void)configureDefaultAppearance {
    UIImage *backImage = [UIImage buttonBackgroundWithColor:[self tintColor]];
    [self setBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f)]
                    forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage highlitedButtonBackgroundWithColor:[self tintColor]]
                    forState:UIControlStateHighlighted];
}


- (void)tintColorDidChange {
	[self configureDefaultAppearance];
}

- (void)cleanDefaultAppearance {
    [self setBackgroundImage:nil forState:UIControlStateNormal];
    [self setBackgroundImage:nil forState:UIControlStateHighlighted];
    [self setAttributedTitle:nil forState:UIControlStateNormal];
    [self setAttributedTitle:nil forState:UIControlStateHighlighted];
}

@end
