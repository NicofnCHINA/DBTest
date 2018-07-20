//
//  UIBezierPath+BasicShapes.m
//  Example
//
//  Created by niudengjun  on 19/06/18.
//  Copyright (c) 2018 niudengjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (BasicShapes)

+ (UIBezierPath *)heartShape:(CGRect)originalFrame;
+ (UIBezierPath *)userShape:(CGRect)originalFrame;
+ (UIBezierPath *)martiniShape:(CGRect)originalFrame;
+ (UIBezierPath *)beakerShape:(CGRect)originalFrame;
+ (UIBezierPath *)starShape:(CGRect)originalFrame;
+ (UIBezierPath *)stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

+ (UIBezierPath *)insideCorner:(CGRect)originalFrame andRadis:(CGFloat)radis andTop:(BOOL)top;



@end
