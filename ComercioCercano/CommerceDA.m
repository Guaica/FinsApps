//
//  CommerceDA.m
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "CommerceDA.h"
#import "Commerce.h"

@implementation CommerceDA

- (NSString*)wsURL
{
    return [NSString stringWithFormat:@"%@%@", kAPIUrl, kAPIKey];
}

- (BOOL)saveCommerce:(NSDictionary*)commerceDicitonary
{
    NSString *baseUrl = [NSString stringWithFormat:@"%@/access/commerce", [self wsURL]];
    NSURL *url = [NSURL URLWithString:baseUrl];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = nil;
    
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:commerceDicitonary options:NSJSONWritingPrettyPrinted error:&error];
    [urlRequest setHTTPBody:postdata];
    
    NSURLResponse *response = nil;
    NSData *data = nil;
    
    data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];//Eniamos la petición a l servidor que nos retorna datos que posteriormente parsearemos
    
    if([data length] > 0 && error == nil)
    {
        NSDictionary *resDict = nil;
        if([data length] > 0 && error == nil)
        {
            NSError *jsonError = nil;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            if(jsonObject != nil && jsonError == nil)
            {
                if([jsonObject isKindOfClass:[NSDictionary class]])
                {
                    resDict = (NSDictionary*)jsonObject;
                    NSLog(@"%@", resDict);
                }
            }
        }
    }
    return NO;
}

- (Commerce*)getCommerceByID:(NSString*)commmerceID
{
    Commerce *commerce = nil;
    
    NSString *baseUrl = [NSString stringWithFormat:@"http://finappsapi.bdigital.org/api/2012/973a9a0add/%@/operations/commerce/%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"token"], commmerceID];
    
    
    NSURL *url = [NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    
    NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response  error:&error];
    
    if (!error)
    {
        NSDictionary *json = [NSJSONSerialization
                JSONObjectWithData:newData //1
                options:kNilOptions
                error:&error];
        NSLog(@"%@", json);
        commerce = [[Commerce alloc] initWithDictionary:json];
    }
    
    return commerce;
}

- (NSArray*)getCommerceWithToken:(NSString*)token atLat:(float)latitude longitude:(float)longitude andradius:(float)radius
{
    __block NSDictionary *json = nil;
    
    //longitude = 41.2;
    //latitude = 2.1;
    radius = 1;
    
    NSString *baseUrl = [NSString stringWithFormat:@"http://finappsapi.bdigital.org/api/2012/973a9a0add/%@/operations/commerce/search/near?lat=%.2f&lng=%.2f&radius=%.2f", token, latitude, longitude, radius];
    
    NSLog(@"%@", baseUrl);
    
    NSURL *url = [NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    
    NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response  error:&error];
    
    if (!error)
    {
        json = [NSJSONSerialization
                JSONObjectWithData:newData //1
                options:kNilOptions
                error:&error];
    }
    
    NSArray *commercesArray = [json objectForKey:@"data"];
    NSMutableArray *commercesMutableArray = [[NSMutableArray alloc] init];
    for (NSString *commerceID in commercesArray)
    {
        NSLog(@"%@", commerceID);
        [commercesMutableArray addObject:[self getCommerceByID:commerceID]];
    }
    NSLog(@"%d", commercesArray.count);
    return commercesMutableArray;
}


@end
