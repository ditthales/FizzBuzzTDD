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
    
    func play(move: String) -> Bool{
        score += 1
        
        let result = brain.check(number: score)
        
        if result == move{
            return true
        }else{
            return false
        }
    }
    
}
