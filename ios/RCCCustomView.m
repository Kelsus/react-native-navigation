//
//  RCCCustomView.m
//  ReactNativeNavigation
//
//  Created by Rodrigo Bechara on 29/05/2018.
//  Copyright © 2018 artal. All rights reserved.
//

#import "RCCCustomView.h"
#import "RCCManager.h"
#import <React/RCTRootView.h>


const NSInteger kCustomViewTag = 0x101011;

@implementation RCCCustomView : NSObject
    
+(void)showWithParams:(NSDictionary*)params
    {
        RCTRootView* reactView = [[RCTRootView alloc] initWithBridge:[[RCCManager sharedInstance] getBridge] moduleName:params[@"component"] initialProperties:params[@"passProps"]];
        NSDictionary* frame = params[@"frame"];
        
        float x = [frame[@"x"] floatValue];
        float y = [frame[@"y"] floatValue];
        float width = [frame[@"width"] floatValue];
        float height = [frame[@"height"] floatValue];
        
        CGRect rect = CGRectMake(x, y, width, height);
        UIView *customView = [[UIView alloc] initWithFrame:rect];
        [customView addSubview:reactView];
        [customView setTag:kCustomViewTag];
        id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
        [appDelegate.window.rootViewController.view addSubview:customView];
    }
    
+(void)dismiss
    {
        id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
        UIView *customView = [appDelegate.window.rootViewController.view viewWithTag:kCustomViewTag];
        [customView removeFromSuperview];
    }
    
    @end
