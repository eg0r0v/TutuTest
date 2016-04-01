//
//  RoadPickViewController.h
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StationsViewController.h"
#import "DatePickerViewController.h"

@interface RoadPickViewController : UIViewController <  UITextFieldDelegate,
                                                        StationsViewControllerDelegate,
                                                        DatePickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fromTextField;
@property (weak, nonatomic) IBOutlet UITextField *toTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIView *regardsView;

@property (strong, nonatomic) NSArray* fromCitiesArray;
@property (strong, nonatomic) NSArray* toCitiesArray;

@end
