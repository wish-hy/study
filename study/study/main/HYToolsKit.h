//
//  HYToolsKit.h
//  fileManager
//
//  Created by hy on 2018/3/6.
//  Copyright © 2018年 hy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#import <CoreImage/CIFilter.h>
#import <CommonCrypto/CommonCrypto.h>

#define FileHashDefaultChunkSizeForReadingData 1024*8 // 8K

@interface HYToolsKit : NSObject

+ (UIImage*)createImageWithColor:(UIColor*)color;

// 获取图片尺寸
+(CGSize)getImageSizeWithURL:(id)imageURL;
@end
