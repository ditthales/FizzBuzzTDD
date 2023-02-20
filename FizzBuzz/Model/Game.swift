//
//  Game.swift
//  FizzBuzz
//
//  Created by ditthales on 14/02/23.
//

import Foundation

class Game{
    
    var score: Int
    let brain: Brain
    var totalLives: Int
    var remainingLives: Int
    
    init(totalLives: Int = 3) {
        self.score = 0
        self.brain = Brain()
        self.totalLives = totalLives
        self.remainingLives = totalLives
    }
    
    func play(withMove move: Move){
        
        if move == brain.check(number: score + 1){
            self.score += 1
        } else {
            self.remainingLives -= 1
        }

    }
    
}
