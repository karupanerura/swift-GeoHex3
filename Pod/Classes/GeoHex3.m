//
//  GeoHex3.m
//  Pods
//
//  Created by karupanerura on 9/19/15.
//
//

#import "GeoHex3.h"
#import "lib/geohex3.h"

@interface GeoHex3 () {
    @private
    geohex_t geohex;
}
@end

@implementation GeoHex3

- (nonnull instancetype)initWithX:(const NSInteger)x y:(const NSInteger)y level:(const NSUInteger)level
{
    self = [super init];
    if (self) {
        const geohex_coordinate_t coordinate = geohex_coordinate(x, y);
        geohex = geohex_get_zone_by_coordinate(coordinate, (geohex_level_t)level);
    }
    return self;
}

- (nonnull instancetype)initWithLat:(const double)lat lng:(const double)lng level:(const NSUInteger)level
{
    self = [super init];
    if (self) {
        const geohex_location_t location = geohex_location((long double)lat, (long double)lng);
        geohex = geohex_get_zone_by_location(location, (geohex_level_t)level);
    }
    return self;
}

- (nonnull instancetype)initWithCode:(nonnull const NSString *)code
{
    self = [super init];
    if (self) {
        geohex = geohex_get_zone_by_code([code UTF8String]);
    }
    return self;
}

- (NSUInteger)getLevel
{
    return (NSUInteger)geohex.level;
}

- (double)getSize
{
    return (double)geohex.size;
}

- (nonnull NSString *)getCode
{
    return [NSString stringWithCString:geohex.code encoding:NSUTF8StringEncoding];
}

- (NSInteger)getX
{
    return geohex.coordinate.x;
}

- (NSInteger)getY
{
    return geohex.coordinate.y;
}

- (double)getLat
{
    return (double)geohex.location.lat;
}

- (double)getLng
{
    return (double)geohex.location.lng;
}

- (nonnull geohex3_locations_t *)getRawPolygon
{
    const geohex_polygon_t polygon = geohex_get_hex_polygon(&geohex);

    NSMutableArray<geohex3_location_dict_t *> * locations = [NSMutableArray array];

    {
        geohex3_location_dict_t * location = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"lat", [[NSNumber alloc] initWithDouble:(double)polygon.top.right.lat],
            @"lng", [[NSNumber alloc] initWithDouble:(double)polygon.top.right.lng],
            nil
        ];
        [locations addObject:location];
    }
    {
        geohex3_location_dict_t * location = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"lat", [[NSNumber alloc] initWithDouble:(double)polygon.top.left.lat],
            @"lng", [[NSNumber alloc] initWithDouble:(double)polygon.top.left.lng],
            nil
        ];
        [locations addObject:location];
    }
    {
        geohex3_location_dict_t * location = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"lat", [[NSNumber alloc] initWithDouble:(double)polygon.middle.right.lat],
            @"lng", [[NSNumber alloc] initWithDouble:(double)polygon.middle.right.lng],
            nil
        ];
        [locations addObject:location];
    }
    {
        geohex3_location_dict_t * location = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"lat", [[NSNumber alloc] initWithDouble:(double)polygon.middle.left.lat],
            @"lng", [[NSNumber alloc] initWithDouble:(double)polygon.middle.left.lng],
            nil
        ];
        [locations addObject:location];
    }
    {
        geohex3_location_dict_t * location = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"lat", [[NSNumber alloc] initWithDouble:(double)polygon.bottom.right.lat],
            @"lng", [[NSNumber alloc] initWithDouble:(double)polygon.bottom.right.lng],
            nil
        ];
        [locations addObject:location];
    }
    {
        geohex3_location_dict_t * location = [[NSDictionary alloc] initWithObjectsAndKeys:
            @"lat", [[NSNumber alloc] initWithDouble:(double)polygon.bottom.left.lat],
            @"lng", [[NSNumber alloc] initWithDouble:(double)polygon.bottom.left.lng],
            nil
        ];
        [locations addObject:location];
    }

    return locations;
}

@end
