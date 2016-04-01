//
//  ViewController.m
//  TutuTest
//
//  Created by Алена Егорова on 15.03.16.
//  Copyright © 2016 Алена Егорова. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage* image = [UIImage imageNamed:@"train"];
    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
    [[self.tabBar.items firstObject] setImage:image];
    [[self.tabBar.items firstObject] setSelectedImage:image];
    image = [UIImage imageNamed:@"Finder"];
    image = [self imageWithImage:image scaledToSize:CGSizeMake(30, 30)];
    [[self.tabBar.items lastObject] setImage:image];
    [[self.tabBar.items lastObject] setSelectedImage:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
