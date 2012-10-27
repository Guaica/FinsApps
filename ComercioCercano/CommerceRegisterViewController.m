//
//  CommerceRegisterViewController.m
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "CommerceRegisterViewController.h"
#import "CommerceDA.h"

@interface CommerceRegisterViewController ()

@end

@implementation CommerceRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1250);
}

- (void)save
{
    double locationLong = 23.12;
    double locationLat = 56.11;
    
    NSArray *locArray = [NSArray arrayWithObjects:[NSNumber numberWithDouble:locationLong], [NSNumber numberWithDouble:locationLat], nil];
    
    NSDictionary *adressHolderDict = [NSDictionary dictionaryWithObjectsAndKeys:self.txtAHStreet.text, @"street", self.txtAHNumber.text, @"number", self.txtAHCity.text, @"city", self.txtAHCity.text, @"country", self.txtAHPostalCode.text, @"postalCode", nil];
    
    NSDictionary *adressCommerceDict = [NSDictionary dictionaryWithObjectsAndKeys:self.txtACStreet.text, @"street", self.txtACNumber.text, @"number", self.txtACCity.text, @"city", self.txtACCity.text, @"country", self.txtACPostalCode.text, @"postalCode", nil];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.txtUsername.text,@"username",self.txtPassword.text, @"password", self.txtFirstname.text, @"firstName", self.txtLastname.text, @"lastName", self.txtPublicName.text, @"publicName", adressHolderDict, @"addressHolder", adressCommerceDict, @"addressCommerce", locArray, @"location", nil];
    
    CommerceDA *commercDataAccess = [[CommerceDA alloc] init];
    [commercDataAccess saveCommerce:dictionary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 {
 username: STRING,
 password, STRING,
 firstName: STRING,
 lastName: STRING,
 addressHolder:{
 street: STRING,
 number: STRING,
 city: STRING,
 postalCode: STRING,
 country: STRING},
 publicName: STRING,
 addressCommerce: {
 street: STRING,
 number: STRING,
 city: STRING,
 postalCode: STRING,
 country: STRING},
 },
 location: [DOUBLE, DOUBLE]
 }
 */

- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setTxtUsername:nil];
    [self setTxtPassword:nil];
    [self setTxtFirstname:nil];
    [self setTxtLastname:nil];
    [self setTxtAHStreet:nil];
    [self setTxtAHNumber:nil];
    [self setTxtAHCity:nil];
    [self setTxtAHPostalCode:nil];
    [self setTxtAHCountry:nil];
    [self setTxtACStreet:nil];
    [self setTxtAHNumber:nil];
    [self setTxtAHCity:nil];
    [self setTxtACNumber:nil];
    [self setTxtACCity:nil];
    [self setTxtACPostalCode:nil];
    [self setTxtACCountry:nil];
    [self setTxtPublicName:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
