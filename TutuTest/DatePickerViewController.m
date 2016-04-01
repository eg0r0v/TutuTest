//
//  DatePickerViewController.m
//  TutuTest
//
//  Created by Алена Егорова on 14.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.pickerView.layer setCornerRadius:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)userDidChooseDate:(UIButton *)sender {
    [self.delegate userDidChooseDate:self.datePicker.date];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
