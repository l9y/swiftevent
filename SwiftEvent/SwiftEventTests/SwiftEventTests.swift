//
//  SwiftEventTests.swift
//  SwiftEventTests
//
//  Created by zhiyuan wang on 17/3/9.
//  Copyright © 2017年 l9y. All rights reserved.
//

import XCTest
@testable import SwiftEvent

class SwiftEventTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEvent() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var reciveTimes = 0
        var obserStr: Observer<String>! = Observer<String>()
        
        assert(1 == Event.instance.observers["\(type(of: String.self))"]!.count)
        
        obserStr.receive = {str in
            assert("hello" == str)
            reciveTimes = reciveTimes + 1
        }
        Event.instance.post("hello")
        obserStr = nil
        Event.instance.post("hello")
        assert(1 == reciveTimes)
        assert(0 == Event.instance.observers.count)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
