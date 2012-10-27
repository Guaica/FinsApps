//
//  BestPriceViewController.m
//  ComercioCercano
//
//  Created by iOS2 on 27/10/12.
//  Copyright (c) 2012 SetFile. All rights reserved.
//

#import "BestPriceViewController.h"
#import "Algorithm.h"

@interface BestPriceViewController()

@property (strong,nonatomic) NSMutableArray *arrPrices;
@property (strong,nonatomic) NSMutableString *strTxt;
@property (strong,nonatomic) Algorithm *alg;
@property int count;

@end

@implementation BestPriceViewController
@synthesize calcularPreu;
@synthesize txtPreuProduc;
@synthesize MissFinal;
@synthesize txtPreu;
@synthesize txtQuan;
@synthesize stpIncreaser;
@synthesize textField = _textField;
@synthesize arrPrices;
@synthesize strTxt;
@synthesize alg = _alg;

-(void)viewDidLoad {
    
    self.stpIncreaser.minimumValue = 0;
    self.stpIncreaser.maximumValue = 30;
    self.stpIncreaser.stepValue = 5;
    self.stpIncreaser.wraps = YES;
    self.stpIncreaser.autorepeat = YES;
    self.stpIncreaser.continuous = NO;
    self.MissFinal.text = [NSString stringWithFormat:@""];
    self.arrPrices = [[NSMutableArray alloc] init];
    self.strTxt = [[NSMutableString alloc] init];
    self.textField.text = @"";
    [self.strTxt appendString: [NSString stringWithFormat:@"Llistat de productes\n"]];
    self.textField.text = self.strTxt;
    self.count = 0;
    self.alg =  [[Algorithm alloc] initWithArrPriceShop:self.arrPrices];
    self.txtPreu.delegate = self;
    self.txtPreuProduc.delegate = self;
    self.txtQuan.delegate = self;

}

- (void)viewDidUnload {
    [self setMissFinal:nil];
    [self setTxtPreu:nil];
    [self setTxtQuan:nil];
    [self setStpIncreaser:nil];
    [self setTextField:nil];
    [self setCalcularPreu:nil];
    [self setTxtPreuProduc:nil];
    [super viewDidUnload];
}

-(IBAction)hide:(id)sender{
    
}

/*
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.5];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    if(textField == self.txtPreu){
        textField.transform = CGAffineTransformMakeTranslation(0, -10);
    }
    else if(textField == self.txtPreuProduc){
        textField.transform = CGAffineTransformMakeTranslation(-50, -65);
    }
    else if(textField == self.txtQuan){
        textField.transform = CGAffineTransformMakeTranslation(-50, -125);
    }
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.5];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    if(textField == self.txtPreu){
        textField.transform = CGAffineTransformMakeTranslation(0, 0);
    }
    else if(textField == self.txtPreuProduc){
        textField.transform = CGAffineTransformMakeTranslation(0, 0);
    }
    else if(textField == self.txtQuan){
        textField.transform = CGAffineTransformMakeTranslation(0, 0);
    }
    [UIView commitAnimations];
}
*/
- (IBAction)calcularPreu:(id)sender {
    
    self.alg.arrPricesFinal = self.arrPrices;
    double quant = [self.txtQuan.text doubleValue];
    double preu = [self.txtPreuProduc.text doubleValue];
    double price = [self.alg rentModelQuantityOfProduct:quant priceOfProduct:preu];
    self.MissFinal.text = [NSString stringWithFormat:@"El preu final és %.2f", price];
}


- (IBAction)valueChanged:(UIStepper*)sender {
    
    NSLog(@"Trazica");
    NSUInteger value = sender.value;
    if(self.count>value){
        [self.arrPrices removeLastObject];
        NSLog(@"array %@",self.arrPrices);
        self.strTxt = nil;
        self.strTxt = [[NSMutableString alloc] init];
        [self.strTxt appendString: [NSString stringWithFormat:@"Llistat de productes\n"]];
        for(int i = 0; i < [self.arrPrices count]; i++){
            NSString *strTmp = [self.arrPrices objectAtIndex:i];
            [self.strTxt appendString: [NSString stringWithFormat:@"Producto %i Precio %@\n",i+1,strTmp]];
        }
    }
    else{
        // = [NSString stringWithFormat:@"%03d",value];
        NSNumber *number = [NSNumber numberWithDouble:[self.txtPreu.text doubleValue]];
        NSLog(@"Numero introducido  %@",number);
        [self.arrPrices addObject:number];
         NSLog(@"array %@",self.arrPrices);
        [self.strTxt appendString: [NSString stringWithFormat:@"Producto %i Precio %@\n",value,number]];
        NSLog(@"TXt introducido  %@",self.strTxt);
    }
        self.textField.text = self.strTxt;
        self.count = value;
}



@end
