//
//  ColorDataStore.m
//  ColorMyLocation
//
//  Created by Elli Scharlin on 8/31/16.
//  Copyright © 2016 ElliBelly. All rights reserved.
//

#import "ColorDataStore.h"
#import "Color.h"




@implementation ColorDataStore


+(instancetype)sharedInstance{
    static ColorDataStore *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ColorDataStore alloc]init];
    });
    return sharedInstance;
}



@end

