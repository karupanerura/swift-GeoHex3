//
//  GeoHex3.h
//  Pods
//
//  Created by karupanerura on 9/19/15.
//
//

#import <Foundation/Foundation.h>
#import <stdint.h>

typedef NSDictionary<NSString *,NSNumber *> geohex3_location_dict_t;
typedef NSArray<geohex3_location_dict_t *>  geohex3_locations_t;

@interface KRGeoHex3 : NSObject

- (nonnull instancetype)initWithX:(const int64_t)x y:(const int64_t)y level:(const NSUInteger)level;
- (nonnull instancetype)initWithLat:(const double)lat lng:(const double)lng level:(const NSUInteger)level;
- (nonnull instancetype)initWithCode:(nonnull const NSString *)code;
- (NSUInteger)getLevel;
- (double)getSize;
- (nonnull NSString *)getCode;
- (int64_t)getX;
- (int64_t)getY;
- (double)getLat;
- (double)getLng;
- (nonnull geohex3_locations_t *)getPolygon;
+ (double)getHexSize:(const NSUInteger)level;

@end
