//
//  ChipChopBrainTest.swift
//  FizzBuzzTests
//
//  Created by Lucas Migge de Barros on 14/03/23.
//

import XCTest
@testable import FizzBuzz

final class ChipChopBrainTest: XCTestCase {
    
    var brain: BrainProtocol!
    
    override func setUpWithError() throws {
        brain = ChipChopBrain()
    }
    
    func testIfReturnsChipWhenExpected() {
        let moveForScore2 = brain.correctMove(forNumber: 2)
        let moveForScore4 = brain.correctMove(forNumber: 4)
        let moveForScore8 = brain.correctMove(forNumber: 8)
        let moveForScore10 = brain.correctMove(forNumber: 10)
        
        let expectedMove: Move = .chip
        XCTAssertEqual(moveForScore2, expectedMove)
        XCTAssertEqual(moveForScore4, expectedMove)
        XCTAssertEqual(moveForScore8, expectedMove)
        XCTAssertEqual(moveForScore10, expectedMove)
        
    }
    
    func testIfReturnsChopWhenExpected() {
        let moveForScore3 = brain.correctMove(forNumber: 3)
        let moveForScore9 = brain.correctMove(forNumber: 9)
        let moveForScore15 = brain.correctMove(forNumber: 15)
        let moveForScore21 = brain.correctMove(forNumber: 21)
        
        let expectedMove: Move = .chop
        XCTAssertEqual(moveForScore3, expectedMove)
        XCTAssertEqual(moveForScore9, expectedMove)
        XCTAssertEqual(moveForScore15, expectedMove)
        XCTAssertEqual(moveForScore21, expectedMove)
        
    }
    
    func testIfReturnsChipChopWhenExpected() {
        let moveForScore6 = brain.correctMove(forNumber: 6)
        let moveForScore12 = brain.correctMove(forNumber: 12)
        let moveForScore18 = brain.correctMove(forNumber: 18)
        let moveForScore24 = brain.correctMove(forNumber: 24)
        
        let expectedMove: Move = .chipChop
        XCTAssertEqual(moveForScore6, expectedMove)
        XCTAssertEqual(moveForScore12, expectedMove)
        XCTAssertEqual(moveForScore18, expectedMove)
        XCTAssertEqual(moveForScore24, expectedMove)
    }
    
    func testIfReturnsNumberWhenExpected() {
        let moveForScore1 = brain.correctMove(forNumber: 1)
        let moveForScore5 = brain.correctMove(forNumber: 5)
        let moveForScore7 = brain.correctMove(forNumber: 7)
        let moveForScore11 = brain.correctMove(forNumber: 11)
        
        let expectedMove: Move = .number
        XCTAssertEqual(moveForScore1, expectedMove)
        XCTAssertEqual(moveForScore5, expectedMove)
        XCTAssertEqual(moveForScore7, expectedMove)
        XCTAssertEqual(moveForScore11, expectedMove)
    }
    
    
}
