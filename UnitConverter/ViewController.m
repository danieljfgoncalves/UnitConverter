//
//  ViewController.m
//  UnitConverter
//
//  Created by Daniel Goncalves on 2015-04-13.
//  Copyright (c) 2015 DG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// I separated the Logic Method from inside the Button Action and called it instead. This is a better practice because we can reuse the method.
- (NSString *)convertCtoF:(double)fahrenheit{
    
    double celsius = (fahrenheit - 32) / 1.8;
    
    NSString *resultString = [[NSString alloc] initWithFormat:@"Celsius %f", celsius];
    
    return resultString;
}

- (IBAction)convertTemp:(id)sender {
    
    // tested to see if Button is clicked keyboard hides (CONFIRMED)
    [_tempText resignFirstResponder];
    
    _resultLabel.text = [self convertCtoF:[_tempText.text doubleValue]];
}



// Added remove keyboard functionality
-(IBAction)textFieldHideOnReturn:(id)sender {

    [sender resignFirstResponder];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_tempText isFirstResponder] && [touch view] != _tempText) {
        [_tempText resignFirstResponder];
    }
}



@end
