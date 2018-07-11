//
//  ViewController.m
//  myWeatherApp
//
//  Created by Rohit Bordia on 7/11/18.
//  Copyright © 2018 Rohit Bordia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *cityName;
@property (weak, nonatomic) IBOutlet UILabel *errorLabeltext;
@property (weak, nonatomic) IBOutlet UISearchBar *cityNameUiText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cityName = @"";
    NSLog(@"%@" , self.cityName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   
    [self.view endEditing:true];
}
- (IBAction)submitClicked:(id)sender {
    if([@"" isEqualToString: [self.cityNameUiText text]]){
        self.errorLabeltext.text = @"Cannot be empty";
    }else{
        self.cityName = self.cityNameUiText.text;
    }
    NSLog(@"%@" , self.cityName);
}

@end
