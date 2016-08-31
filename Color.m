//
//  Color.m
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/31/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import "Color.h"

@implementation Color

// Insert code here to add functionality to your managed object subclass

- (UIColor *)derivedColor {
    return [UIColor colorWithRed:[self.red floatValue] green:[self.green floatValue] blue:[self.blue floatValue] alpha:[self.alpha floatValue]];
}


@end
