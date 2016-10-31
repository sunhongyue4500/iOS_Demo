//
//  GeoElevationFile.m
//  TestSRTMFormat
//
//  Created by Sunhy on 16/10/15.
//  Copyright © 2016年 Sunhy. All rights reserved.
//

#import "GeoElevationFile.h"
#import "SRTMUtils.h"

@interface GeoElevationFile ()

@property (nonatomic, strong) NSFileHandle *handle;
@property (nonatomic, assign) double startLon;
@property (nonatomic, assign) double startLat;
@property (nonatomic, assign) int squareSide;
@property (nonatomic, assign) int row;
@property (nonatomic, assign) int col;

@end

@implementation GeoElevationFile

- (instancetype)initWithFileName:(NSString *)fileName {
    if (self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"hgt"];
        NSFileManager *manager = [NSFileManager defaultManager];
        if(![manager fileExistsAtPath:path]) {
            NSLog(@"文件不存在");
        }
        self.handle = [NSFileHandle fileHandleForReadingAtPath:path];
        unsigned long long offset;
        offset = [[manager attributesOfItemAtPath:path error:nil] fileSize];
        self.squareSide = (int)sqrt(offset / 2.0);
#ifdef DEBUG
        NSLog(@"%lld", offset);
        NSLog(@"%f", sqrt(offset / 2.0));
#endif
    }
    return self;
}

/**
 If approximate is True then only the points from SRTM grid will be
 used, otherwise a basic aproximation of nearby points will be calculated.
 
 @param lon             <#lon description#>
 @param lat             <#lat description#>
 @param approximateFlag <#approximateFlag description#>
 */
- (int)fetchElevation:(double)lon andLat:(double)lat approximate:(BOOL)approximateFlag{
    int row = -1;
    int col = -1;
    if (lon >= self.startLon && lon < self.startLon + 1 && lat >= self.startLat && lat < self.startLat + 1) {
        [self fetchRow:&row andCol:&col withLon:lon andLat:lat];
        if (row > 0 && col > 0) {
            return [self fetchElevationFromRow:row andCol:col];
        }
    }
    return -1;
}

- (int)fetchElevationFromRow:(int)row andCol:(int)col {
    int i = row * self.squareSide + col;
    [self.handle seekToFileOffset:(i*2)];
    NSData *data = [self.handle readDataOfLength:2];
    short elevation = -1;
    [data getBytes:&elevation length:2];
    
    return NSSwapBigShortToHost(elevation);
}

- (void)fetchStartPosition:(NSString *)fileName {
    //'([NS])(\d+)([EW])(\d+)\.hgt'
    // N26W098
    double lon = -1;
    double lat = -1;
    NSString *regularStr = @"([NS])(\\d+)([EW])(\\d+)";
    NSTextCheckingResult *result = [SRTMUtils checkString:fileName withRegularExpression:regularStr];
    if (result != nil) {
        NSString *strTemp = [fileName substringWithRange:NSMakeRange(1, 2)];
        if (strTemp) {
            [fileName containsString:@"N"] ? lat = [strTemp intValue] : (lat = -([strTemp intValue]));
        }
        strTemp = [fileName substringWithRange:NSMakeRange(4, 3)];
        if (strTemp) {
            [fileName containsString:@"E"] ? lon = [strTemp intValue] : (lon = -([strTemp intValue]));
        }
    }
    self.startLon = lon;
    self.startLat = lat;
#ifdef DEBUG
    NSLog(@"Lon:%f Lat:%f", self.startLon, self.startLat);
#endif
}


/**
 def get_row_and_column(self, latitude, longitude):
 return mod_math.floor((self.latitude + 1 - latitude) * float(self.square_side - 1)), \
 mod_math.floor((longitude - self.longitude) * float(self.square_side - 1))
 */
- (void)fetchRow:(int *)row andCol:(int *)col withLon:(double)lon andLat:(double)lat {
    *row = floor((self.startLat + 1 - lat) * (float)(self.squareSide - 1));
    *col = floor((lon - self.startLon) * (float)(self.squareSide - 1));
}




@end
