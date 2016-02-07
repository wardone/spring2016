//
//  PhotoboxView.h
//  AugustaApp
//
//  Created by Jeremy Greenberger on 11/29/13.
//  Copyright (c) 2013 Jeremy Greenberger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"

@interface PhotoboxView : UIViewController<PhotoStackViewDataSource, PhotoStackViewDelegate>

@property (nonatomic, strong) PhotoStackView *photoStack;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic, retain) IBOutlet UILabel *notificationLabel;
- (IBAction) back:(id) sender;

@end