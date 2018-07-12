//
//  ViewController.h
//  myWeatherApp
//
//  Created by Rohit Bordia on 7/11/18.
//  Copyright © 2018 Rohit Bordia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray *maxTempArray;
    NSMutableArray *minTempArray;
    NSMutableArray *dayArray;
   
    
    IBOutlet UITableView *tableView;
}

@end

