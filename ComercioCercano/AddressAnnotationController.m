//
//  AddressAnnotationController.m
//  SetGoMapsLocal
//
//  Created by Guaica on 30/07/12.
//  Copyright (c) 2012 Guaica. All rights reserved.
//

#import "AddressAnnotationController.h"

@implementation AddressAnnotationController


- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)aTitle andSubtitle:(NSString*)subtitle
{
    if (self = [super init])
    {
        CLLocationCoordinate2D pinlocation;
        pinlocation.latitude = c.latitude;
        pinlocation.longitude  = c.longitude;
        
        _coordinate = pinlocation;
//        self.title = aTitle;
//        self.subtitle = subtitle;
    }
    return self;
}

////Método necesario para poder desplazar los annotations (annotationView.draggable)
//- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
//{
//    self.coordinate = newCoordinate;
//}

@end
