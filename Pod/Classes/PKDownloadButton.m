//
//  PKDownloadButton.m
//  PKDownloadButton
//
//  Created by Pavel on 28/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "PKDownloadButton.h"
#import "PKMacros.h"
#import "NSLayoutConstraint+PKDownloadButton.h"
#import "UIImage+PKDownloadButton.h"
#import "UIColor+PKDownloadButton.h"
#import "PKPendingView.h"
#import "UIButton+PKDownloadButton.h"

static NSDictionary *DefaultTitleAttributes() {
    return @{ NSForegroundColorAttributeName : [UIColor defaultDwonloadButtonBlueColor],
              NSFontAttributeName : [UIFont systemFontOfSize:14.f]};
}

static NSDictionary *HighlitedTitleAttributes() {
    return @{ NSForegroundColorAttributeName : [UIColor whiteColor],
              NSFontAttributeName : [UIFont systemFontOfSize:14.f]};
}

@interface PKDownloadButton ()

@property (nonatomic, weak) UIButton *startDownloadButton;
@property (nonatomic, weak) PKStopDownloadButton *stopDownloadButton;
@property (nonatomic, weak) UIButton *downloadedButton;
@property (nonatomic, weak) PKPendingView *pendingView;

@property (nonatomic, strong) NSMutableArray *stateViews;

- (UIButton *)createStartDownloadButton;
- (PKStopDownloadButton *)createStopDownloadButton;
- (UIButton *)createDownloadedButton;
- (PKPendingView *)createPendingView;

- (void)currentButtonTapped:(id)sender;

- (void)createSubviews;
- (NSArray *)createConstraints;

@end

static PKDownloadButton *CommonInit(PKDownloadButton *self) {
    if (self != nil) {
        [self createSubviews];
        [self addConstraints:[self createConstraints]];
        
        self.state = kPKDownloadButtonState_StartDownload;
    }
    return self;
}

@implementation PKDownloadButton

#pragma mark - Properties

- (void)setState:(PKDownloadButtonState)state {
    _state = state;
    
    [self.stateViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SafeObjClassCast(UIView, view, obj);
        view.hidden = YES;
    }];
    
    switch (state) {
        case kPKDownloadButtonState_StartDownload:
            self.startDownloadButton.hidden = NO;
            break;
        case kPKDownloadButtonState_Pending:
            self.pendingView.hidden = NO;
            break;
        case kPKDownloadButtonState_Downloading:
            self.stopDownloadButton.hidden = NO;
            self.stopDownloadButton.progress = 0.f;
            break;
        case kPKDownloadButtonState_Downloaded:
            self.downloadedButton.hidden = NO;
            break;
        default:
            NSAssert(NO, @"unsupported state");
            break;
    }
}

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)decoder {
    return CommonInit([super initWithCoder:decoder]);
}

- (instancetype)initWithFrame:(CGRect)frame {
    return CommonInit([super initWithFrame:frame]);
}

#pragma mark - private methods

- (UIButton *)createStartDownloadButton {
    UIButton *startDownloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [startDownloadButton configureDefaultAppearance];
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"DOWNLOAD" attributes:DefaultTitleAttributes()];
    [startDownloadButton setAttributedTitle:title forState:UIControlStateNormal];
    NSAttributedString *highlitedTitle = [[NSAttributedString alloc] initWithString:@"DOWNLOAD" attributes:HighlitedTitleAttributes()];
    [startDownloadButton setAttributedTitle:highlitedTitle forState:UIControlStateHighlighted];
    
    [startDownloadButton addTarget:self
                            action:@selector(currentButtonTapped:)
                  forControlEvents:UIControlEventTouchUpInside];
    return startDownloadButton;
}

- (PKStopDownloadButton *)createStopDownloadButton {
    PKStopDownloadButton *stopDownloadButton = [[PKStopDownloadButton alloc] init];
    [stopDownloadButton.stopButton addTarget:self action:@selector(currentButtonTapped:)
                            forControlEvents:UIControlEventTouchUpInside];
    return stopDownloadButton;
}

- (UIButton *)createDownloadedButton {
    UIButton *downloadedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"REMOVE" attributes:DefaultTitleAttributes()];
    [downloadedButton setAttributedTitle:title forState:UIControlStateNormal];
    NSAttributedString *highlitedTitle = [[NSAttributedString alloc] initWithString:@"REMOVE" attributes:HighlitedTitleAttributes()];
    [downloadedButton setAttributedTitle:highlitedTitle forState:UIControlStateHighlighted];
    [downloadedButton configureDefaultAppearance];
    
    [downloadedButton addTarget:self
                         action:@selector(currentButtonTapped:)
               forControlEvents:UIControlEventTouchUpInside];
    return downloadedButton;
}

- (PKPendingView *)createPendingView {
    PKPendingView *pendingView = [[PKPendingView alloc] init];
    [pendingView addTarget:self action:@selector(currentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return pendingView;
}

- (void)currentButtonTapped:(id)sender {
    [self.delegate downloadButtonTapped:self currentState:self.state];
    BlockSafeRun(self.callback, self, self.state);
}

- (void)createSubviews {
    self.stateViews = (__bridge_transfer NSMutableArray *)CFArrayCreateMutable(nil, 0, nil);
    
    UIButton *startDownloadButton = [self createStartDownloadButton];
    startDownloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:startDownloadButton];
    self.startDownloadButton = startDownloadButton;
    [self.stateViews addObject:startDownloadButton];
    
    PKStopDownloadButton *stopDownloadButton = [self createStopDownloadButton];
    stopDownloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:stopDownloadButton];
    self.stopDownloadButton = stopDownloadButton;
    [self.stateViews addObject:stopDownloadButton];
    
    UIButton *downloadedButton = [self createDownloadedButton];
    downloadedButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:downloadedButton];
    self.downloadedButton = downloadedButton;
    [self.stateViews addObject:downloadedButton];
    
    PKPendingView *pendingView = [self createPendingView];
    pendingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:pendingView];
    self.pendingView = pendingView;
    [self.stateViews addObject:pendingView];
}

- (NSArray *)createConstraints {
    NSMutableArray *constraints = [NSMutableArray array];
    
    [self.stateViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SafeObjClassCast(UIView, view, obj);
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsForWrappedSubview:view
                                                                               withInsets:UIEdgeInsetsZero]];
    }];
    
    return constraints;
}

@end

