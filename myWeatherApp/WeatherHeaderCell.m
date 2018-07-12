//
//  WeatherHeaderCell.m
//  myWeatherApp
//
//  Created by Rohit Bordia on 7/12/18.
//  Copyright © 2018 Rohit Bordia. All rights reserved.
//

#import "WeatherHeaderCell.h"

@implementation WeatherHeaderCell

@synthesize minLbl = _minLbl, maxLbl = _maxLbl ,dayLbl = _dayLbl;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
