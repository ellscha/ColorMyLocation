//
//  Color.h
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/31/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Color : NSManagedObject

@property (nonatomic, retain) NSNumber *red;
@property (nonatomic, retain) NSNumber *green;
@property (nonatomic, retain) NSNumber *blue;
@property (nonatomic, retain) NSNumber *alpha;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *altitude;
@property (readonly, nonatomic, strong) UIColor *derivedColor;
// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Color+CoreDataProperties.h"
