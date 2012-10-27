//
//  Client.h
//  SetGoMaps
//
//  Created by iOS on 27/10/12.
//  Copyright (c) 2012 Guaica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *firstname;
@property (nonatomic, strong) NSString *lastname;
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *postalcode;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSArray *accounts;
@property (nonatomic, strong) NSArray *cards;

- (id)initClientWithDictionary:(NSDictionary*)clientDictionary;

@end
