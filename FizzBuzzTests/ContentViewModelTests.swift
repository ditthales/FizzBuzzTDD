//
//  ContentViewModelTests.swift
//  FizzBuzzTests
//
//  Created by Guilherme Souza on 14/02/23.
//

import XCTest
@testable import FizzBuzz

final class ContentViewModelTests: XCTestCase {

    var viewModel: ContentViewModel!
    
    override func setUpWithError() throws {
        viewModel = ContentViewModel()
    }
    
    
    func test1CorrectMoveIncrementsScore() {
        let scoreToBeMatched = viewModel.gameScore + 1
        
        viewModel.playButton(move: .number)
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, scoreToBeMatched)
    }
    
    func test2CorrectMovesIncrementScore() {
        let scoreToBeMatched = viewModel.gameScore + 2
        
        viewModel.playButton(move: .number)
        viewModel.playButton(move: .number)
        let newScore = viewModel.gameScore
        XCTAssertEqual(newScore, scoreToBeMatched)
    }
    
//    game aways will have a game
//    func testHasGame() {
//        XCTAssertNotNil(viewModel.game)
//    }
    
    func testIfClickScoreIsRight(){
        let scoreToBeMatched = viewModel.gameScore + 1
        
        viewModel.scorePressed()
        XCTAssertEqual(viewModel.gameScore, scoreToBeMatched)
    }
    
    func testIfClickChampagneIsRight(){
        let scoreToBeMatched = viewModel.gameScore
        
        viewModel.champagnePressed()
        XCTAssertEqual(viewModel.gameScore, scoreToBeMatched)
    }
    
    func testIfClickLightningIsRight(){
        let scoreToBeMatched = viewModel.gameScore
        
        viewModel.lightningPressed()
        XCTAssertEqual(viewModel.gameScore, scoreToBeMatched)
    }
    
    func testIfClickSpaceIsRight(){
        let scoreToBeMatched = viewModel.gameScore
        
        viewModel.spacePressed()
        XCTAssertEqual(viewModel.gameScore, scoreToBeMatched)
    }
    
    func testIfhasTotalLives() {
        XCTAssertNotNil(viewModel.totalLives)
    }
    
    func testIfPlayAgainResetsGame() {
        let scoreToBeMatched = viewModel.gameScore
        
        viewModel.playButton(move: .number)
        viewModel.playAgainPressed()
        XCTAssertEqual(viewModel.gameScore, scoreToBeMatched)
    }
    
    func testIfViewModelStartsWithPlayingState() {
        XCTAssertEqual(viewModel.state, .playing)
    }
    
    func testIfViewModelWillChangeState() {
        viewModel.playButton(move: .fizzBuzz)
        viewModel.playButton(move: .fizzBuzz)
        viewModel.playButton(move: .fizzBuzz)
        XCTAssertEqual(viewModel.state, .gameOver)
    }
    
    func testIfCurrentLevelIncreasesWhenCorrectMove() {
        viewModel.scorePressed()
        
        XCTAssertEqual(viewModel.gameScore, 2)
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
