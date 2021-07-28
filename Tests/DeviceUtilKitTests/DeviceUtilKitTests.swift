import XCTest
@testable import DeviceUtilKit

final class DeviceUtilKitTests: XCTestCase {
    //test color1
    
    func testVersionEqual() {
        let v = DeviceUtilKit().version
        XCTAssertEqual(v, "0.1.1")
    }
    func testColorAppRedEqual() {
        let c = DeviceUtil.colorFrom(hexStr : "FF0000")
        XCTAssertEqual(c, .red)
    }

    static var allTests = [
        ("testVersionEqual", testVersionEqual),
        ("testColorAppRedEqual", testColorAppRedEqual),
    ]
}
