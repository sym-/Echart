//
//  EChartViewController.h
//  EChart
//
//  Created by Apple001 on 14-2-20.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EChartCell.h"
#import "ELineChart.h"

@interface EChartViewController : UITableViewController<ELineChartDataSource, ELineChartDelegate>
@property (strong, nonatomic) ELineChart *eLineChart;

//@property (weak, nonatomic) IBOutlet UILabel *numberTaped;

@property (strong, nonatomic) NSArray *eLineChartData;

@property (nonatomic) float eLineChartScale;
@end
