import XCTest
@testable import DeviceUtilKit

final class DeviceUtilKitTests: XCTestCase {
    //test color1
    
    func testVersionEqual() {
        let v = DeviceUtilKit().version
        XCTAssertEqual(v, "0.2.1")
    }
//    func testColorAppRedEqual() {
//        //let c = DeviceUtil.colorFromHexString("#ff0000")
//        let color = DeviceUtil.colorFrom(hex: "FF0000")
//        XCTAssertEqual(color, .red)
//    }
    func testRazeColorEqual(){
        //razeColor
        let color1 = DeviceUtil.colorFrom(hex: "006736")
        let color2 = DeviceUtil.razeColor
        
        XCTAssertEqual(color1, color2)
    }

    static var allTests = [
        ("testVersionEqual", testVersionEqual),
        ("testRazeColorEqual", testRazeColorEqual),
    ]
}
