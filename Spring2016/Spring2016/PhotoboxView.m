//
//  PhotoboxView.m
//  AugustaApp
//
//  Created by Jeremy Greenberger on 11/29/13.
//  Copyright (c) 2013 Jeremy Greenberger. All rights reserved.
//

#import "PhotoboxView.h"


@interface PhotoboxView ()
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *imageName;
@property (nonatomic, strong) NSArray *imageDescription;

-(void)setup;

@end

@implementation PhotoboxView

@synthesize notificationLabel;
@synthesize pageControl = _pageControl;
//@synthesize photoStack = _photoStack,
int picNumber;

#pragma mark -
#pragma mark Getters

-(NSArray *)photos {
    if(!_photos) {
        _photos = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"32922c8664ec42e49ada6d8680f41397.jpg"],
                   [UIImage imageNamed:@"CagPtIrVAAAWUUE.jpg"],
                   nil];
        
        
//        _imageName = [NSArray arrayWithObjects:nil];
//        _imageDescription = [NSArray arrayWithObjects:nil];
//        _photos = [NSArray arrayWithObjects:nil];
        
    }
    return _photos;
}

-(PhotoStackView *)photoStack {
    if(!_photoStack) {
        _photoStack = [[PhotoStackView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _photoStack.center = CGPointMake(self.view.center.x, 270);
        _photoStack.dataSource = self;
        _photoStack.delegate = self;
    }
    
    return _photoStack;
}



#pragma mark -
#pragma mark Deck DataSource Protocol Methods

-(NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack {
    return [self.photos count];
}

-(UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index {
    return [self.photos objectAtIndex:index];
}



#pragma mark -
#pragma mark Deck Delegate Protocol Methods

-(void)photoStackView:(PhotoStackView *)photoStackView willStartMovingPhotoAtIndex:(NSUInteger)index {
    // User started moving a photo
}

-(void)photoStackView:(PhotoStackView *)photoStackView willFlickAwayPhotoFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    // User flicked the photo away, revealing the next one in the stack
}

-(void)photoStackView:(PhotoStackView *)photoStackView didRevealPhotoAtIndex:(NSUInteger)index {
    self.pageControl.currentPage = index;
}

-(void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index {
    NSLog(@"selected %lu", (unsigned long)index);
//    picNumber = (int)index;
}


#pragma mark -
#pragma mark Setup

-(void)setup {
    [self.view addSubview:self.photoStack];
    self.pageControl.numberOfPages = [self.photos count];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)viewDidUnload {
    [self setPageControl:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end