//
//  ViewController.m
//  myWeatherApp
//
//  Created by Rohit Bordia on 7/11/18.
//  Copyright © 2018 Rohit Bordia. All rights reserved.
//

#import "ViewController.h"
#import "WeatherHeaderCell.h"

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
   // NSLog(@"%@" , self.cityName);
    [self weatherResults];
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
        self.cityName =@"";
    }else{
        self.cityName = self.cityNameUiText.text;
        [self weatherResults];
    }
    //NSLog(@"%@" , self.cityName);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"weatherHeader";
    
    WeatherHeaderCell *cell = (WeatherHeaderCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WeatherHeaderCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    cell.minLbl.text = [NSString stringWithFormat:@"Min: %@°",[minTempArray objectAtIndex:indexPath.row]];
    cell.maxLbl.text = [NSString stringWithFormat:@"Max: %@°",[maxTempArray objectAtIndex:indexPath.row]];
    cell.dayLbl.text = [NSString stringWithFormat:@"%@", [dayArray objectAtIndex:indexPath.row]];
    
  
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
    
}

- (void) weatherResults {
    NSString *urlString =
    [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?q=PHOENIX,US&cnt=10&appid=cf148da777af360a7e37e5ec7dd9fd63"];
    
    NSError *error;
    
    NSURLResponse *response;
    
    maxTempArray = [[NSMutableArray alloc]init];
    minTempArray = [[NSMutableArray alloc]init];
    dayArray = [[NSMutableArray alloc]init];
    
    
    NSData*data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] returningResponse:&response error:&error];
    if (data){
        NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSArray *listOfData = [jsonData valueForKey:@"list"];
        for (int i = 0; i< listOfData.count; i++) {
            NSData *tmpData = [listOfData objectAtIndex:i];
            NSData* mainData = [tmpData valueForKey:@"main"];
            NSString* dateText = [tmpData valueForKey:@"dt_txt"];
            NSString* minText = [mainData valueForKey:@"temp_min"];
            NSString* maxText = [mainData valueForKey:@"temp_max"];
            
            [minTempArray addObject:minText ];
            [maxTempArray addObject:maxText ];
            [dayArray addObject:[dateText substringToIndex:10]];
        }
        [tableView reloadData];
    }else{
        // NSLog(@"%@" , "Issue while getting data");
         self.errorLabeltext.text = @"Could not reteieve Data";
    }
}

@end
