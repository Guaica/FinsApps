//
//  CustomerRegisterViewController.m
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "CustomerRegisterViewController.h"
#import "ClientDA.h"

@interface CustomerRegisterViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CustomerRegisterViewController

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
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 750);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save
{
    NSDictionary *adressDict = [NSDictionary dictionaryWithObjectsAndKeys:self.txtStreet.text, @"street", self.txtNumber.text, @"number", self.txtCity.text, @"city", self.txtCountry.text, @"country", self.txtPostalCode.text, @"postalCode", nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.txtUserName.text,@"username",self.txtPassword.text, @"password", self.txtFirstName.text, @"firstName", self.txtLastName.text, @"lastName", adressDict, @"address", nil];
    
    ClientDA *clientDataAccess = [[ClientDA alloc] init];
    [clientDataAccess saveClient:dictionary];
}

- (void)viewDidUnload {
    [self setTxtUserName:nil];
    [self setTxtPassword:nil];
    [self setTxtFirstName:nil];
    [self setTxtLastName:nil];
    [self setTxtStreet:nil];
    [self setTxtNumber:nil];
    [self setTxtCity:nil];
    [self setTxtPostalCode:nil];
    [self setTxtCountry:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
