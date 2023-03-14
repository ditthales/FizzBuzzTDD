//
//  BrainSpy.swift
//  FizzBuzz
//
//  Created by Lucas Migge de Barros on 13/03/23.
//

import Foundation

class BrainSpy: BrainProtocol {
    
    var isCorrectMoveCalled : Bool = false
    var numberCalledOnCorrectMove : Int?
    var correctMoveReturnedMove : Move = .fizz
    
    func correctMove(forNumber number: Int) -> FizzBuzz.Move {
        numberCalledOnCorrectMove = number
        isCorrectMoveCalled = true
        
        return correctMoveReturnedMove
    }
    
}
