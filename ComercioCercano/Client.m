//
//  Client.m
//  SetGoMaps
//
//  Created by iOS on 27/10/12.
//  Copyright (c) 2012 Guaica. All rights reserved.
//

#import "Client.h"

@implementation Client

- (id)initClientWithDictionary:(NSDictionary*)clientDictionary
{
    if (self = [super init])
    {       
        self.status = [clientDictionary objectForKey:@"status"];
        self.msg = [clientDictionary objectForKey:@"msg"];
        
        NSDictionary *dataDictionary = [clientDictionary objectForKey:@"data"];
        self.identifier = [dataDictionary objectForKey:@"id"];
        
        NSDictionary *holderDictionary = [dataDictionary objectForKey:@"holder"];
        self.username = [holderDictionary objectForKey:@"username"];
        self.password = [holderDictionary objectForKey:@"password"];
        self.firstname = [holderDictionary objectForKey:@"firstName"];
        self.lastname = [holderDictionary objectForKey:@"lastName"];
        
        NSDictionary *adressDictionary = [holderDictionary objectForKey:@"address"];
        self.street = [adressDictionary objectForKey:@"street"];
        self.number = [adressDictionary objectForKey:@"number"];
        self.city = [adressDictionary objectForKey:@"city"];
        self.postalcode = [adressDictionary objectForKey:@"postalCode"];
        self.country = [adressDictionary objectForKey:@"country"];
        
        self.accounts = [dataDictionary objectForKey:@"accounts"];
        self.cards = [dataDictionary objectForKey:@"cards"];
    }
    return self;
}

/*
 status : <OK,ERROR>,
 msg : <STRING>,
 data : {
 id : STRING,
 holder: {
 username: STRING,
 password, STRING,
 firstName: STRING,
 lastName: STRING,
 address: {
 street: STRING,
 number: STRING,
 city: STRING,
 postalCode: STRING,
 country: STRING
 }
 },
 accounts:[id_account,...],
 cards:[id_card,...]
 }
 }
*/

@end
