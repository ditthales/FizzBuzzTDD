//
//  ContentViewModel.swift
//  FizzBuzz
//
//  Created by Guilherme Souza on 14/02/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    enum State {
        case playing, gameOver
    }
    
    var currentLevel: Int{
        if let safeGameScore = self.gameScore{
            return safeGameScore + 1
        }
        return 1
    }
    
    @Published var totalLives: Int
    @Published var remainingLives: Int
    @Published var colorBackground: String
    @Published var gameScore: Int?
    
    var state: State {
        guard let safeGame = game else { return .gameOver}
        if safeGame.remainingLives > 0 {
            return .playing
        } else {
            return .gameOver
        }
    }
    
    
    // how to test a private var?
    var game: Game?
    
    init(gameScore: Int? = 0, game: Game = Game()) {
        self.game = game
        self.gameScore = gameScore
        self.totalLives = game.totalLives
        self.remainingLives = game.remainingLives
        self.colorBackground = "Main-Background"
        
    }
    
    func playButton(move: Move) {
        guard let safeGame = self.game else { return }
        safeGame.play(withMove: move) { isSuccess in
            if !isSuccess {
                self.wrongMoveAnimation()
            }
        }
        updateInfoFromModel()
        
    }
    
    
    func updateInfoFromModel() {
        guard let safeGame = self.game else { return }
        self.gameScore = safeGame.score
        self.totalLives = safeGame.totalLives
        self.remainingLives = safeGame.remainingLives
    }
    
    
    func scorePressed () {
        playButton(move: .number)
    }
    
    func champagnePressed () {
        playButton(move: .fizz)
    }
    
    func lightningPressed () {
        playButton(move: .buzz)
    }
    
    func spacePressed () {
        playButton(move: .fizzBuzz)
    }
    
    func playAgainPressed () {
        let newGame = Game()
        self.game = newGame
        updateInfoFromModel()
        
    }
    
    func wrongMoveAnimation() {
        withAnimation(.easeInOut(duration: 0.25)) {
            self.colorBackground = "Fail-Background"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.colorBackground = "Main-Background"
                }
            }
        }
    }
}
