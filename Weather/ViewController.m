//
//  ViewController.m
//  Weather
//
//  Created by Aragon on 11/20/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UIImageView *imgWeather;
@property (weak, nonatomic) IBOutlet UILabel *lblChamNgon;
@property (weak, nonatomic) IBOutlet UIButton *btnNhietDo;
@property (weak, nonatomic) IBOutlet UILabel *lblDonVi;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* imgWathers;
    bool isDoC ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _lblLocation.text = @"New York, USA";
    quotes =@[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    imgWathers = @[@"rain", @"sunny", @"thunder", @"windy"];
    isDoC = true;
}

- (IBAction)btnNhietDo:(id)sender {
    if (isDoC) {
        float doC = [_btnNhietDo.titleLabel.text floatValue];
        float doF = (doC * 1.8) + 32.0;
        //NSString *myString = [[NSNumber numberWithFloat:doF] stringValue];
        NSString *myString = [NSString stringWithFormat:@"%2.1f", doF];
        [_btnNhietDo setTitle:myString forState:UIControlStateNormal];
        isDoC =false;
        _lblDonVi.text = @"F";
    }
    else
    {
        float doF = [_btnNhietDo.titleLabel.text floatValue];
        float doC = (doF - 32.0)/1.8;
        //NSString *myString = [[NSNumber numberWithFloat:doC] stringValue];
        NSString *myString = [NSString stringWithFormat:@"%2.1f", doC];
        [_btnNhietDo setTitle:myString forState:UIControlStateNormal];
        isDoC =true;
        _lblDonVi.text = @"C";
    }
}
- (IBAction)btnReload:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    
    self.lblChamNgon.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.lblLocation.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(imgWathers.count);
    self.imgWeather.image = [UIImage imageNamed:imgWathers[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    if (isDoC) {
        [self.btnNhietDo setTitle:string forState:UIControlStateNormal];
    }
    else
    {
        float doC = [string floatValue];
        float doF = (doC * 1.8) + 32.0;
        //NSString *myString = [[NSNumber numberWithFloat:doC] stringValue];
        NSString *myString = [NSString stringWithFormat:@"%2.1f", doF];
        [_btnNhietDo setTitle:myString forState:UIControlStateNormal];
    }
    
}
- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}


@end
