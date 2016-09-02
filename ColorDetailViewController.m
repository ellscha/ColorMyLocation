//
//  ColorDetailViewController.m
//  ColorMyLocation
//
//  Created by Elli Scharlin on 9/2/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import "ColorDetailViewController.h"

@interface ColorDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rgbLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitude;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

@end

@implementation ColorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Color* color = self.color;
    self.navigationController.navigationBar.barTintColor = [color derivedColor];
    [self.view setBackgroundColor:[color derivedColor]];
    self.rgbLabel.textColor = [color textColor];
    self.addressLabel.text = color.address;
    self.addressLabel.textColor = color.textColor;
    self.altitude.textColor = color.textColor;
    self.longitudeLabel.textColor = color.textColor;
    self.latitudeLabel.textColor = color.textColor;
    self.createdAtLabel.text = color.createdAt.description;
    self.createdAtLabel.textColor = color.textColor;
    
    self.rgbLabel.text = [NSString stringWithFormat:@"R: %.4f\nG: %.4f\nB: %.4f",color.red,color.green,color.blue];
    
    self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f", color.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f", color.longitude];
    self.latitudeLabel.text = [NSString stringWithFormat:@"Altitude: %f m", color.altitude];

    // Do any additional setup after loading the view.
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
