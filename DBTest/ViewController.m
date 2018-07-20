//
//  ViewController.m
//  DBTest
//
//  Created by niudengjun on 2018/6/7.
//  Copyright © 2018年 niudengjun. All rights reserved.
//

#import "ViewController.h"
#import "MPLKDBUserModel.h"
#import "MPLKDBHelper.h"
#import "NSTimer+Addition.h"
//#import "UIButton+Submitting.h"
#import "UIButton+OLAImageTypeSetting.h"
#import "UIView+Animation.h"
#import "UIView+Visuals.h"
#import "UIView+CustomBorder.h"
#import "UIView+Visuals.m"
#import "UIBezierPath+BasicShapes.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *centerImgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 300, 100)];
//    vi.backgroundColor = [UIColor redColor];
//    [self.view addSubview:vi];
//    [self setRoundedCorners:UIRectCornerAllCorners radius:10 andView:vi];
//    vi.layer.shadowColor = [UIColor blueColor].CGColor;
//    vi.layer.shadowOffset = CGSizeMake(2, 5);
//    vi.layer.shadowOpacity = 0.5;
//    vi.layer.shadowRadius = 5;
}


-(void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius andView:(UIView *)vi {
    CGRect rect = vi.bounds;
    
    // Create the path
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
//                                                   byRoundingCorners:corners
//                                                         cornerRadii:CGSizeMake(radius, radius)];
    
//    UIBezierPath *maskPath = [UIBezierPath coupons:rect andRadis:10];
    UIBezierPath *maskPath = [UIBezierPath insideCorner:rect andRadis:10 andTop:NO];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    

    // Set the newly created shape layer as the mask for the view's layer
    vi.layer.mask = maskLayer;
    ;
//    [vi.layer insertSublayer:shadowlayer above:vi.layer];
}


-(void)test2{
    
    self.centerImgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"redPin"]];
    self.centerImgView.frame=CGRectMake(100, 20, 40, 40);
    self.centerImgView.center= self.view.center;
    [self.view addSubview:self.centerImgView];
    
    UIButton *testBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    testBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:testBtn];
    [testBtn addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    [testBtn setTitle:@"哈哈" forState:UIControlStateNormal];
    [testBtn setImage:[UIImage imageNamed:@"redPin"] forState:UIControlStateNormal];
    [testBtn ola_setImagePosition:OLAImageTypeSettingR spacing:0];
    
    
    UIButton *testBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 20, 100, 100)];
    testBtn2.backgroundColor = [UIColor redColor];
    [self.view addSubview:testBtn2];
    [testBtn2 addTarget:self action:@selector(test2:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [testBtn2 setRoundedCorners:UIRectCornerAllCorners radius:20];
}

-(void)test1{
    [self.centerImgView bounceAnima];
    
}

-(void)test2:(UIButton *)sender{
//    [self.centerImgView shake];
    [sender curlUpAndAway:3];
}



//数据库测试
-(void)test{
    
    //这个是全局可以在程序定义一次 让其它都可以用
    LKDBHelper* globalHelper = [LKDBHelper getUsingLKDBHelper];
    
    //删除所有的表
    [globalHelper dropAllTable];
    
    //清理所有数据
    [LKDBHelper clearTableData:[MPLKDBUserModel class]];
    
    MPLKDBUserModel *model=[[MPLKDBUserModel alloc]init];
    model.userName=@"wujunyang";
    model.ID=1;
    model.password=@"123456";
    
    
    MPLKDBUserModel *model2=[[MPLKDBUserModel alloc]init];
    model2.userName=@"wujunyang2";
    //    model2.ID=12;
    model2.password=@"1234566";
    model2.arr=@[model];
    
    MPLKDBUserModel *model3=[[MPLKDBUserModel alloc]init];
    model3.userName=@"1121212";
    //    model3.ID=15;
    model3.password=@"asasas";
    
    MPLKDBUserModel *model4=[[MPLKDBUserModel alloc]init];
    model4.userName=@"1121212";
    //    model4.ID=16;
    model4.password=@"asasas";
    
    //增加删除修改这些都可以放在model类去写
    [model saveToDB];
    [model2 saveToDB];
    [model3 saveToDB];
    [model4 saveToDB];
    
    
    [globalHelper insertToDB:model];
    
    
    NSMutableArray *arr = [MPLKDBUserModel searchWithWhere:@"ID = 11"];
    NSMutableArray *arr2 =[MPLKDBUserModel searchWithWhere:@""];
    NSLog(@"%@  %@",arr,arr2);
}



@end
