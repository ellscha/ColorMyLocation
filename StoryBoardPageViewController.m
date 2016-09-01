    //
    //  StoryBoardPageViewController.m
    //  ColorMyLocation
    //
    //  Created by Elli Scharlin on 9/1/16.
    //  Copyright © 2016 ElliBelly. All rights reserved.
    //

#import "StoryBoardPageViewController.h"
#import "ViewController.h"
#import "ColorCollectionViewController.h"

@interface StoryBoardPageViewController () <UIPageViewControllerDelegate> <UIPageViewControllerDataSource>;
@property (nonatomic) NSUInteger pageIndex;
@property (retain) NSMutableArray *viewControllerArray;
@end

@implementation StoryBoardPageViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
}
-(void)loadView{
    [self setDelegate:self];
    [self setDataSource:self];
    UIViewController *colorPaletteVC = [self.storyboard instantiateViewControllerWithIdentifier:@"palette"];
    UIViewController *colorMyLocationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"color"];
    
    [self.viewControllerArray addObject:colorMyLocationVC];
    [self.viewControllerArray addObject:colorPaletteVC];
    [self setViewControllers:self.viewControllerArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self.storyboard instantiateInitialViewController];

//    [self setViewControllerArray:self.viewControllerArray];
 
    
}

- (UIPageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.viewControllerArray count] == 0) || (index >= [self.viewControllerArray count])) {
        return nil;
    }
        // Create a new view controller and pass suitable data.
    StoryBoardPageViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"palette"];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if ([viewController.restorationIdentifier isEqualToString:@"color"]){
        UIViewController *palette = [[UIViewController alloc]init];
        palette.restorationIdentifier = @"palette";
        return palette;
    }
    else{
        UIViewController *color = [[UIViewController alloc]init];
        color.restorationIdentifier = @"color";
        return color;
    }
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    if ([viewController.restorationIdentifier isEqualToString:@"color"]){
        UIViewController *palette = [[UIViewController alloc]init];
        palette.restorationIdentifier = @"palette";
        return palette;
    }
    else{
        UIViewController *color = [[UIViewController alloc]init];
        color.restorationIdentifier = @"color";
        return color;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
