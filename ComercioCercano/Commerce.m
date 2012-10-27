//
//  Commerce.m
//  ComercioCercano
//
//  Created by iOS on 27/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "Commerce.h"

@implementation Commerce

- (id)initWithDictionary:(NSDictionary*)commerceDictionary
{
    if (self = [super init])
    {
        NSDictionary *dataDictionary = [commerceDictionary objectForKey:@"data"];
        self.location = [dataDictionary objectForKey:@"location"];
        self.publicname = [dataDictionary objectForKey:@"publicName"];
        
        NSDictionary *adress = [dataDictionary objectForKey:@"address"];
        if (![adress isKindOfClass:[NSNull class]])
        {   
        self.city = [adress objectForKey:@"city"];
        self.country = [adress objectForKey:@"country"];
        self.number = [adress objectForKey:@"number"];
        self.postalCode = [adress objectForKey:@"postalCode"];
        self.street = [adress objectForKey:@"street"];
        }
            
        self.msg = [commerceDictionary objectForKey:@"msg"];
        self.status = [commerceDictionary objectForKey:@"status"];
    }
    return self;
}

/*
 data =     {
 address =         {
 city = "";
 country = "";
 number = "";
 postalCode = "";
 street = "";
 };
 location =         (
 "4.12",
 2
 );
 publicName = "";
 };
 msg = Ok;
 status = OK;
 }
 */

@end
