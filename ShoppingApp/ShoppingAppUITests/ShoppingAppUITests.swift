//
//  ShoppingAppUITests.swift
//  ShoppingAppUITests
//
//  Created by yangsu.baek on 2024/03/07.
//

import XCTest



//
//Goto projects settings -> Select uitests target -> build phases tab -> add your swift file to compile sources


final class ShoppingAppUITests: XCTestCase {
  

    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
