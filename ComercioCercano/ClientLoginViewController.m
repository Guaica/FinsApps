//
//  ClientLoginViewController.m
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "ClientLoginViewController.h"
#import "MapViewController.h"
#import "ClientDA.h"


@interface ClientLoginViewController ()

@end

@implementation ClientLoginViewController

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
    self.title = @"Accés usuari";
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender
{
    ClientDA *clientDataAccess = [[ClientDA alloc] init];
    
    if ([clientDataAccess LoginUser:self.txtUsername.text withPassword:self.txtPassword.text])
    {
        NSDictionary *clientDictionary = [clientDataAccess getClientWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]];
        [self performSegueWithIdentifier:@"ClientLogin" sender:clientDictionary];
    }
        
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [((MapViewController*)segue.destinationViewController) loadClientWith:(NSDictionary*)sender];
}

- (IBAction)didEnd:(id)sender {
}

- (void)viewDidUnload {
    [self setTxtUsername:nil];
    [self setTxtPassword:nil];
    [super viewDidUnload];
}
@end
