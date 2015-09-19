//
//  GeoHex3.h
//  Pods
//
//  Created by karupanerura on 9/19/15.
//
//

#import <Foundation/Foundation.h>

typedef NSDictionary<NSString *,NSNumber *> geohex3_location_dict_t;
typedef NSArray<geohex3_location_dict_t *>  geohex3_locations_t;

@interface GeoHex3 : NSObject

- (nonnull instancetype)initWithX:(const NSInteger)x y:(const NSInteger)y level:(const NSUInteger)level;
- (nonnull instancetype)initWithLat:(const double)lat lng:(const double)lng level:(const NSUInteger)level;
- (nonnull instancetype)initWithCode:(nonnull const NSString *)code;
- (NSUInteger)getLevel;
- (double)getSize;
- (nonnull NSString *)getCode;
- (NSInteger)getX;
- (NSInteger)getY;
- (double)getLat;
- (double)getLng;
- (nonnull geohex3_locations_t *)getRawPolygon;

@end
