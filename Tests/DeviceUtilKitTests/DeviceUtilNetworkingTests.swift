//
//  DeviceUtilNetworkingTests.swift
//  DeviceUtilKitTests
//
//  Created by arronpj on 2021/7/28.
//

import XCTest
@testable import DeviceUtilKit

class NetworkSessionMock : NetworkSession{
    
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void ){
        completionHandler(data, error)
    }
}

final class DeviceUtilNetworkingTests: XCTestCase {

    func testNetworkAPIwithInternet() throws {
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
    func testNetworkAPIwithMockClass() throws {
            let manager = DeviceUtil.Networking.Manager()
            let session = NetworkSessionMock()
            session.data = Data([0,1,0,1])
            manager.session = session
        
            let expectation = XCTestExpectation(description: "Call for data")
            let test_url1 = "https://picsum.photos/v2/list"

            let url = URL(fileURLWithPath: "url")
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
        ("testNetworkAPIwithInternet", testNetworkAPIwithInternet),
        ("testNetworkAPIwithMockClass", testNetworkAPIwithMockClass),
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
