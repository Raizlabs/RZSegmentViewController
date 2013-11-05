//
//  RZAnimationTransition.m
//  RZSegmentViewController-Demo
//
//  Created by Alex Rouse on 11/5/13.
//  Copyright (c) 2013 Raizlabs. All rights reserved.
//

#import "RZAnimationTransition.h"


#define kRZSegAnimationTransitionTime   0.4f
#define kRZSegScaleAmount               0.3f
#define kRZSegXOffsetFactor             1.5f
#define kRZSegYOffsetFactor             0.25f


@implementation RZAnimationTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(kRZSegScaleAmount, kRZSegScaleAmount);
    CGAffineTransform oldTranslateTransform;
    CGAffineTransform newTranslateTransform;
    
    if (self.isLeft)
    {
        oldTranslateTransform = CGAffineTransformMakeTranslation(container.bounds.size.width*kRZSegXOffsetFactor, -container.bounds.size.height*kRZSegYOffsetFactor);
        newTranslateTransform = CGAffineTransformMakeTranslation(-container.bounds.size.width*kRZSegXOffsetFactor, -container.bounds.size.height*kRZSegYOffsetFactor);
    }
    else
    {
        oldTranslateTransform = CGAffineTransformMakeTranslation(-container.bounds.size.width*kRZSegXOffsetFactor, -container.bounds.size.height*kRZSegYOffsetFactor);
        newTranslateTransform = CGAffineTransformMakeTranslation(container.bounds.size.width*kRZSegXOffsetFactor, -container.bounds.size.height*kRZSegYOffsetFactor);
    }
    
    [container insertSubview:toViewController.view aboveSubview:fromViewController.view];
    toViewController.view.alpha = 0.1f;
    toViewController.view.transform = CGAffineTransformConcat(newTranslateTransform, scaleTransform);
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toViewController.view.transform = CGAffineTransformIdentity;
                         toViewController.view.alpha = 1.0f;
                         fromViewController.view.transform = CGAffineTransformConcat(oldTranslateTransform, scaleTransform);
                         fromViewController.view.alpha = 0.1f;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:finished];
                     }];
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return kRZSegAnimationTransitionTime;
}
@end
