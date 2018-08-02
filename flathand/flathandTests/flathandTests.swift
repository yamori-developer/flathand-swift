//
//  flathandTests.swift
//  flathandTests
//
//  Created by yamori-developer on 2018/07/11.
//  Copyright © 2018年 yamori-developer. All rights reserved.
//

import XCTest
@testable import flathand

class flathandTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        waitForBlock(description: ""){ fulfill in
            // create the url-request
            let urlString = "http://127.0.0.1:8081/api/v1/signin"
            let request = NSMutableURLRequest(url: URL(string: urlString)!)
            
            // set the method(HTTP-GET)
            request.httpMethod = "POST"
            
            // use NSURLSessionDataTask
            let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                if (response as? HTTPURLResponse)?.statusCode != 200 {
                    XCTFail()
                    fulfill()
                }
//                if (error == nil) {
//                    let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
//                    print(result)
//                    fulfill()
//                } else {
//                    print(error ?? "errorだよ")
//                    fulfill()
//                }
            })
            task.resume()
        }

    }
    
    typealias FullFillBlock = () -> Void
    func waitForBlock(description: String, timeout: TimeInterval = 10, closure: (@escaping FullFillBlock ) -> Void ){
        closure(expectation(description: description).fulfill)
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
