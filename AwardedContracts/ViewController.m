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
    NSString *auxData;
    NSMutableArray *structuredData;
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

//FETCHING THE CSV DATA FROM THE URL
- (IBAction)btnFetch:(id)sender {
    
    //SAVING CSV DATA INTO A STRING
    NSError *error;
    NSString *allData = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:&error];
    NSString *noReturnData = [allData stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    //NSLog(@"%@", noReturnData);
    
    auxData = noReturnData;
    
    int headerCounter = 0;
    
    NSMutableArray *auxArray = [[NSMutableArray alloc] init];
    structuredData = [[NSMutableArray alloc] init];
    
    while ([auxData length] > 0) {
        auxArray = [self getElements];
        [structuredData addObject:auxArray];
    }
    NSLog(@"%@", structuredData);
    
    
}

//GETTING ELEMENT BY ELEMENT BUILDING AN ARRAY OF 7 ELEMENTS
- (NSMutableArray *) getElements {
    
    NSInteger elementsCounter = 0;
    NSMutableArray *elementsArray = [[NSMutableArray alloc] init];
    
    NSInteger nextBreak;
    NSString *tempElement = @"";
    
    while (elementsCounter < 7) {
        //NSLog(@"%@ #####", auxData);
        
        //CHECKING THE EXISTENCE OF QUOTES WITHIN ELEMENTS
        NSRange findQuote = [auxData rangeOfString:@"\""];
        if (findQuote.location == 0) {
            
            auxData =[auxData substringFromIndex:1];
            findQuote = [auxData rangeOfString:@"\""];
            tempElement = [auxData substringToIndex:findQuote.location];
            [elementsArray addObject:tempElement];
            auxData = [auxData substringFromIndex:2+findQuote.location];
            elementsCounter++;
            continue;
        }
        
        NSRange findNewLine = [auxData rangeOfString:@"\n"];
        
        nextBreak = -1;
        
        if (findNewLine.location != NSNotFound) {
            nextBreak = findNewLine.location;
        }
        
        NSRange findComma = [auxData rangeOfString:@","];
        if (findComma.location != NSNotFound) {
            
            if (findComma.location < nextBreak) {
                
                nextBreak = findComma.location;
                
            }
        }
        
        if (nextBreak >=0) {
            
            tempElement = [auxData substringToIndex:nextBreak];
            [elementsArray addObject:tempElement];
            auxData = [auxData substringFromIndex:1+nextBreak];
            elementsCounter++;
            continue;
        }
        
        break;
    }
    
    return elementsArray;
}

@end
