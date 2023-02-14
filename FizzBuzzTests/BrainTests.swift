//
//  BrainTests.swift
//  FizzBuzzTests
//
//  Created by ditthales on 13/02/23.
//

@testable import FizzBuzz
import XCTest

final class BrainTests: XCTestCase {
    
    let brain = Brain()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIsDivisibleByThree() {
        XCTAssertTrue(brain.isDivisibleBy(divisor: 3, number: 9))
        XCTAssertTrue(brain.isDivisibleBy(divisor: 3, number: 12))
        
        XCTAssertFalse(brain.isDivisibleBy(divisor: 3, number: 7))
        XCTAssertFalse(brain.isDivisibleBy(divisor: 3, number: 11))
    }
    
    func testIsDivisibleByFive() {
        XCTAssertTrue(brain.isDivisibleBy(divisor: 5, number: 10))
        XCTAssertTrue(brain.isDivisibleBy(divisor: 5, number: 25))
        
        XCTAssertFalse(brain.isDivisibleBy(divisor: 5, number: 7))
        XCTAssertFalse(brain.isDivisibleBy(divisor: 5, number: 11))
    }
    
    func testIsDivisibleByThreeAndFive() {
        XCTAssertTrue(brain.isDivisibleBy(divisor: 3, number: 15))
        XCTAssertFalse(brain.isDivisibleBy(divisor: 3, number: 7))
        
        XCTAssertTrue(brain.isDivisibleBy(divisor: 5, number: 15))
        XCTAssertFalse(brain.isDivisibleBy(divisor: 5, number: 9))
        
        XCTAssertTrue(brain.isDivisibleBy(divisor: 15, number: 15))
        XCTAssertFalse(brain.isDivisibleBy(divisor: 15, number: 10))
    }
    

}
