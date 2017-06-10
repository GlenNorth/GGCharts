//
//  AppDelegate.m
//  HSCharts
//
//  Created by 黄舜 on 16/6/23.
//  Copyright © 2016年 I really is a farmer. All rights reserved.
//

#import "AppDelegate.h"
#import "RankBarView.h"
#import "Colors.h"
#import "CumSumBarView.h"
#import "CrossLineView.h"
#import "CumSumLineView.h"
#import "ListVC.h"

#import "GGLayer.h"

#import "GGLinePaint.h"
#import "GGTextPaint.h"

#import "GGStringRenderer.h"

#import "GGCanvas.h"

#import "GGChart.h"

#import "GGChartDefine.h"

#import "GGAxisRenderer.h"
#import "GGStringRenderer.h"
#import "GGGridRenderer.h"

#import "LineBarView.h"

#import "IOLineBarChart.h"
#import "IOBarChart.h"
#import "BarChartData.h"
#import "LineChartData.h"

#import "CGPathCategory.h"

#import "DrawMath.h"

#import "PieChartData.h"

#import "IOBarChartViewController.h"
#import "LineBarChartViewController.h"

#import "NTPieChart.h"

@interface AppDelegate ()

@property (nonatomic) IOBarChart * barChart;

@property (nonatomic) IOLineBarChart * lineBarChart;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc]init];
    [self.window makeKeyAndVisible];
    
    UINavigationController *navi =  [[UINavigationController alloc] initWithRootViewController:[LineBarChartViewController new]];
    [self.window setRootViewController:navi];
    
    PieChartData * pie_d1 = [[PieChartData alloc] init];
    pie_d1.pieName = @"直接访问";
    pie_d1.pieData = @335;
    pie_d1.color = __RGB_RED;
    
    PieChartData * pie_d2 = [[PieChartData alloc] init];
    pie_d2.pieName = @"直接访问";
    pie_d2.pieData = @310;
    pie_d2.color = __RGB_BLUE;
    
    PieChartData * pie_d3 = [[PieChartData alloc] init];
    pie_d3.pieName = @"直接访问";
    pie_d3.pieData = @234;
    pie_d3.color = __RGB_GREEN;
    
    PieChartData * pie_d4 = [[PieChartData alloc] init];
    pie_d4.pieName = @"直接访问";
    pie_d4.pieData = @135;
    pie_d4.color = __RGB_ORIGE;
    
    PieChartData * pie_d5 = [[PieChartData alloc] init];
    pie_d5.pieName = @"直接访问";
    pie_d5.pieData = @548;
    pie_d5.color = __RGB_RED;
    
    PieChartData * pie_d6 = [[PieChartData alloc] init];
    pie_d6.pieName = @"直接访问";
    pie_d6.pieData = @748;
    pie_d6.color = __RGB_CYAN;
    
    PieChartData * pie_d7 = [[PieChartData alloc] init];
    pie_d7.pieName = @"直接访问";
    pie_d7.pieData = @148;
    pie_d7.color = __RGB_BLACK;
    
    NSArray * pieData = @[pie_d1, pie_d2, pie_d3, pie_d4];
    
    NTPieChart * chart = [[NTPieChart alloc] initWithFrame:self.window.frame];
    chart.sectorRadius = 60;
    chart.sectorAry = pieData;
    
    chart.annularRadius = 80;
    chart.annularWidth = 20;
    chart.annularAry = @[pie_d2, pie_d3, pie_d5, pie_d7, pie_d6];
    
    [chart strockChart];
    [chart addAnimationWithDuration:0.7];
    
    //[self.window addSubview:chart];
    
    return YES;
}

- (void)first
{
    BarChartData * data = [[BarChartData alloc] init];
    data.dataSet = @[@2225.6, @-2563.1, @531.4, @-839.4, @-7.4, @-1000, @897.0, @-1500];
    _barChart.barData = data;
    [_barChart updateChart];
    
    // 柱状数据
    BarChartData * barData = [[BarChartData alloc] init];
    barData.barColor = RGB(241, 213, 136);
    barData.dataSet = @[@1.29, @1.88, @1.46, @3.30, @3.66, @3.23, @3.48, @3.51];
    
    BarChartData * lineData = [[BarChartData alloc] init];
    lineData.barColor = RGB(113, 177, 237);
    lineData.dataSet = @[@-25.44, @9.43, @31.20, @13.05, @10.57, @12.15, @10.64, @9.74];
    
    // 线数据
    LineChartData * lineData1 = [[LineChartData alloc] init];
    lineData1.lineColor = __RGB_BLUE;
    lineData1.dataSet = @[@1.29, @-1.88, @1.46, @-3.30, @3.66, @3.23, @-3.48, @-3.51];
    
    LineChartData * lineData2 = [[LineChartData alloc] init];
    lineData2.lineColor = __RGB_RED;
    lineData2.dataSet = @[@-25.44, @9.43, @-31.20, @13.05, @-10.57, @-12.15, @10.64, @-9.74];
    
    _lineBarChart.barDataAry = @[lineData, barData];
    _lineBarChart.lineDataAry = @[lineData2, lineData1];
    
    [_lineBarChart updateChart];
}

- (void)second
{
    BarChartData * data = [[BarChartData alloc] init];
    data.dataSet = @[@-2225.6, @2563.1, @531.4, @-839.4, @7.4, @-1000, @-897.0, @-1500];
    _barChart.barData = data;
    [_barChart updateChart];
    
    // 柱状数据
    BarChartData * barData = [[BarChartData alloc] init];
    barData.barColor = RGB(241, 213, 136);
    barData.dataSet = @[@1.29, @1.88, @1.46, @3.30, @3.66, @3.23, @3.48, @3.51];
    
    BarChartData * lineData = [[BarChartData alloc] init];
    lineData.barColor = RGB(113, 177, 237);
    lineData.dataSet = @[@-25.44, @9.43, @31.20, @13.05, @10.57, @12.15, @10.64, @9.74];
    
    // 线数据
    LineChartData * lineData1 = [[LineChartData alloc] init];
    lineData1.lineColor = __RGB_BLUE;
    lineData1.dataSet = @[@1.29, @-1.88, @1.46, @-3.30, @3.66, @3.23, @-3.48, @-3.51];
    
    LineChartData * lineData2 = [[LineChartData alloc] init];
    lineData2.lineColor = __RGB_RED;
    lineData2.dataSet = @[@-25.44, @9.43, @-31.20, @13.05, @-10.57, @-12.15, @10.64, @-9.74];
    
    _lineBarChart.barDataAry = @[barData, lineData];
    _lineBarChart.lineDataAry = @[lineData1, lineData2];
    
    [_lineBarChart updateChart];
}

- (NSString *)LineDataTopPath
{
    return [[NSBundle mainBundle] pathForResource:@"CrossLineTopData" ofType:@"txt"];
}

- (NSString *)LineDataBottomPath
{
    return [[NSBundle mainBundle] pathForResource:@"CrossLineBottomData" ofType:@"txt"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//NSArray * xAxisStr = @[@"2015", @"2016", @"2017", @"2018", @"2019"];
//NSArray * yrAxisStr = @[@"4", @"3", @"2", @"1"];
//NSArray * lAxisStr = @[@"40", @"30", @"20", @"10"];
//
//GGCanvas * canvas = [[GGCanvas alloc] init];
//canvas.frame = self.window.frame;
////[self.window.layer addSublayer:canvas];
//
//CGFloat width = [UIScreen mainScreen].bounds.size.width;
//CGRect rect = CGRectMake(40, 200, width - 80, 200);
//
//// x轴
//GGLine line = GGBottomLineRect(rect);
//GGAxis axis = GGAxisLineMake(line, 5, rect.size.width / xAxisStr.count);
//GGAxisRenderer * x_axis_r = [GGAxisRenderer new];
//x_axis_r.axis = axis;
//x_axis_r.width = 0.7;
//x_axis_r.color = [UIColor blackColor];
//[canvas addRenderer:x_axis_r];
//
//GGStringRenderer *string_r = [GGStringRenderer stringForAxis:axis aryStr:xAxisStr];
//string_r.font = [UIFont systemFontOfSize:10];
//string_r.offset = CGSizeMake(rect.size.width / xAxisStr.count / 2, 0);
//string_r.color = [UIColor grayColor];
//[canvas addRenderer:string_r];
//
//// y轴
//GGLine line_r = GGLeftLineRect(rect);
//GGAxis axis_r = GGAxisLineMake(line_r, 5, rect.size.height / (yrAxisStr.count - 1));
//GGAxisRenderer * y_axis = [GGAxisRenderer new];
//y_axis.color = [UIColor blackColor];
//y_axis.width = 0.7;
//y_axis.axis = axis_r;
//[canvas addRenderer:y_axis];
//
//GGStringRenderer * string_l_y = [GGStringRenderer stringForAxis:axis_r aryStr:yrAxisStr];
//string_l_y.font = [UIFont systemFontOfSize:10];
//string_l_y.color = [UIColor grayColor];
//string_l_y.offset = CGSizeMake(-5, -9);
//[canvas addRenderer:string_l_y];
//
//// 左轴
//GGLine line_l = GGRightLineRect(rect);
//GGAxis axis_l = GGAxisLineMake(line_l, -5, rect.size.height / (lAxisStr.count - 1));
//GGAxisRenderer * l_render = [GGAxisRenderer new];
//l_render.axis = axis_l;
//l_render.width = 0.7;
//l_render.color = [UIColor blackColor];
//[canvas addRenderer:l_render];
//
//GGStringRenderer * l_s_r = [GGStringRenderer stringForAxis:axis_l aryStr:lAxisStr];
//l_s_r.font = [UIFont systemFontOfSize:10];
//l_s_r.offset = CGSizeMake(rect.size.width / xAxisStr.count / 2, 0);
//l_s_r.offset = CGSizeMake(10, -9);
//l_s_r.color = [UIColor grayColor];
//[canvas addRenderer:l_s_r];
//
//// 网格
//GGGrid grid = GGGridRectMake(rect, (int)xAxisStr.count + 1, (int)yrAxisStr.count);
//GGGridRenderer * grid_r = [GGGridRenderer new];
//grid_r.width = 0.2;
//grid_r.x_count = @0;
//grid_r.color = [UIColor blackColor];
//grid_r.grid = grid;
//grid_r.dash = CGSizeMake(4, 2);
//[canvas addRenderer:grid_r];
//
//[canvas setNeedsDisplay];

@end
