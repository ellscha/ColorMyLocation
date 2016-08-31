//
//  ColorDataStore.h
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/31/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface ColorDataStore : NSObject

@property (strong, nonatomic) NSArray *colorArray;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(instancetype)sharedInstance;



-(void)saveContext;
-(void)fetchData;
-(NSURL *)applicationDocumentsDirectory;



@end
