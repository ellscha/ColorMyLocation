//
//  Color+CoreDataProperties.h
//  ColorMyLocation
//
//  Created by Elli Scharlin on 9/1/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Color.h"

NS_ASSUME_NONNULL_BEGIN

@interface Color (CoreDataProperties)

@property (nonatomic) double red;
@property (nonatomic) double green;
@property (nonatomic) double blue;
@property (nonatomic) double alpha;
@property (nullable, nonatomic, retain) NSString *address;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (nonatomic) double altitude;
@property (nonatomic) NSTimeInterval createdAt;

@end

NS_ASSUME_NONNULL_END
