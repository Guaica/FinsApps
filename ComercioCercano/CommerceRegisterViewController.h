//
//  CommerceRegisterViewController.h
//  ComercioCercano
//
//  Created by iOS on 26/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommerceRegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtLastname;

@property (weak, nonatomic) IBOutlet UITextField *txtAHStreet;
@property (weak, nonatomic) IBOutlet UITextField *txtAHNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtAHCity;
@property (weak, nonatomic) IBOutlet UITextField *txtAHPostalCode;
@property (weak, nonatomic) IBOutlet UITextField *txtAHCountry;

@property (weak, nonatomic) IBOutlet UITextField *txtPublicName;

@property (weak, nonatomic) IBOutlet UITextField *txtACStreet;
@property (weak, nonatomic) IBOutlet UITextField *txtACNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtACCity;
@property (weak, nonatomic) IBOutlet UITextField *txtACPostalCode;
@property (weak, nonatomic) IBOutlet UITextField *txtACCountry;

@end
