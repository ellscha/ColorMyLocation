//
//  ViewController.h
//  ColorMyLocation
//
//  Created by Elli Scharlin on 6/23/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FontAwesomeKit/FontAwesomeKit.h"



@import CoreLocation;

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;


@end

