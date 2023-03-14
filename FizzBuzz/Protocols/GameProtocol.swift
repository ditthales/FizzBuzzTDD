//
//  GameProtocol.swift
//  FizzBuzz
//
//  Created by Lucas Migge de Barros on 13/03/23.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var totalLives: Int { get }
    var remainingLives: Int { get }
    
    func isPlayCorrect(move: Move) -> Bool
    
    func playRound(withMove move: Move)
    
}
