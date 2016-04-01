//
//  StationsViewController.m
//  TutuTest
//
//  Created by Алена Егорова on 11.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "StationsViewController.h"
#import "StationInfoViewController.h"
#import "City.h"
#import "Station.h"

@interface StationsViewController () {
    NSMutableArray *searchResults;
    BOOL isSearching;
}
@end

@implementation StationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"stationIdentifier"];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    searchResults = [NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return isSearching ? [searchResults count] : [self.citiesArray count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray* currentArray = isSearching ? searchResults : self.citiesArray;
    City* city = [currentArray objectAtIndex:section];
    return [NSString stringWithFormat:@"%@, %@", city.cityTitle, city.countryTitle];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* currentArray = isSearching ? searchResults : self.citiesArray;
    City* city = [currentArray objectAtIndex:section];
    return [city.stations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"stationIdentifier" forIndexPath:indexPath];
    NSArray* currentArray = isSearching ? searchResults : self.citiesArray;
    
    City* city = [currentArray objectAtIndex:indexPath.section];
    Station* station = [city.stations objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:station.stationTitle];
    
    if (!cell.accessoryView) {
        UIButton* infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [infoButton addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = infoButton;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray* currentArray = isSearching ? searchResults : self.citiesArray;
    City* city = [currentArray objectAtIndex:indexPath.section];
    Station* station = [city.stations objectAtIndex:indexPath.row];
    
    [self.delegate didChooseStation:station];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)showInfo:(UIButton*)sender {
    for (UITableViewCell* cell  in self.tableView.visibleCells) {
        if ([cell.accessoryView isEqual:sender]) {
            NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
            if (indexPath) {
                NSArray* currentArray = isSearching ? searchResults : self.citiesArray;
                City* city = [currentArray objectAtIndex:indexPath.section];
                Station* station = [city.stations objectAtIndex:indexPath.row];
                
                StationInfoViewController* sivc = [[StationInfoViewController alloc] initWithNibName:@"StationInfoViewController" bundle:nil];
                sivc.city = city;
                sivc.station = station;
                
                [self.navigationController pushViewController:sivc animated:YES];
            }
            break;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    searchText = [searchText lowercaseString];
    if (searchText == nil || [searchText isEqualToString:@""]) {
        
        // If empty the search results are the same as the original data
        isSearching = NO;
        
    } else {
        isSearching = YES;
        [searchResults removeAllObjects];
        
        for (City *city in self.citiesArray) {
            
            if ([[city.cityTitle lowercaseString] containsString:searchText] ||
                [[city.countryTitle lowercaseString] containsString:searchText] ||
                [[city.regionTitle lowercaseString] containsString:searchText] ||
                [[city.districtTitle lowercaseString] containsString:searchText]) {
                [searchResults addObject:city];
            } else {
                City* shortCity = [[City alloc] initWithCity:city];
                NSMutableArray* shortStations = [NSMutableArray array];
                BOOL areAny = NO;
                for (Station* station in shortCity.stations) {
                    if ([[station.stationTitle lowercaseString] containsString:searchText]) {
                        [shortStations addObject:station];
                        areAny = YES;
                    }
                }
                if (areAny) {
                    shortCity.stations = shortStations;
                    [searchResults addObject:shortCity];
                }
            }
        }
    }
    [self.tableView reloadData];
}
@end
