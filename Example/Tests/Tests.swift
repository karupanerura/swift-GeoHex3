import UIKit
import XCTest
import GeoHex3

class Tests: XCTestCase {
    func testInitWithLocation() {
        let geohex : GeoHex3 = GeoHex3(lat: 35.622866, lng: 139.725552, level: 7)
        XCTAssertEqual(geohex.code, "XM4885168")
        XCTAssertEqual(geohex.x, 11254)
        XCTAssertEqual(geohex.y, -4025)
        XCTAssertEqual(geohex.lat, 35.6227556354106)
        XCTAssertEqual(geohex.lng, 139.725651577503)
        XCTAssertEqual(geohex.level, 7)
    }

    func testInitWithXY() {
        let geohex : GeoHex3 = GeoHex3(x: 11254, y: -4025, level: 7)
        XCTAssertEqual(geohex.code, "XM4885168")
        XCTAssertEqual(geohex.x, 11254)
        XCTAssertEqual(geohex.y, -4025)
        XCTAssertEqual(geohex.lat, 35.6227556354106)
        XCTAssertEqual(geohex.lng, 139.725651577503)
        XCTAssertEqual(geohex.level, 7)
    }

    func testInitWithCode() {
        let geohex : GeoHex3 = GeoHex3(code: "XM4885168")
        XCTAssertEqual(geohex.code, "XM4885168")
        XCTAssertEqual(geohex.x, 11254)
        XCTAssertEqual(geohex.y, -4025)
        XCTAssertEqual(geohex.lat, 35.6227556354106)
        XCTAssertEqual(geohex.lng, 139.725651577503)
        XCTAssertEqual(geohex.level, 7)
    }

    func testPolygons() {
        let geohex : GeoHex3 = GeoHex3(code: "XM4885168")
        let _ = geohex.polygon
        XCTAssert(true)
    }
}
