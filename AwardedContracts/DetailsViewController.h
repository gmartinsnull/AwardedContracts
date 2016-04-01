//
//  DetailsViewController.h
//  AwardedContracts
//
//  Created by Glauber Martins on 2016-04-01.
//  Copyright © 2016 CL. All rights reserved.
//
@protocol DetailsViewControllerDelegate;

#import "ViewController.h"

@protocol DetailsViewControllerDelegate

@end

@interface DetailsViewController : ViewController
@property (weak, nonatomic) IBOutlet UILabel *lblNum;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UITextView *txtDesc;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UITextView *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblAMT;
@property (weak, nonatomic) IBOutlet UILabel *lblAwarded;

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, weak) id<DetailsViewControllerDelegate> delegate;

@end
