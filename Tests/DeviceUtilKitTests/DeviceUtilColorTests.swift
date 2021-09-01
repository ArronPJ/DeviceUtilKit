import XCTest
@testable import DeviceUtilKit

final class DeviceUtilColorTests: XCTestCase {
    //test color1
    
    func testVersionEqual() {
        let v = DeviceUtilKit().version
        XCTAssertEqual(v, "0.3.7")
    }

    func testRazeColorEqual(){

        let color1 = DeviceUtil.Color.fromHex("006736")
        let color2 = DeviceUtil.Color.razeColor
        
        XCTAssertEqual(color1, color2)
    }

    static var allTests = [
        ("testVersionEqual", testVersionEqual),
        ("testRazeColorEqual", testRazeColorEqual),
    ]
}
