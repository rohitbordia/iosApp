//
//  WeatherHeaderCell.h
//  myWeatherApp
//
//  Created by Rohit Bordia on 7/12/18.
//  Copyright © 2018 Rohit Bordia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherHeaderCell : UITableViewCell

@property(nonatomic,weak)IBOutlet UILabel *dayLbl;
@property(nonatomic,weak)IBOutlet UILabel *minLbl;
@property(nonatomic,weak)IBOutlet UILabel *maxLbl;

@end
