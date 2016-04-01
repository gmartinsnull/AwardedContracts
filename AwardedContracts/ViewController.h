//
//  ViewController.h
//  AwardedContracts
//
//  Created by Glauber Martins on 2016-04-01.
//  Copyright © 2016 CL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, DetailsViewControllerDelegate>

- (IBAction)btnFetch:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tbView;

@end

