//
//  Commerce.h
//  ComercioCercano
//
//  Created by iOS on 27/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commerce : NSObject

@property (strong, nonatomic) NSString *msg;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *publicname;
@property (strong, nonatomic) NSArray *location;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *postalCode;
@property (strong, nonatomic) NSString *street;

- (id)initWithDictionary:(NSDictionary*)commerceDictionary;

@end
