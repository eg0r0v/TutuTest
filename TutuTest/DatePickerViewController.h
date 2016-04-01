//
//  DatePickerViewController.h
//  TutuTest
//
//  Created by Алена Егорова on 14.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewControllerDelegate <NSObject>
- (void)userDidChooseDate:(NSDate*)date;
@end

@interface DatePickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *pickerView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) id <DatePickerViewControllerDelegate> delegate;

- (IBAction)userDidChooseDate:(UIButton *)sender;

@end
