    //
    //  ViewController.m
    //  ColorMyLocation
    //
    //  Created by Elli Scharlin on 6/23/16.
    //  Copyright © 2016 ElliBelly. All rights reserved.
    //

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "ColorDataStore.h"
#import "Color.h"
#import "ColorCollectionViewController.h"

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
@property (strong, nonatomic) ColorDataStore *dataStore;
@property (strong, nonatomic) NSMutableArray *colorsArray;




@end

@implementation ViewController {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = self.colorMyLocation;
    self.dataStore = [ColorDataStore sharedInstance];
    self.colorsArray = self.dataStore.colorArray;
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
    self.navigationController.navigationBar.alpha = 1;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesDisplayGesture:)];
    [self.view addGestureRecognizer:tapGesture];
    
    
    NSManagedObjectContext *managedObjectContext = [[ColorDataStore sharedInstance]managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Color" inManagedObjectContext:managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createdAt" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
        // Fetch the records and handle an error
    NSError *error;
    self.colorsArray = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!self.colorsArray) {
            // This is a serious error
            // Handle accordingly
        NSLog(@"Failed to load colors from disk");
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error");
}

- (IBAction)addNewColorTapped:(id)sender {
    NSLog(@"Long Press Gesture Recognized");
    ColorDataStore *dataStore = [ColorDataStore sharedInstance];
    NSManagedObjectContext *managedObjectContext = dataStore.managedObjectContext;
    Color *newColor = (Color *)[NSEntityDescription insertNewObjectForEntityForName:@"Color" inManagedObjectContext:managedObjectContext];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"New Color"
                                                                   message:@"Would you like to add this color to your palette?"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {    [self.colorsArray addObject:newColor];
}];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancelled %lu", [self.colorsArray count]);
    }];
    
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    newColor.red = self.redProperty;
    newColor.green = self.greenProperty;
    newColor.blue = self.blueProperty;
    newColor.alpha = self.alphaProperty;
    newColor.longitude = self.longitude;
    newColor.latitude = self.latitude;
    newColor.altitude = self.altitude;
    newColor.address = self.addressLabel.text;
    newColor.createdAt = [[NSDate alloc]init];
    NSError *error;
    if (![managedObjectContext save:&error]) {
            // Something's gone seriously wrong
        NSLog(@"Error saving new color: %@", [error localizedDescription]);
    }

    

}


- (IBAction)touchesDisplayGesture:(id)sender {
    if (self.colorLabel.alpha == 0) {
        
        [UIView animateWithDuration:0.75 animations:^{
            self.colorLabel.alpha = 1;
            self.altitudeLabel.alpha = 1;
            self.longitudeLabel.alpha = 1;
            self.latitudeLabel.alpha = 1;
            self.addressLabel.alpha = 1;
            self.navigationController.navigationBar.alpha = 1;
            
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
            self.navigationController.navigationBar.alpha = 0;
        }];
            //        self.getTextButton.titleLabel.text = @"Display Location";
        
    }
}
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
        
        
        if (location.coordinate.longitude <= 0) {
            self.longitude = (255.0 + location.coordinate.longitude)/255.000;
        }
        else if (fabs(location.coordinate.longitude) > 0) {
            self.longitude = (255.0 - location.coordinate.longitude)/255.000;
        }
        
        self.latitude = fabs(location.coordinate.latitude)/100;
        
        
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
            //        [[UINavigationBar appearance]setTintColor:textColor];
        self.colorLabel.textColor = textColor;
        self.bottomRightIcon.textColor = textColor;
        self.altitudeLabel.textColor = textColor;
        self.longitudeLabel.textColor = textColor;
        self.latitudeLabel.textColor = textColor;
        self.addressLabel.textColor = textColor;
        
        self.getTextLabel.textColor = textColor;
        self.navigationController.navigationBar.tintColor = textColor;
        
        
        NSLog(@"Resolving the Address");
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                placemark = [placemarks lastObject];
                
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
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"collectionSegue"]){
        ColorCollectionViewController *destinationVC = [[ColorCollectionViewController alloc]init];
        destinationVC.colorsArray = self.dataStore.colorArray;
    }
}
@end


