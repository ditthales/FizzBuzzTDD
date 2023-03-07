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
        
    @Published var totalLives: Int
    @Published var remainingLives: Int
    @Published var colorBackground: String
    @Published var gameScore: Int
    
    var state: State {
        if game.remainingLives > 0 {
            return .playing
        } else {
            return .gameOver
        }
    }
    
    
    // how to test a private var?
    private var game: GameProtocol
    
    init(game: GameProtocol = Game()) {
        self.game = game
        self.gameScore = game.score
        self.totalLives = game.totalLives
        self.remainingLives = game.remainingLives
        self.colorBackground = "Main-Background"
        
    }
    
    func playButton(move: Move) {
        
        game.playRound(withMove: move) { isSuccess in
            if self.state == .gameOver {
                self.gameOverAnimation()
                return
            }
            
            if !isSuccess {
                self.wrongMoveAnimation()
            }
        }
        
        updateInfoFromModel()
        
    }
    
    func updateInfoFromModel() {
        self.gameScore = game.score
        self.totalLives = game.totalLives
        self.remainingLives = game.remainingLives
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
        withAnimation(.easeInOut(duration: 0.5)) {
            self.colorBackground = "Main-Background"
        }
        let newGame = Game()
        self.game = newGame
        updateInfoFromModel()
        
    }
    
    func gameOverAnimation() {
        withAnimation(.easeInOut(duration: 0.5)) {
            self.colorBackground = "Fail-Background"
        }
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
