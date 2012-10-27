//
//  MapViewController.h
//  ComercioCercano
//
//  Created by iOS on 27/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Client.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) Client *client;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void)loadClientWith:(NSDictionary*)clientDictionary;

@end
