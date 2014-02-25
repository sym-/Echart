//
//  EChartViewController.m
//  EChart
//
//  Created by Apple001 on 14-2-20.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "EChartViewController.h"

@interface EChartViewController ()

@property (strong,nonatomic) NSMutableArray *views;

@end

@implementation EChartViewController

@synthesize eLineChart = _eLineChart;
@synthesize eLineChartData = _eLineChartData;

@synthesize eLineChartScale = _eLineChartScale;
@synthesize views;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.views = [NSMutableArray arrayWithCapacity:20];
    
    _eLineChartScale = 1;
    
    /** Generate data for _eLineChart*/
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < 300; i++)
    {
        int number = arc4random() % 100;
        ELineChartDataModel *eLineChartDataModel = [[ELineChartDataModel alloc] initWithLabel:[NSString stringWithFormat:@"%d", i] value:number index:i unit:@"kWh"];
        [tempArray addObject:eLineChartDataModel];
    }
    _eLineChartData = [NSArray arrayWithArray:tempArray];
    
    /** The Actual frame for the line is half height of the frame you specified, because the bottom half is for the touch control, but it's empty */
    _eLineChart = [[ELineChart alloc] initWithFrame:CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 107)];
    [_eLineChart setDelegate:self];
    [_eLineChart setDataSource:self];
    
    [self.views addObject:_eLineChart];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EChartCell";
    EChartCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    UIView *newView = [self.views objectAtIndex:indexPath.row];

    [cell.view addSubview:newView];
    
    return cell;
}



#pragma -mark- ELineChart DataSource
- (NSInteger) numberOfPointsInELineChart:(ELineChart *) eLineChart
{
    return [_eLineChartData count];
}

- (NSInteger) numberOfPointsPresentedEveryTime:(ELineChart *) eLineChart
{
    //    NSInteger num = 20 * (1.0 / _eLineChartScale);
    //    NSLog(@"%d", num);
    return 30;
}

- (ELineChartDataModel *)     highestValueELineChart:(ELineChart *) eLineChart
{
    ELineChartDataModel *maxDataModel = nil;
    float maxValue = -FLT_MIN;
    for (ELineChartDataModel *dataModel in _eLineChartData)
    {
        if (dataModel.value > maxValue)
        {
            maxValue = dataModel.value;
            maxDataModel = dataModel;
        }
    }
    return maxDataModel;
}

- (ELineChartDataModel *)     eLineChart:(ELineChart *) eLineChart
                           valueForIndex:(NSInteger)index
{
    if (index >= [_eLineChartData count] || index < 0) return nil;
    return [_eLineChartData objectAtIndex:index];
}

//#pragma -mark- ELineChart Delegate

//- (void)eLineChartDidReachTheEnd:(ELineChart *)eLineChart
//{
//    NSLog(@"Did reach the end");
//}
//
//- (void)eLineChart:(ELineChart *)eLineChart
//     didTapAtPoint:(ELineChartDataModel *)eLineChartDataModel
//{
//    NSLog(@"%d %f", eLineChartDataModel.index, eLineChartDataModel.value);
//    [_numberTaped setText:[NSString stringWithFormat:@"%.f", eLineChartDataModel.value]];
//    
//}
//
//- (void)    eLineChart:(ELineChart *)eLineChart
// didHoldAndMoveToPoint:(ELineChartDataModel *)eLineChartDataModel
//{
//    [_numberTaped setText:[NSString stringWithFormat:@"%.f", eLineChartDataModel.value]];
//}
//
//- (void)fingerDidLeaveELineChart:(ELineChart *)eLineChart
//{
//    
//}

@end
