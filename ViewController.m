    //
    //  ViewController.m
    //  ColorMyLocation
    //
    //  Created by Elli Scharlin on 6/23/16.
    //  Copyright © 2016 ElliBelly. All rights reserved.
    //

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bottomRightIcon;
@property (weak, nonatomic) IBOutlet UILabel *bottomLeftIcon;
@property (weak, nonatomic) IBOutlet UILabel *topLeftIcon;
@property (weak, nonatomic) IBOutlet UILabel *topRightIcon;
@property (nonatomic) CGFloat altitude;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) UIColor *colorMyLocation;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *getTextLabel;
@property (nonatomic) CGFloat alphaProperty;
@property (nonatomic) CGFloat redProperty;
@property (nonatomic) CGFloat greenProperty;
@property (nonatomic) CGFloat blueProperty;
@property (nonatomic) NSUInteger tapCount;
@property (strong, nonatomic) NSArray *savedColors;


@end

@implementation ViewController {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tapCount = 1;
    self.alphaProperty = 1.0;
    locationManager = [[CLLocationManager alloc]init];
    geocoder = [[CLGeocoder alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
//    self.getTextLabel.text = @"Color My Location";
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    self.colorLabel.alpha = 1;
    self.altitudeLabel.alpha = 1;
    self.longitudeLabel.alpha = 1;
    self.latitudeLabel.alpha = 1;
    self.addressLabel.alpha = 1;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesDisplayGesture:)];
    [self.view addGestureRecognizer:tapGesture];
    
//        //shows the address
//    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(saveColor:)];
//    [self.view addGestureRecognizer:longPressGesture];
    
        //pinch for clear screen
        //    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(clearGesture:)];
        //    [self.view addGestureRecognizer:pinchGesture];
        //
        //        //pan for icons
        //    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(iconDisplay:)];
        //    [self.view addGestureRecognizer:panGesture];
        //
        //        //rotate to display the app name
        //    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(showNameGesture:)];
        //    [self.view addGestureRecognizer:rotateGesture];
        
        //FAKFontAwesome *twelve = [FAKFontAwesome starIconWithSize:15];
        //   self.bottomRightIcon.attributedText = [twelve attributedString];
        
        //    FAKFontAwesome *three = [FAKFontAwesome starIconWithSize:15];
        //    self.bottomLeftIcon.attributedText = [three attributedString];
        //
        //    FAKFontAwesome *six = [FAKFontAwesome starIconWithSize:15];
        //    self.topLeftIcon.attributedText = [six attributedString];
        //
        //    FAKFontAwesome *nine = [FAKFontAwesome starIconWithSize:15];
        //    self.topRightIcon.attributedText = [nine attributedString];
        //
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error");
}


//- (IBAction)saveColor:(UILongPressGestureRecognizer *)press {
//        //So that you can move your finger during the long press we use UIGestureRecognizerStateChanged rather than UIGestureRecognizerStateBegan.
//        //press.state == UIGestureRecognizerStateChanged
//    
//    if (press.state == UIGestureRecognizerStateBegan) {
//        self.addressLabel.hidden = NO;
//    }else if (self.addressLabel.hidden == NO && press.state != UIGestureRecognizerStateEnded){
//        self.addressLabel.hidden = YES;
//    }
//}
//- (IBAction)iconDisplay:(UIPanGestureRecognizer *)sender {
//    if (sender.state == UIGestureRecognizerStateBegan) {
//        
//        self.tapCount += 1;
//    }
//    if (self.tapCount % 2 == 0) {
//        self.topLeftIcon.hidden = NO;
//        self.topRightIcon.hidden = NO;
//        self.bottomLeftIcon.hidden = NO;
//        self.bottomRightIcon.hidden = NO;
//    }
//    else {
//        self.topLeftIcon.hidden = YES;
//        self.topRightIcon.hidden = YES;
//        self.bottomLeftIcon.hidden = YES;
//        self.bottomRightIcon.hidden = YES;
//        
//    }
//    
//}
    //- (IBAction)clearGesture:(UIPinchGestureRecognizer *)sender {
    ////    if (self.getTextLabel.hidden && sender.state == UIGestureRecognizerStateEnded){
    ////        NSLog(@"unhide MEEEE");
    ////        self.getTextLabel.hidden = NO;
    ////    }
    ////    else
    //    if (self.getTextLabel.hidden == NO && sender.state == UIGestureRecognizerStateEnded) {
    //        NSLog(@"hiden! FOOLED YA");
    //        self.getTextLabel.hidden = YES;
    ////        [self clearView];
    //
    //    }
    //}

- (IBAction)showNameGesture:(UIRotationGestureRecognizer *)sender {
    self.getTextLabel.hidden = NO;
}



- (IBAction)touchesDisplayGesture:(id)sender {
    if (self.colorLabel.alpha == 0) {
        
        [UIView animateWithDuration:0.75 animations:^{
            self.colorLabel.alpha = 1;
            self.altitudeLabel.alpha = 1;
            self.longitudeLabel.alpha = 1;
            self.latitudeLabel.alpha = 1;
            self.addressLabel.alpha = 1;
            
        }];
            //        self.getTextButton.titleLabel.text = @"Hide Location";
        
    }
    else {
        [UIView animateWithDuration:0.75 animations:^{
            self.colorLabel.alpha = 0;
            self.altitudeLabel.alpha = 0;
            self.longitudeLabel.alpha = 0;
            self.latitudeLabel.alpha = 0;
            self.addressLabel.alpha = 0;
        }];
            //        self.getTextButton.titleLabel.text = @"Display Location";
        
    }
}
    //
    //-(void)clearView{
    //    self.colorLabel.hidden = YES;
    //    self.altitudeLabel.hidden = YES;
    //    self.longitudeLabel.hidden = YES;
    //    self.latitudeLabel.hidden = YES;
    //    self.bottomLeftIcon.hidden = YES;
    //    self.bottomRightIcon.hidden = YES;
    //    self.topRightIcon.hidden = YES;
    //    self.topLeftIcon.hidden = YES;
    //    self.addressLabel.hidden = YES;
    //}
    //
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations lastObject];
    if (location != nil) {
        CGFloat inchesOfAlt = fabs(location.altitude * 39.37);
        
        if (inchesOfAlt <= 10) {
            self.altitude = inchesOfAlt/10;
        }
        else if (inchesOfAlt <= 100) {
            self.altitude = inchesOfAlt/100;
        }
        else if (inchesOfAlt > 100 && inchesOfAlt <= 1000) {
            self.altitude = inchesOfAlt/1000.000;
        }
        
        else if (inchesOfAlt > 1000 && inchesOfAlt <= 10000) {
            self.altitude = inchesOfAlt/10000;
        }
        else if (inchesOfAlt > 10000 && inchesOfAlt <= 100000) {
            self.altitude = inchesOfAlt/100000;
        }
        else if (inchesOfAlt > 100000 && inchesOfAlt <= 1000000) {
            self.altitude = inchesOfAlt/1000000;
        }
        
            // NSLog(@"COLOR INPUT ALTITUDE!!!!!!######## %f", self.altitude);
        
        if (location.coordinate.longitude <= 0) {
            self.longitude = (255.0 + location.coordinate.longitude)/255.000;
        }
        else if (fabs(location.coordinate.longitude) > 0) {
            self.longitude = (255.0 - location.coordinate.longitude)/255.000;
        }
            //        self.longitude = fabs(location.coordinate.longitude / 1.416)/255.000;
        
            //        self.longitude = (location.coordinate.longitude + 180)/360;
            //NSLog(@"COLOR INPUT longitude!!!!!!######## %f", self.longitude);
            //        self.latitude = fabs(location.coordinate.latitude / 2.83333)/255.000;
            //        self.latitude = (location.coordinate.latitude + 90)/180;
            //        if ((location.coordinate.latitude) <= 0) {
            //            self.latitude = (127.00 + location.coordinate.latitude)/127.00;
            //        }
            //
        
        self.latitude = fabs(location.coordinate.latitude)/100;
        
            // NSLog(@"COLOR INPUT latitude!!!!!!######## %f", self.latitude);
        
        self.latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %f%@", location.coordinate.latitude, @"\u00B0"];
        self.longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f%@", location.coordinate.longitude, @"\u00B0"];
        self.altitudeLabel.text = [NSString stringWithFormat:@"Altitude: %fm", location.altitude];
        
        
    }
    NSLog(@"Long: %@ ## \n Lat: %@ ## \n Alt: %@ m", self.longitudeLabel.text, self.latitudeLabel.text, self.altitudeLabel.text);
    self.greenProperty = self.latitude;
    self.blueProperty = self.longitude;
    self.redProperty = self.altitude;
    self.colorMyLocation = [UIColor colorWithRed:self.redProperty green:self.greenProperty blue:self.blueProperty alpha:self.alphaProperty];
    self.view.backgroundColor = self.colorMyLocation;
    
        //    self.colorLabel.text = [NSString stringWithFormat:@"%@", self.colorMyLocation];
    CGColorRef colorRef = [self.colorMyLocation CGColor];
    NSInteger countComponents = CGColorGetNumberOfComponents(colorRef);
    CGFloat redText;
    CGFloat greenText;
    CGFloat blueText;
    if (countComponents == 4) {
        CGFloat *components = CGColorGetComponents(colorRef);
        CGFloat red = components[0];
        CGFloat green = components[1];
        CGFloat blue   = components[2];
        CGFloat alpha = components[3];
        
        NSLog(@"Alpha is %f", alpha);
        
        self.colorLabel.text =[NSString stringWithFormat:@"R: %.4f\nG: %.4f\nB: %.4f",red,green,blue];
        redText = 1 - red;
        greenText = 1 - green;
        blueText = 1 - blue;
        UIColor *textColor = [UIColor colorWithRed:redText green:greenText blue:blueText alpha:self.alphaProperty];
        
        self.colorLabel.textColor = textColor;
        self.bottomRightIcon.textColor = textColor;
        self.altitudeLabel.textColor = textColor;
        self.longitudeLabel.textColor = textColor;
        self.latitudeLabel.textColor = textColor;
        self.addressLabel.textColor = textColor;
        
        self.getTextLabel.textColor = textColor;
            //self.stateLabel.textColor = textColor;
        
        
        NSLog(@"Resolving the Address");
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                placemark = [placemarks lastObject];
                    //self.stateLabel.text = [NSString stringWithFormat:@"Hope you are enjoying your day in the one and only beautiful %@!", placemark.locality];
                NSString *subThoroughfare = placemark.subThoroughfare;
                if (subThoroughfare == nil) {
                    subThoroughfare = @"";
                }
                NSString *thoroughfare = placemark.thoroughfare;
                if (thoroughfare == nil) {
                    thoroughfare = @"";
                }
                NSString *postalCode = placemark.postalCode;
                if (postalCode == nil) {
                    postalCode = @"";
                }
                NSString *locality =  placemark.locality;
                if (locality == nil) {
                    locality = @"";
                }
                NSString *administrativeArea = placemark.administrativeArea;
                if (administrativeArea == nil) {
                    administrativeArea = @"";
                }
                NSString *country = placemark.country;
                if (country == nil) {
                    country = @"";
                }
                if ([locality isEqualToString:administrativeArea] || ([administrativeArea isEqualToString:country])) {
                    administrativeArea = @"";
                    country = @"";
                }
                self.addressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                          subThoroughfare, thoroughfare,
                                          postalCode, locality,
                                          administrativeArea,
                                          country];
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        } ];
        
    }
}

-(BOOL)prefersStatusBarHidden{
    
    return YES;
}

@end
    //    CLLocation *currentLocation = [locations lastObject];


