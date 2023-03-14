//
//  BrainTests.swift
//  FizzBuzzTests
//
//  Created by ditthales on 13/02/23.
//

@testable import FizzBuzz
import XCTest

final class FizzBuzzBrainTests: XCTestCase {
    
    let brain = FizzBuzzBrain()
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
    
    
    func testSayFizz(){
        let result = brain.correctMove(forNumber: 3)
        XCTAssertEqual(result, Move.fizz)
    }
    
    func testSayBuzz(){
        let result = brain.correctMove(forNumber: 5)
        XCTAssertEqual(result, Move.buzz)
    }
    
    func testSayFizzBuzz(){
        let result = brain.correctMove(forNumber: 15)
        XCTAssertEqual(result, Move.fizzBuzz)
    }
    
    func testIfNumberIsOne(){
        let result = brain.correctMove(forNumber: 1)
        XCTAssertEqual(result, Move.number)
    }
    
    
    

}
