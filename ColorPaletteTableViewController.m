//
//  ColorPaletteTableViewController.m
//  ColorMyLocation
//
//  Created by Elli Scharlin on 9/2/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import "ColorPaletteTableViewController.h"
#import "ColorDataStore.h"
#import "Color.h"
#import "ColorDetailViewController.h"

@interface ColorPaletteTableViewController ()
@property (readwrite, retain) ColorDataStore *dataStore;
@property (nonatomic) NSUInteger selectedColor;
@end

@implementation ColorPaletteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.dataStore = [ColorDataStore sharedInstance];
    self.colorsArray = self.dataStore.colorArray;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.colorsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"colorID" forIndexPath:indexPath];
    Color *cellColor = self.colorsArray[indexPath.row];
//    NSString *location = [NSString stringWithFormat:@"lat: %d, long: %d, alt: %d m", cellColor.latitude, cellColor.longitude, cellColor.altitude];
    UIColor *textColor = [cellColor textColor];
    UIColor *colorBackground = [cellColor derivedColor];
    [cell setBackgroundColor:colorBackground];
//    cell.detailTextLabel.text = address;
    cell.textLabel.text = [NSString stringWithFormat:@"R: %.4f | G: %.4f | B: %.4f",cellColor.red,cellColor.green,cellColor.blue];
    cell.textLabel.textColor = textColor;
//    cell.detailTextLabel.textColor = textColor;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



// In a storyboard-based application, you will often want to do a little preparation before navigation
g

@end
