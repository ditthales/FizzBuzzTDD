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
        viewModel.playButton(move: "1")
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, 1)
    }
    
    func testMove2IncrementScore() {
        viewModel.playButton(move: "1")
        viewModel.playButton(move: "2")
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, 2)
    }
    
    func testHasGame() {
        XCTAssertNotNil(viewModel.game)
    }
    
    func testIfClickScoreIsRight(){
        viewModel.scorePressed()
        XCTAssertEqual(viewModel.gameScore, 1)
    }
    
    func testIfClickChampagneIsRight(){
        viewModel.champagnePressed()
        XCTAssertEqual(viewModel.gameScore, 0)
    }
    
    func testIfClickLightningIsRight(){
        viewModel.lightningPressed()
        XCTAssertEqual(viewModel.gameScore, 0)
    }
    
    func testIfClickSpaceIsRight(){
        viewModel.spacePressed()
        XCTAssertEqual(viewModel.gameScore, 0)
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
