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

@property (strong, nonatomic) NSMutableArray *colorArray;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(instancetype)sharedInstance;



-(void)saveContext;
-(void)fetchData;
-(NSURL *)applicationDocumentsDirectory;



@end
