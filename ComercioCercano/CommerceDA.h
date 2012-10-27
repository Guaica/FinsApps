//
//  CommerceDA.h
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommerceDA : NSObject

- (BOOL)saveCommerce:(NSDictionary*)commerceDicitonary;
- (NSArray*)getCommerceWithToken:(NSString*)token atLat:(float)latitude longitude:(float)longitude andradius:(float)radius;

@end
