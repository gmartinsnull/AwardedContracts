//
//  ViewController.m
//  AwardedContracts
//
//  Created by Glauber Martins on 2016-04-01.
//  Copyright © 2016 CL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSURL *url;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    url = [NSURL URLWithString:@"ftp://webftp.vancouver.ca/opendata/SCM/AwardedContracts.CSV"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFetch:(id)sender {
    
    //SAVING CSV DATA IN A STRING
    NSError *error;
    NSString *allData = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
    NSString *noReturnData = [allData stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    NSLog(@"%@", noReturnData);
    
}
@end
