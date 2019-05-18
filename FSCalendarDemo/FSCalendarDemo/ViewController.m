//
//  ViewController.m
//  FSCalendarDemo
//
//  Created by 樊盛 on 2019/5/17.
//  Copyright © 2019年 樊盛. All rights reserved.
//

#import "ViewController.h"
#import "FSCalendarView.h"

@interface ViewController ()<FSCalendarDelegate>

@property (nonatomic, strong) FSCalendarView *calendarView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // demo 的 frame 我就简单随便一写，项目中根据实际给值即可
    self.calendarView = [[FSCalendarView alloc] initWithFrame:CGRectMake(0, 88, kScreenWidth, kScreenHeight-88) withCalendarHeight:kScreenWidth*6/7+kCalendarHeaderViewHeight withShowSingle:YES];
    self.calendarView.fsDelegate = self;
    [self.view addSubview:self.calendarView];

}

- (void)calendarDidSelectedWithDate:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    self.title = [dateFormatter stringFromDate:date];
    
    // 模拟数据
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSInteger random = arc4random()%31+1;
        [arr addObject:[NSString stringWithFormat:@"2019-05-%02d", random]];
    }
    
    // 赋值pointsArray
    self.calendarView.calendarScrollView.pointsArray = arr;
    // 刷新collectionViews
    [self.calendarView.calendarScrollView reloadCollectionViews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end