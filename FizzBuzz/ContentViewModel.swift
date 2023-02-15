//
//  ContentViewModel.swift
//  FizzBuzz
//
//  Created by Guilherme Souza on 14/02/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var currentLevel: String = ""
    @Published var totalLevels: String = ""
    @Published var colorBackground = "Main-Background"
    @Published var gameScore: Int?
    
    // how to test a private var?
    var game: Game?
    
    init(gameScore: Int? = 0, game: Game = Game()) {
        self.gameScore = gameScore
        self.game = game
        
    }
    
    func play(move: String) {
        guard let safeGame = self.game else { return }
        let _ = safeGame.play(move: move)
        gameScore = safeGame.score
    }
    
    
    func scorePressed () {
        
    }
    
    func champagnePressed () {
        
    }
    
    func lightningPressed () {
        
    }
    
    func spacePressed () {
        
    }
    
    func playAgainPressed () {
        
    }
}
