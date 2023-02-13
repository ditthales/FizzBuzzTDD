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

    func testIsDivisibleByThree(){
        let result = brain.isDivisibleBy(divisor: 3, number: 3)
        XCTAssertEqual(result, true)
    }
    
    func testIsntDivisibleByThree(){
        let result = brain.isDivisibleBy(divisor: 3, number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFive(){
        let result = brain.isDivisibleBy(divisor: 5, number: 5)
        XCTAssertEqual(result, true)
    }
    
    func testIsntDivisibleByFive(){
        let result = brain.isDivisibleBy(divisor: 5, number: 1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFiveAndThree(){
        let result = brain.isDivisibleBy(divisor: 15, number: 15)
        XCTAssertEqual(result, true)
    }
    
    func testIsntDivisibleByFiveAndThree(){
        let result = brain.isDivisibleBy(divisor: 15, number: 1)
        XCTAssertEqual(result, false)
    }
        

}
