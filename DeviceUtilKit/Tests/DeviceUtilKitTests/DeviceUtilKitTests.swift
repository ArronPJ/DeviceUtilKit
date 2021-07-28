import XCTest
@testable import DeviceUtilKit

final class DeviceUtilKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DeviceUtilKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
