//
//  TLCarModel.h
//  TLFrameWork
//
//  Created by yulingsong on 16/8/29.
//  Copyright © 2016年 yulingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLCarModel : NSObject
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *pinyin;
+(NSArray *)demoData;
@end
