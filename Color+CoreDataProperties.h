//
//  Color+CoreDataProperties.h
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/31/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Color.h"

NS_ASSUME_NONNULL_BEGIN

@interface Color (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *red;
@property (nullable, nonatomic, retain) NSNumber *green;
@property (nullable, nonatomic, retain) NSNumber *blue;
@property (nullable, nonatomic, retain) NSNumber *alpha;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *altitude;

@end

NS_ASSUME_NONNULL_END
