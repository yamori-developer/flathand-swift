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
        let url = URL(string: "http://localhost:8081/api/v1/unknown")!
        let result = URLSession.shared.synchronousDataTask(with: url)
        print("hogehoge")
        print(result.code)
        XCTAssert(result.code == 200)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension URLSession {
    
    /*
     * synchronousDataTask
     *
     * Httpデータを同期的に取得します。スレッドをブロックするので使用に注意してください。
     */
    
    func synchronousDataTask(with request:URLRequest) -> (data:Data?, response:URLResponse?, error:Error?, code:Int) {
        let semaphore = DispatchSemaphore(value: 0)
        var _dat : Data?
        var _res : URLResponse?
        var _err : Error?
        var _code : Int?
        self.dataTask(with: request) { dat, res, err in
            if let httpres = res as? HTTPURLResponse {
                print("statusCode: \(httpres.statusCode)")
                _dat = dat; _res = res; _err = err; _code = httpres.statusCode;
                semaphore.signal()
            }
            }.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        return (_dat, _res, _err, _code!)
    }
    
    func synchronousDataTask(with url:URL) -> (data:Data?, response:URLResponse?, error:Error?, code:Int) {
        return self.synchronousDataTask(with: URLRequest(url: url))
    }

}
