//
//  DetailsViewController.m
//  AwardedContracts
//
//  Created by Glauber Martins on 2016-04-01.
//  Copyright © 2016 CL. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lblNum.text = [self.data objectAtIndex:0];
    self.lblType.text = [self.data objectAtIndex:1];
    self.txtDesc.text = [self.data objectAtIndex:2];
    self.lblDate.text = [self.data objectAtIndex:3];
    self.txtName.text = [self.data objectAtIndex:4];
    self.lblAMT.text = [self.data objectAtIndex:5];
    self.lblAwarded.text = [self.data objectAtIndex:6];
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

@end
