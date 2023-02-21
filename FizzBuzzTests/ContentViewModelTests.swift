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
        viewModel.playButton(move: .number)
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, 1)
    }
    
    func testMove2IncrementScore() {
        viewModel.playButton(move: .number)
        viewModel.playButton(move: .number)
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
    
    func testIfhasTotalLives() {
        XCTAssertNotNil(viewModel.totalLives)
    }
    
    func testIfPlayAgainResetsGame() {
        viewModel.playButton(move: .number)
        viewModel.playAgainPressed()
        XCTAssertEqual(viewModel.gameScore, 0)
    }
    
    func testIfViewModelStartsWithPlayingState() {
        XCTAssertEqual(viewModel.state, .playing)
    }
    
    func testIfViewModelWillChangeState() {
        viewModel.game?.remainingLives = 0
        XCTAssertEqual(viewModel.state, .gameOver)
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
