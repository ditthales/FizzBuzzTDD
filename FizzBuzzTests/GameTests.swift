//
//  GameTests.swift
//  FizzBuzzTests
//
//  Created by ditthales on 14/02/23.
//

@testable import FizzBuzz
import XCTest

final class GameTests: XCTestCase {

    let game = Game()
    
    func testGameStartsAtOne(){
        XCTAssertTrue(game.score == 1)
    }
    
    func testIfRightMoveIncreaseScore(){
        let scoreToBeMatched = game.score + 1
        game.playRound(withMove: .number) { _ in }
        XCTAssertEqual(game.score, scoreToBeMatched)
    }
    
    func testIfWrongMoveDontIncreaseScore(){
        let scoreToBeMatched = game.score
        game.playRound(withMove: .fizz) { _ in }
        XCTAssertEqual(game.score, scoreToBeMatched)
    }
    
    func testIfGameStartsWithMoreThanOneTotalLive() {
        XCTAssertGreaterThanOrEqual(game.totalLives, 1)
    }
    
    func testIfGameStartsWithTotalLivesEqualToRemainingLives() {
        XCTAssertEqual(game.totalLives, game.remainingLives)
    }
    
    func testIfRightMoveDontChangeLivesRemainingLives() {
        game.playRound(withMove: .number) { _ in }
        XCTAssertEqual(game.totalLives, game.remainingLives)
    }
    
    func testIfWrongMoveDecreasesRemainingLives() {
        game.playRound(withMove: .fizz) { _ in }
        XCTAssertEqual(game.totalLives, game.remainingLives + 1)
    }
    
    func testIfRightMoveReturnsTrue() {
        var isSuccess = false
        game.playRound(withMove: .number) { result in
            isSuccess = result
        }
        XCTAssertEqual(isSuccess, true)
    }
    
    func testIfWrongMoveReturnsFalse() {
        var isSuccess = true
        game.playRound(withMove: .fizz) { result in
            isSuccess = result
        }
        XCTAssertEqual(isSuccess, false)
    }
    
//    func testOnPlayScoreIncremented(){
//        _ = game.play(move: "1")
//        XCTAssertTrue(game.score == 1)
//    }
//
//    func testOnPlayTwiceScoreIncremented(){
//        _ = game.play(move: "1")
//        _ = game.play(move: "2")
//        XCTAssertTrue(game.score == 2)
//    }
//
//    func testIfFizzMoveIsRight(){
//        game.score = 2
//        let result = game.play(move: "Fizz")
//        XCTAssertEqual(result, true)
//    }
//
//    func testIfFizzMoveIsWrong(){
//        game.score = 1
//        let result = game.play(move: "Fizz")
//        XCTAssertEqual(result, false)
//    }
//
//    func testIfBuzzMoveIsRight(){
//        game.score = 4
//        let result = game.play(move: "Buzz")
//        XCTAssertEqual(result, true)
//    }
//
//    func testIfBuzzMoveIsWrong(){
//        game.score = 1
//        let result = game.play(move: "Buzz")
//        XCTAssertEqual(result, false)
//    }
//
//    func testIfFizzBuzzMoveIsRight(){
//        game.score = 14
//        let result = game.play(move: "FizzBuzz")
//        XCTAssertEqual(result, true)
//    }
//
//    func testIfFizzBuzzMoveIsWrong(){
//        game.score = 1
//        let result = game.play(move: "FizzBuzz")
//        XCTAssertEqual(result, false)
//    }
//
//    func testIfNumberMoveIsRight(){
//        game.score = 0
//        let result = game.play(move: "1")
//        XCTAssertEqual(result, true)
//    }
//
//    func testIfNumberMoveIsWrong(){
//        game.score = 1
//        let result = game.play(move: "4")
//        XCTAssertEqual(result, false)
//    }
//
//    func testIfMoveWrongScoreNotIncremented(){
//        game.score = 1
//        _ = game.play(move: "Fizz")
//        XCTAssertEqual(game.score, 1)
//    }
//

    
    
}
