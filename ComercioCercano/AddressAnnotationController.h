//
//  AddressAnnotationController.h
//  SetGoMapsLocal
//
//  Created by Guaica on 30/07/12.
//  Copyright (c) 2012 Guaica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class MapModel;

@interface AddressAnnotationController : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Title and subtitle for use by selection UI.
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)aTitle andSubtitle:(NSString*)subtitle;


@end
