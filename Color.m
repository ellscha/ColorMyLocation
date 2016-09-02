//
//  Color.m
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/31/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import "Color.h"
#import <CoreLocation/CoreLocation.h>

@implementation Color

// Insert code here to add functionality to your managed object subclass

- (UIColor *)derivedColor {
    return [UIColor colorWithRed:self.red green:self.green blue:self.blue  alpha:self.alpha];
}
-(UIColor *)textColor {
    return [UIColor colorWithRed:(1-self.red) green:(1-self.green) blue:(1-self.blue) alpha:self.alpha];
}


@end
