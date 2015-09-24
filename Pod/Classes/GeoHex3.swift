//
//  GeoHex3.swift
//  Pods
//
//  Created by karupanerura on 9/19/15.
//
//

import Foundation
import CoreLocation

public class GeoHex3 {
    private let geohex : KRGeoHex3
    private var polygonCache : Polygon?

    public init (x: Int, y: Int, level: UInt) {
        self.geohex = KRGeoHex3(x: x, y: y, level: level)
    }

    public init (lat: Double, lng: Double, level: UInt) {
        self.geohex = KRGeoHex3(lat: lat, lng: lng, level: level)
    }

    public init (code: String) {
        self.geohex = KRGeoHex3(code: code)
    }

    public convenience init (location: CLLocationCoordinate2D, level: UInt) {
        self.init(lat: location.latitude, lng: location.longitude, level: level)
    }

    public class func getHexSize(level: UInt) -> Double {
        return KRGeoHex3.getHexSize(level)
    }
}

extension GeoHex3 {
    public var x     : Int    { return self.geohex.getX()     }
    public var y     : Int    { return self.geohex.getY()     }
    public var lat   : Double { return self.geohex.getLat()   }
    public var lng   : Double { return self.geohex.getLng()   }
    public var size  : Double { return self.geohex.getSize()  }
    public var level : UInt   { return self.geohex.getLevel() }
    public var code  : String { return self.geohex.getCode()  }
}

extension GeoHex3 {
    public var location : CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.geohex.getLat(), self.geohex.getLng())
    }
}

extension GeoHex3 : Equatable {}
public func ==(lhs: GeoHex3, rhs: GeoHex3) -> Bool {
    return lhs.code == rhs.code
}

extension GeoHex3 : Hashable {
    public var hashValue: Int { return self.code.hashValue }
}

extension GeoHex3 {
    final public class Polygon {
        public let top    : LocationPair
        public let middle : LocationPair
        public let bottom : LocationPair

        public struct LocationPair {
            public let left  : CLLocationCoordinate2D
            public let rigth : CLLocationCoordinate2D
        }

        private init (geohex : GeoHex3) {
            let polygon : [[String:NSNumber]] = geohex.geohex.getPolygon()
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

    public var polygon : Polygon {
        if let polygon : Polygon = polygonCache {
            return polygon
        }

        let polygon : Polygon = Polygon(geohex: self)
        self.polygonCache = polygon
        return polygon
    }
}
