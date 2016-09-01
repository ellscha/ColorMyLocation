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

@property (nonatomic) double red;
@property (nonatomic) double green;
@property (nonatomic) double blue;
@property (nonatomic) double alpha;
@property (nullable, nonatomic, retain) NSString *address;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (nonatomic) double altitude;
@property (nonatomic) NSTimeInterval createdAt;

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Color+CoreDataProperties.h"
