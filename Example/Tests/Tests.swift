import UIKit
import XCTest
import GeoHex3

class Tests: XCTestCase {
    func testInitWithLocation() {
        let geohex : GeoHex3 = GeoHex3(lat: 35.622866, lng: 139.725552, level: 7)
        XCTAssertEqual(geohex.getCode(), "XM4885168")
    }

    func testInitWithXY() {
        let geohex : GeoHex3 = GeoHex3(x: 11254, y: -4025, level: 7)
        XCTAssertEqual(geohex.getCode(), "XM4885168")
    }

    func testInitWithCode() {
        let geohex : GeoHex3 = GeoHex3(code: "XM4885168")
        XCTAssertEqual(geohex.getCode(), "XM4885168")
        XCTAssertEqual(geohex.getX(), 11254)
        XCTAssertEqual(geohex.getY(), -4025)
        XCTAssertEqual(geohex.getLevel(), 7)
    }    
}
