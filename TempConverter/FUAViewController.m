//
//  FUAViewController.m
//  TempConverter
//
//  Created by Therin Irwin on 10/4/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import "FUAViewController.h"

@interface FUAViewController ()

@property (assign, nonatomic) BOOL isFToC;
@property (weak, nonatomic) IBOutlet UITextField *cTextField;
@property (weak, nonatomic) IBOutlet UITextField *fTextField;

- (IBAction)onTap:(UITapGestureRecognizer *)sender;

@end

@implementation FUAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)cValueChanged:(id)sender {
    _isFToC = NO;
    [self convert];
}
- (IBAction)fValueChanged:(id)sender {
    _isFToC = YES;
    [self convert];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)convertButtonPressed:(id)sender {
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (void)convert {
    float startTemp;
    float endTemp;
    
    if (_isFToC) {
        startTemp = _fTextField.text.floatValue;
        endTemp = (startTemp - 32) * (5.0/9);
        _cTextField.text = [NSString stringWithFormat:@"%.1f", endTemp];
    } else {
        startTemp = _cTextField.text.floatValue;
        endTemp = ((9.0/5) * startTemp) + 32;
        _fTextField.text = [NSString stringWithFormat:@"%.1f", endTemp];
    }
}
@end
