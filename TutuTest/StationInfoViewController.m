//
//  StationInfoViewController.m
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "StationInfoViewController.h"
#import "City.h"
#import "Station.h"

@interface StationInfoViewController ()

@end

@implementation StationInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:self.station.stationTitle];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return section == 0 ? 4 : 7;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0 ? @"Станция" : @"Город";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) { //station
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"Название"];
                [cell.detailTextLabel setText:self.station.stationTitle];
                break;
            case 1:
                [cell.textLabel setText:@"Номер в базе"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d",self.station.stationId]];
                break;
            case 2:
                [cell.textLabel setText:@"Широта"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%f˚",self.station.latitude]];
                break;
            case 3:
                [cell.textLabel setText:@"Долгота"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%f˚",self.station.longitude]];
                break;
            default:
                break;
        }
    } else if (indexPath.section == 1) { //city
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"Название"];
                [cell.detailTextLabel setText:self.city.cityTitle];
                break;
            case 1:
                [cell.textLabel setText:@"Номер в базе"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d",self.city.cityId]];
                break;
            case 2:
                [cell.textLabel setText:@"Страна"];
                [cell.detailTextLabel setText:self.city.countryTitle];
                break;
            case 3:
                [cell.textLabel setText:@"Регион"];
                [cell.detailTextLabel setText:self.city.regionTitle];
                break;
            case 4:
                [cell.textLabel setText:@"Район"];
                [cell.detailTextLabel setText:self.city.districtTitle];
                break;
            case 5:
                [cell.textLabel setText:@"Широта"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%f˚",self.city.latitude]];
                break;
            case 6:
                [cell.textLabel setText:@"Долгота"];
                [cell.detailTextLabel setText:[NSString stringWithFormat:@"%f˚",self.city.longitude]];
                break;
                
            default:
                break;
        }
    }
    return cell;
}


@end
