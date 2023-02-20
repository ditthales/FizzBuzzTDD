//
//  ContentViewModel.swift
//  FizzBuzz
//
//  Created by Guilherme Souza on 14/02/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    var currentLevel: Int{
        if let safeGameScore = self.gameScore{
            return safeGameScore + 1
        }
        return 1
    }
    @Published var totalLives: Int
    @Published var remainingLives: Int
    @Published var totalLevels: String = ""
    @Published var colorBackground = "Main-Background"
    @Published var gameScore: Int?
    
    
    // how to test a private var?
    var game: Game?
    
    init(gameScore: Int? = 0, game: Game = Game()) {
        self.game = game
        self.gameScore = gameScore
        self.totalLives = game.totalLives
        self.remainingLives = game.remainingLives
        
    }
    
    func playButton(move: String) {
        guard let safeGame = self.game else { return }
        safeGame.play(move: move)
        updateInfoFromModel()
        
    }
    
    func updateInfoFromModel() {
        guard let safeGame = self.game else { return }
        self.gameScore = safeGame.score
        self.totalLives = safeGame.totalLives
        self.remainingLives = safeGame.remainingLives
    }
    
    
    func scorePressed () {
        playButton(move: "\(currentLevel)")
    }
    
    func champagnePressed () {
        playButton(move: "Fizz")
    }
    
    func lightningPressed () {
        playButton(move: "Buzz")
    }
    
    func spacePressed () {
        playButton(move: "FizzBuzz")
    }
    
    func playAgainPressed () {
        let newGame = Game()
        self.game = newGame
        updateInfoFromModel()
        
    }
}
