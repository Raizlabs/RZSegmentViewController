//
//  RZSegmentViewController.h
//
//  Created by Joe Goullaud on 11/5/12.
//  Copyright (c) 2012 Raizlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RZSegmentViewControllerDelegate <NSObject>
@optional
- (void)willSelectSegmentAtIndex:(NSUInteger)index currentIndex:(NSUInteger)currentIndex;
- (void)didSelectSegmentAtIndex:(NSUInteger)index;

@end

@interface RZSegmentViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *contentView;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentControl;

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning> animationTransitioning;
#endif

@property (nonatomic, copy) NSArray *viewControllers;

// Changing this will select the VC at that index
@property (nonatomic, assign) NSUInteger selectedIndex;


// whether child view-controllers are allowed to scroll underneath the segmented view
@property (nonatomic, assign) BOOL shouldSegmentedControlOverlapContentView; 

@property (weak) id <RZSegmentViewControllerDelegate> delegate;

- (IBAction)segmentControlValueChanged:(id)sender;
- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated;

@end
