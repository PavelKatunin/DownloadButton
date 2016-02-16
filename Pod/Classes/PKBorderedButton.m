//
//  PKBorderedButton.m
//  Pods
//
//  Created by Holden, Ryan on 2/7/16.
//
//

#import "PKBorderedButton.h"
#import "UIImage+PKDownloadButton.h"

@implementation PKBorderedButton

- (void)configureDefaultAppearance {
    UIImage *backImage = [UIImage buttonBackgroundWithColor:self.tintColor];
    [self setBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f)]
                    forState:UIControlStateNormal];
    
    [self setBackgroundImage:[UIImage highlitedButtonBackgroundWithColor:self.tintColor]
                    forState:UIControlStateHighlighted];
}


- (void)tintColorDidChange {
    [super tintColorDidChange];
    [self configureDefaultAppearance];
}

- (void)cleanDefaultAppearance {
    [self setBackgroundImage:nil forState:UIControlStateNormal];
    [self setBackgroundImage:nil forState:UIControlStateHighlighted];
    [self setAttributedTitle:nil forState:UIControlStateNormal];
    [self setAttributedTitle:nil forState:UIControlStateHighlighted];
}

@end
