//
//  Game.swift
//  FizzBuzz
//
//  Created by ditthales on 14/02/23.
//

import Foundation

class Game: GameProtocol {
    
    private let brain: BrainProtocol
    var score: Int
    var totalLives: Int
    var remainingLives: Int
    
    init(totalLives: Int = 3, brain: BrainProtocol = FizzBuzzBrain()) {
        self.brain = brain
        self.score = 1
        self.totalLives = totalLives
        self.remainingLives = totalLives
    }
    
    func isPlayCorrect(move: Move) -> Bool {
        let expectMove = brain.correctMove(forNumber: score)
        return move == expectMove
    }
    
    func playRound(withMove move: Move){
        if isPlayCorrect(move: move) {
            self.score += 1
        } else {
            self.remainingLives -= 1
        }

    }
    
}
