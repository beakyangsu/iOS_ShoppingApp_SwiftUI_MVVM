//
//  ShoppingAppTests.swift
//  ShoppingAppTests
//
//  Created by yangsu.baek on 2024/03/07.
//

import XCTest
@testable import ShoppingApp

final class ShoppingAppTests: XCTestCase {
    let cartManager = CartManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_CartManger_productAdd() {
        cartManager.addToCart(product: productList[0])
        XCTAssertEqual(1, cartManager.products.count)
    }

    func test_CartManger_productRemove_success() {
        cartManager.removeFromCart(product: productList[0])
        XCTAssertEqual(0, cartManager.products.count)
    }

    func test_CartManger_productRemove_fail_App_not_Crashing() {
        //productList[1] not in cartManaget products
        cartManager.removeFromCart(product: productList[1])
        XCTAssertEqual(0, cartManager.products.count)
    }

}
