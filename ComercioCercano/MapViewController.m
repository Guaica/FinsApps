//
//  MapViewController.m
//  ComercioCercano
//
//  Created by iOS on 27/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "MapViewController.h"
#import "Client.h"
#import "CommerceDA.h"
#import "Commerce.h"
#import "AddressAnnotationController.h"

@interface MapViewController ()

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation MapViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager = locationManager;
    }
    return self;
}

- (void)loadClientWith:(NSDictionary*)clientDictionary
{
    self.client = [[Client alloc] initClientWithDictionary:clientDictionary];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    //[self findMe];
    MKCoordinateRegion cordinateRegion;
    CLLocationCoordinate2D location;
    location.latitude = 41.5;
    location.longitude = 2.1;
    
    cordinateRegion.center = location;
    MKCoordinateSpan span;
    span.latitudeDelta = 1.5;
    span.longitudeDelta = 1.5;
    cordinateRegion.span = span;
    
    [self.mapView setRegion:cordinateRegion];
    [self showCommerces];
}

- (void)findMe
{
    //Localizar
    [self.locationManager startUpdatingLocation];
}

- (NSString*)addDecimalsAtString:(NSString*)aDecimals
{
    NSRange range = [aDecimals rangeOfString:@"."];
    if (range.location == NSNotFound)
    {
        NSMutableString *mutString = [NSMutableString stringWithString:aDecimals];
        [mutString appendString:@".00"];
        return mutString;
    }
    
    return aDecimals;
}

- (void)showCommerces
{
    //Commerce
    CommerceDA *commerceDataAccess = [[CommerceDA alloc] init];
    NSArray *commercesArray = [commerceDataAccess getCommerceWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] atLat:41.2 longitude:2.2 andradius:0.1];
    
    for (Commerce *comerce in commercesArray)
    {
        NSArray *coordinatesArray = comerce.location;
        CLLocationCoordinate2D coordinate;

        NSDecimalNumber *decStrLatitude = (NSDecimalNumber*)[coordinatesArray objectAtIndex:0];
        NSDecimalNumber *decStrLongitude = (NSDecimalNumber*)[coordinatesArray objectAtIndex:1];
        
        NSString *strLatitudeDecimals = [self addDecimalsAtString:[decStrLatitude stringValue]];
        NSString *strLongitudeDecimal = [self addDecimalsAtString:[decStrLongitude stringValue]];
        
        coordinate.latitude =  [strLatitudeDecimals doubleValue];
        coordinate.longitude =  [strLongitudeDecimal doubleValue];
        
        AddressAnnotationController *adressAnnotation = [[AddressAnnotationController alloc] initWithCoordinate:coordinate title:comerce.publicname andSubtitle:nil];
        [self.mapView addAnnotation:adressAnnotation];
    }
}

- (void)centerMapAtLocation:(CLLocation*)location
{
    //Centro
    CLLocationCoordinate2D centerMap;
    centerMap.latitude = location.coordinate.latitude;
    centerMap.longitude  = location.coordinate.longitude;
    
    //Cálculo de span desde centro a uno de los extremos
    MKCoordinateSpan spanMap;
    spanMap.latitudeDelta = 0.1;
    spanMap.longitudeDelta = 0.1;
    
    //Crear region a partir de los calculos anteriores
    MKCoordinateRegion regionMap;
    regionMap.span=spanMap;
    regionMap.center=centerMap;
    
    [self.mapView setRegion:regionMap animated:YES];
}

#pragma mark - LocationManager delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self centerMapAtLocation:newLocation];
    [manager stopUpdatingLocation];
    
//    //Localización inversa gracias a la clase CLGeocoder. Se filtra el acceso a la misma para mejorar rendimiento
//    if (self.isSearching)
//    {
//        CLGeocoder *currentGeoCoderLoc = [[CLGeocoder alloc] init];
//        [currentGeoCoderLoc reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
//            //El método accede al bloque cuando ha termianado con la localización inversa
//            self.isSearching = FALSE;
//            CLPlacemark *placemark = [placemarks objectAtIndex:0];
//            self.txtDirectionIB.text = [self stringByPlacementDictionary:[placemark addressDictionary]];
//            [self.delegate placemarkFound:placemark];
//        }];
//    }
}

//Método de delegado llamado cuando una annotation está lista para aparecer en la vista (similar al dataSource de tableView)
- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation
{
    CLLocationCoordinate2D coordinate = annotation.coordinate;
    //Si el annotation es del tipo User Location se devuelve un nil, punto azul estandard
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    else
    {
        //Generar o recuperar MKAnnotationView
        MKPinAnnotationView *pin = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"annotation_ID"];
        if (pin == nil)
            pin = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"annotation_ID"];
        
        else
            pin.annotation = annotation;
        
        //Establecer propiedades de MKAnnotationView
        pin.animatesDrop = YES;
        
        return pin;
    }
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    
    NSLog(@"%@", error);
}

- (IBAction)btnLocate:(id)sender {
    [self findMe];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}
@end
