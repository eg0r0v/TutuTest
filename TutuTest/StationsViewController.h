//
//  StationsViewController.h
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Station;

@protocol StationsViewControllerDelegate
-(void)didChooseStation:(Station*)station;
@end

@interface StationsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray* citiesArray;
@property (weak, nonatomic) id <StationsViewControllerDelegate> delegate;

@end
