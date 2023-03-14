//
//  ChipChopBrain.swift
//  FizzBuzz
//
//  Created by Lucas Migge de Barros on 14/03/23.
//

import Foundation

class ChipChopBrain: BrainProtocol {
    
    private func isDivisibleBy(divisor: Int, number: Int) -> Bool{
        return number % divisor == 0
    }
    
    func correctMove(forNumber number: Int) -> Move {
        if isDivisibleBy(divisor: 6, number: number){
            return .chipChop
        } else if isDivisibleBy(divisor: 3, number: number){
            return .chop
        } else if isDivisibleBy(divisor: 2, number: number){
            return .chip
        } else {
            return .number
        }
    }
    
    
}
