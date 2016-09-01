//
//  StoryBoardPageViewController.h
//  ColorMyLocation
//
//  Created by Elli Scharlin on 9/1/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryBoardPageViewController : UIPageViewController <UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *PageViewController;

-(UIPageViewController *)viewControllerAtIndex:(NSUInteger)index;

@end
