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
    var gameSpy: GameSpy!
    
    override func setUpWithError() throws {
        gameSpy = GameSpy()
        viewModel = ContentViewModel(game: gameSpy)
    }
    
    func testIfBeginsWithLives() {
        XCTAssertGreaterThan(viewModel.initialLives, 0)
    }
    
    func testIfBeginsWithPlayingState() {
        let expectedState: ContentViewModel.State = .playing
        
        XCTAssertEqual(viewModel.state, expectedState)
    }
    
    func testIfStateIsPlayingWhenHasLives() {
        gameSpy.remainingLives = 1
        
        let expectedState: ContentViewModel.State = .playing
        
        XCTAssertEqual(viewModel.state, expectedState)
    }
    
    func testIfStateChangesToGameOverWhenNoLives() {
        gameSpy.remainingLives = 0
        
        let expectedState: ContentViewModel.State = .gameOver
        
        XCTAssertEqual(viewModel.state, expectedState)
        
    }
    
    func testIfPlayButtonIsCallingPlayRound() {
        viewModel.playButton(move: .fizz)
        
        XCTAssertTrue(gameSpy.isPlayRoundCalled)
        XCTAssertTrue(gameSpy.isPlayCorrectCalled)
    }
    

    func testIfUpdateInfoFromModelWorks() {
        viewModel.gameScore = 1
        viewModel.initialLives = 5
        viewModel.remainingLives = 4
        
        let expectedGameScore = 5
        let expectedInitialLives = 3
        let expectedRemainingLies = 2
        
        gameSpy.score = expectedGameScore
        gameSpy.totalLives = expectedInitialLives
        gameSpy.remainingLives = expectedRemainingLies
        
        
        viewModel.updateInfoFromModel()
        
        
        XCTAssertEqual(viewModel.gameScore, expectedGameScore)
        XCTAssertEqual(viewModel.initialLives, expectedInitialLives)
        XCTAssertEqual(viewModel.remainingLives, expectedRemainingLies)
        
    }
    
    func testIfNumberPressedWillIncreaseScoreWhenExpected() {
        gameSpy.expectedCorrectMove = .number
        let currentScore = viewModel.gameScore
        
        viewModel.numberPressed()
        
        let expectedScore = currentScore + 1
        XCTAssertEqual(viewModel.gameScore, expectedScore)
        
    }
    
    func testIfChampagnePressedWillIncreaseScoreWhenExpected() {
        gameSpy.expectedCorrectMove = .fizz
        let currentScore = viewModel.gameScore
        
        viewModel.champagnePressed()
        
        let expectedScore = currentScore + 1
        XCTAssertEqual(viewModel.gameScore, expectedScore)
        
    }
    
    func testIfLightningPressedWillIncreaseScoreWhenExpected() {
        gameSpy.expectedCorrectMove = .buzz
        let currentScore = viewModel.gameScore
        
        viewModel.lightningPressed()
        
        let expectedScore = currentScore + 1
        XCTAssertEqual(viewModel.gameScore, expectedScore)
        
    }
    
    func testIfSpacePressedWillIncreaseScoreWhenExpected() {
        gameSpy.expectedCorrectMove = .fizzBuzz
        let currentScore = viewModel.gameScore
        
        viewModel.spacePressed()
        
        let expectedScore = currentScore + 1
        XCTAssertEqual(viewModel.gameScore, expectedScore)
        
    }
    
    
    func testIfPlayAgainResetsGame() {
        gameSpy.expectedCorrectMove = .number
        let expectedScore = viewModel.gameScore
        
        viewModel.playButton(move: .number)
        
        viewModel.playAgainPressed()
        XCTAssertEqual(viewModel.gameScore, expectedScore)
    }
    
    
    func testIfViewModelWillChangeState() {
        gameSpy.remainingLives = 1
        gameSpy.expectedCorrectMove = .fizz
        
        viewModel.lightningPressed()
   
        XCTAssertEqual(viewModel.state, .gameOver)
    }
    
    func testIfBackgroundViewWillChangeOnWrongMove() {
        gameSpy.expectedCorrectMove = .fizzBuzz
        let currentBackground = viewModel.colorBackground
        
        viewModel.numberPressed()
        
        XCTAssertNotEqual(viewModel.colorBackground, currentBackground)
        
    }
    
    func TestIfBackgroundWontChangeOnRightMove() {
        gameSpy.expectedCorrectMove = .buzz
        let expectedBackground = viewModel.colorBackground
        
        viewModel.lightningPressed()
        
        XCTAssertEqual(viewModel.colorBackground, expectedBackground)
        
    }
    
    func testIfBackgroundWillChangeOnGameOver() {
        let currentBackground = viewModel.colorBackground
        gameSpy.remainingLives = 1
        gameSpy.expectedCorrectMove = .fizz
        
        viewModel.numberPressed()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            XCTAssertNotEqual(self.viewModel.colorBackground, currentBackground)
        }
        
    }
    
}
