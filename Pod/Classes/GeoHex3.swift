//
//  GeoHex3.swift
//  Pods
//
//  Created by karupanerura on 9/19/15.
//
//

import Foundation
import CoreLocation

extension GeoHex3 {
    var x     : Int    { return self.getX()     }
    var y     : Int    { return self.getY()     }
    var lat   : Double { return self.getLat()   }
    var lng   : Double { return self.getLng()   }
    var size  : Double { return self.getSize()  }
    var level : UInt   { return self.getLevel() }
    var code  : String { return self.getCode()  }
}

extension GeoHex3 {
    var location : CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.getLat(), self.getLng())
    }
}

extension GeoHex3 {
    final class Polygon {
        let top    : LocationPair
        let middle : LocationPair
        let bottom : LocationPair

        struct LocationPair {
            let left  : CLLocationCoordinate2D
            let rigth : CLLocationCoordinate2D
        }

        private init (geohex : GeoHex3) {
            let polygon : [[String:NSNumber]] = geohex.getRawPolygon()
            assert(polygon.count == 6)

            let locations  : [CLLocationCoordinate2D] = polygon.map {
                (location : [String:NSNumber]) -> CLLocationCoordinate2D in

                assert(location["lat"] != nil)
                assert(location["lng"] != nil)
                assert(location.count == 2)

                let lat : Double = location["lat"]!.doubleValue
                let lng : Double = location["lng"]!.doubleValue
                return CLLocationCoordinate2DMake(lat, lng)
            }

            self.top    = LocationPair(left: locations[0], rigth: locations[1])
            self.middle = LocationPair(left: locations[2], rigth: locations[3])
            self.bottom = LocationPair(left: locations[4], rigth: locations[5])
        }
    }

    var polygon : Polygon {
        return Polygon(geohex: self)
    }
}
