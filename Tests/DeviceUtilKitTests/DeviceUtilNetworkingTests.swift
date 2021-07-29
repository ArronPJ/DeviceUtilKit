//
//  DeviceUtilNetworkingTests.swift
//  DeviceUtilKitTests
//
//  Created by arronpj on 2021/7/28.
//

import XCTest
@testable import DeviceUtilKit

final class DeviceUtilNetworkingTests: XCTestCase {

    func testNetworkAPI1() throws {
        let manager = DeviceUtil.Networking.Manager()
        let expectation = XCTestExpectation(description: "Call for data")
        let test_url1 = "https://picsum.photos/v2/list"
        
        guard let url = URL(string: test_url1) else {
            return XCTFail("Could not create URL properly")
        }
        manager.loadData(from: url){ result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    static var allTests = [
        ("testNetworkAPI1", testNetworkAPI1),
    ]
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
