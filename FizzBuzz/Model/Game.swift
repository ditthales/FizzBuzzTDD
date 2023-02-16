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
    
    init() {
        self.score = 0
        self.brain = Brain()
    }
    
    func play(move: String){
        
        if move == brain.check(number: score + 1){
            score += 1
        }
    }
    
}
