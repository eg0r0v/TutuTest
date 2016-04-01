//
//  RoadPickViewController.m
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "RoadPickViewController.h"
#import "Station.h"
#import "JSONParser.h"

@interface RoadPickViewController ()

@property (weak, nonatomic) UITextField* selectedTextField;

@end

@implementation RoadPickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
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

#pragma mark - StationsViewControllerDelegate

-(void)didChooseStation:(Station*)station {
    if (([self.selectedTextField isEqual:self.fromTextField] &&
        [self.toTextField.text isEqualToString:station.stationTitle]) ||
        ([self.selectedTextField isEqual:self.toTextField] &&
        [self.fromTextField.text isEqualToString:station.stationTitle])) {
        return;
    }
    [self.selectedTextField setText:station.stationTitle];
    [self checkRegards];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    self.selectedTextField = textField;
    
    if (![textField.placeholder isEqualToString:@"Когда"])
    {
        StationsViewController* svc = [[StationsViewController alloc] initWithNibName:@"StationsViewController" bundle:nil];
        svc.delegate = self;
        UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:svc];
        
        if ([textField.placeholder isEqualToString:@"Откуда"]) {
            svc.citiesArray = [[JSONParser sharedParser] parseFromCitiesArray];
        } else {
            svc.citiesArray = [[JSONParser sharedParser] parseToCitiesArray];
        }
        
        [self presentViewController:nc animated:YES completion:nil];
    } else {
        DatePickerViewController* dpvc = [[DatePickerViewController alloc] initWithNibName:@"DatePickerViewController" bundle:nil];
        dpvc.delegate = self;
        [dpvc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
        [self presentViewController:dpvc animated:YES completion:^{}];
    }
    return NO;
}

- (NSInteger)daysBetweenTodayAndDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:[NSDate date]];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:[NSDate date] toDate:toDate options:0];
    
    return [difference day];
}

-(void)userDidChooseDate:(NSDate *)date {
    
    if ([self daysBetweenTodayAndDate:date] >= 0) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MM.YYYY"];
        [self.selectedTextField setText:[formatter stringFromDate:date]];
        [self checkRegards];
    }
}



-(void)checkRegards {
    if (self.fromTextField.text && ![self.fromTextField.text isEqualToString:@""] &&
        self.toTextField.text && ![self.toTextField.text isEqualToString:@""] &&
        self.dateTextField.text && ![self.dateTextField.text isEqualToString:@""]) {
        [self.regardsView setHidden:NO];
    } else {
        [self.regardsView setHidden:YES];
    }
}

@end
