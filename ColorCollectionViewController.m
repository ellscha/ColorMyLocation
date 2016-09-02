    //
    //  ColorCollectionViewController.m
    //  ColorMyLocation
    //
    //  Created by Elli Scharlin on 8/31/16.
    //  Copyright © 2016 ElliBelly. All rights reserved.
    //

#import "ColorCollectionViewController.h"
#import "ColorDataStore.h"
#import "Color.h"
@interface ColorCollectionViewController ()
@property (retain, readwrite) ColorDataStore *dataStore;
@end

@implementation ColorCollectionViewController

static NSString * const reuseIdentifierForCell = @"cell";
static NSString * const reuseIdentifierForZero = @"emptyArray";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.dataStore = [ColorDataStore sharedInstance];
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
//    [self configure cells];
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = NO;
    ColorDataStore *dataStore = [ColorDataStore sharedInstance];
    self.colorsArray = dataStore.colorArray;
        // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifierForCell];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifierForZero];
    
    
        // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    
    return YES;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    [self reloadInputViews];
    if (self.dataStore.colorArray == nil || [self.dataStore.colorArray count] == 0){
        return 1;
    }
    else{
        NSLog([NSString stringWithFormat:@"%li *************************************", [self.colorsArray count]]);
    return [self.colorsArray count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.colorsArray count] == 0 || self.colorsArray == nil){
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForZero forIndexPath:indexPath];
        [cell setBounds:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        return cell;
    }else{
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierForCell forIndexPath:indexPath];
        cell.backgroundColor = [self.colorsArray[indexPath.row] derivedColor];
        cell.layer.cornerRadius = (cell.bounds.size.width)/2.0;
        NSLog(@"returning a cell");
            // Configure the cell
        return cell;
        
        
    }
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
