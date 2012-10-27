//
//  NashAlgorithm.m
//  FinApp
//
//  Created by iOS2 on 26/10/12.
//  Copyright (c) 2012 iOS2. All rights reserved.
//

#import "Algorithm.h"

@implementation Algorithm

@synthesize x = _x;
@synthesize y = _y;
@synthesize arrPricesFinal = _arrPricesFinal;

-(id)initWithArrPriceShop:(NSArray*)prices{
    
    self = [super init];
    
    if(self){
        self.x = 9;
        self.y = 8;
        self.arrPricesFinal = prices;
    }
    
    return self;
}

-(double)rentModelQuantityOfProduct:(int)quantity priceOfProduct:(double)price{
    
    NSLog(@"traza de inicio, modelo de dupolio de Cournot, (%i,%i)",self.x,self.y);
    double sumatorio = 0;
    double mediumPrice;
    double gain;
    double resultOfMaxiumFunc;
    int n = 0;
    for(int i=0; i<[self.arrPricesFinal count]; i++){
        sumatorio += [[self.arrPricesFinal objectAtIndex:i] doubleValue];
        n = i+1;
    }
    NSLog(@"sumatorio = %f",sumatorio);
    mediumPrice = sumatorio/n;
    NSLog(@"medium Price = %f",mediumPrice);
    gain = mediumPrice - price;
    NSLog(@"gain = %f",gain);
    resultOfMaxiumFunc = 2*(gain * [self correctorOfEntities:quantity mPrices:mediumPrice] + price) - mediumPrice;
  
    resultOfMaxiumFunc = [self checkMinAndMax:resultOfMaxiumFunc];
      NSLog(@"Resultado de la optimización = %f",resultOfMaxiumFunc);
    return resultOfMaxiumFunc;
    
}

-(double)correctorOfEntities:(int)quantity mPrices:(double)varPri{
    
    double top = 5000;
    double tUnity = quantity*varPri;
    if(tUnity>top)return false;
    double partiReference = top / varPri;
    double totalPercent = (quantity*100)/partiReference;
    double corrector = 0.99;
    NSLog(@"Total percent=%f",totalPercent);
    if(totalPercent>10)corrector = 0.98;
    if(totalPercent>20)corrector = 0.96;
    if(totalPercent>30)corrector = 0.94;
    if(totalPercent>40)corrector = 0.93;
    if(totalPercent>50)corrector = 0.92;
    if(totalPercent>60)corrector = 0.91;
    if(totalPercent>70)corrector = 0.90;
    if(totalPercent>80)corrector = 0.89;
    
     NSLog(@"corrector=%f",corrector);
    return corrector;
    
}

-(double)checkMinAndMax:(double)resultOfMaxiumFunc{
    
    double min = 50000;
    double max = 0;
    for(int i=0; i<[self.arrPricesFinal count]; i++){
        if([[self.arrPricesFinal objectAtIndex:i] doubleValue] < min){
            min = [[self.arrPricesFinal objectAtIndex:i] doubleValue];
        }
        if(max < [[self.arrPricesFinal objectAtIndex:i] doubleValue]){
            max = [[self.arrPricesFinal objectAtIndex:i] doubleValue];
        }
    }
        
    NSLog(@"Min MAx = %f,%f",min,max);
        
    if(resultOfMaxiumFunc < min)resultOfMaxiumFunc = min;
    if(resultOfMaxiumFunc > max)resultOfMaxiumFunc = max;
        
    return resultOfMaxiumFunc;
}

@end
