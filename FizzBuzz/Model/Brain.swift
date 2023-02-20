//
//  Brain.swift
//  FizzBuzz
//
//  Created by ditthales on 13/02/23.
//

import Foundation

class Brain{
    func isDivisibleBy(divisor: Int, number: Int) -> Bool{
        return number % divisor == 0
    }
    
    func check(number: Int) -> Move {
        if isDivisibleBy(divisor: 15, number: number){
            return .fizzBuzz
        }else if isDivisibleBy(divisor: 5, number: number){
            return .buzz
        }else if isDivisibleBy(divisor: 3, number: number){
            return .fizz
        }else{
            return .number
        }
        
    }
    
}

