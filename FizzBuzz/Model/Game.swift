//
//  Game.swift
//  FizzBuzz
//
//  Created by ditthales on 14/02/23.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var totalLives: Int { get }
    var remainingLives: Int { get }
    
    func playRound(withMove move: Move, completionResult: @escaping (Bool) -> Void)
    
}

class Game: GameProtocol {
    
    private let brain: Brain
    var score: Int
    var totalLives: Int
    var remainingLives: Int
    
    init(totalLives: Int = 3) {
        self.brain = Brain()
        self.score = 1
        self.totalLives = totalLives
        self.remainingLives = totalLives
    }
    
    func playRound(withMove move: Move, completionResult: @escaping (Bool) -> Void){
        
        let correctMove = brain.correctMoveForNumber(number: score)
        
        if move == correctMove {
            self.score += 1
            completionResult(true)
        } else {
            self.remainingLives -= 1
            completionResult(false)
        }

    }
    
}
