//
//  NashAlgorithm.h
//  FinApp
//
//  Created by iOS2 on 26/10/12.
//  Copyright (c) 2012 iOS2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Algorithm : NSObject

@property int x;
@property int y;
@property (retain, nonatomic) NSArray *arrPricesFinal;

-(id)initWithArrPriceShop:(NSArray*)prices;
-(double)rentModelQuantityOfProduct:(int)quantity priceOfProduct:(double)price;

@end
