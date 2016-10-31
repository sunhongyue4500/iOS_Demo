//
//  GeoElevationFile.h
//  TestSRTMFormat
//
//  Created by Sunhy on 16/10/15.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoElevationFile : NSObject

- (instancetype)initWithFileName:(NSString *)fileName;
- (void)fetchStartPosition:(NSString *)fileName;
- (int)fetchElevation:(double)lon andLat:(double)lat approximate:(BOOL)approximateFlag;

@end
