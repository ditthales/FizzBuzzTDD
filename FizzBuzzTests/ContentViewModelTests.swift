//
//  ContentViewModelTests.swift
//  FizzBuzzTests
//
//  Created by Guilherme Souza on 14/02/23.
//

import XCTest
@testable import FizzBuzz

final class ContentViewModelTests: XCTestCase {

    let viewModel = ContentViewModel()

    
    func testMove1IncrementsScore() {
        viewModel.play(move: "1")
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, 1)
    }
    
    func testMove2IncrementScore() {
        viewModel.play(move: "1")
        viewModel.play(move: "2")
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, 2)
    }
    
    func testHasGame() {
        XCTAssertNotNil(viewModel.game)
    }
    
//    func scorePressed () {
//
//    }
//
//    func champagnePressed () {
//
//    }
//
//    func lightningPressed () {
//
//    }
//
//    func spacePressed () {
//
//    }
//
//    func playAgainPressed () {
//
//    }
}
