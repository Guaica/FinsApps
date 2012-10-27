//
//  BestPriceViewController.h
//  ComercioCercano
//
//  Created by iOS2 on 27/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestPriceViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UILabel *MissFinal;
@property (weak, nonatomic) IBOutlet UITextField *txtPreu;
@property (weak, nonatomic) IBOutlet UITextField *txtQuan;
@property (weak, nonatomic) IBOutlet UIStepper *stpIncreaser;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (weak, nonatomic) IBOutlet UIButton *calcularPreu;
@property (weak, nonatomic) IBOutlet UITextField *txtPreuProduc;

- (IBAction)valueChanged:(id)sender;
- (IBAction)hide:(id)sender;
- (IBAction)calcularPreu:(id)sender;


@end
