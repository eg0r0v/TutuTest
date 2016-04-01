//
//  StationInfoViewController.h
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <UIKit/UIKit.h>

@class City;
@class Station;

@interface StationInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView* tableView;

@property (strong, nonatomic) City *city;
@property (strong, nonatomic) Station *station;

@end
