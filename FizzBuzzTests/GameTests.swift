//
//  GameTests.swift
//  FizzBuzzTests
//
//  Created by ditthales on 14/02/23.
//

@testable import FizzBuzz
import XCTest


final class GameTests: XCTestCase {
    
    var brainSpy: BrainSpy!
    var game: Game!

    override func setUpWithError() throws {
        brainSpy = BrainSpy()
        game = Game(brain: brainSpy)
    }
    
    // testes se o init da classe está conforme o esperado
    
    func testGameStartsAtOne(){
        XCTAssertTrue(game.score == 1)
    }
    
    func testIfGameStartsWithMoreThanOneTotalLive() {
        XCTAssertGreaterThanOrEqual(game.totalLives, 1)
    }
    
    func testIfGameStartsWithTotalLivesEqualToRemainingLives() {
        XCTAssertEqual(game.totalLives, game.remainingLives)
    }
    
    

    // teste se o brain.correctMove está sendo chamado
    func testPlayRoundIsCallingCorrectMove() {
        let scoreCalled = game.score
        
        // when playRound is called
        game.playRound(withMove: .fizzBuzz)
       
        // then brain's correctMove is called with score
        XCTAssertTrue(brainSpy.isCorrectMoveCalled)
        XCTAssertEqual(brainSpy.numberCalledOnCorrectMove, scoreCalled)

            
    }

    func testIfIsMoveCorrecReturnsTrueWhenExpected() {
        brainSpy.correctMoveReturnedMove = .fizz
        
        let result = game.isPlayCorrect(move: .fizz)
        
        XCTAssertTrue(result)
    }
    
    func testIfIsMoveCorrecReturnsFalseWhenExpected() {
        brainSpy.correctMoveReturnedMove = .number
        
        let result = game.isPlayCorrect(move: .fizzBuzz)
        
        XCTAssertFalse(result)
    }
    
    
    // testar se vidas restantes subtrai 1
    func testPlayRoundIsCalledWithWrongMove() {
        // given correctMove returns different move than provided
        brainSpy.correctMoveReturnedMove = .number
        
        // when playRound is called with different move
        let currentRemainingLives = game.remainingLives
        let expectedScore = game.score
        
        game.playRound(withMove: .fizzBuzz)
        
        // then should subtract one from remaining lives
        let expectedRemainingLives = currentRemainingLives - 1
        XCTAssertEqual(game.remainingLives, expectedRemainingLives)
        XCTAssertEqual(game.score, expectedScore)
        
    }
    
    
    // testar se movimento correto
    func testPlayRoundIsCalledWithRightMove() {
        brainSpy.correctMoveReturnedMove = .fizz
        
        let currentGameScore = game.score
        let expectecRemainingLives = game.remainingLives
        
        game.playRound(withMove: .fizz)
        
        let expectedScore = currentGameScore + 1
        XCTAssertEqual(self.game.score, expectedScore)
        XCTAssertEqual(self.game.remainingLives, expectecRemainingLives)
         

    }

    
}
