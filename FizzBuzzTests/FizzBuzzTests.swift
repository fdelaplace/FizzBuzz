//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by François Delaplace on 05/07/2021.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tuples = [(divider: 3, message: "fizz"), (divider: 5, message: "buzz")]
        let results = FizzBuzzGame.fizzBuzz(tuples: tuples, limit: 15)
        let fizz3Buzz5Limit15 = ["1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz"]
        XCTAssertTrue(results.elementsEqual(fizz3Buzz5Limit15))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
