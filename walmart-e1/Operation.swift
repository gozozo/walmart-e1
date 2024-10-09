//
//  Sum.swift
//  walmart-e1
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import Foundation

struct SOperation {
    public func addEvenForLoop(array: [Int]) -> Int {
        var sumEven = 0
        for value in array {
            if value % 2 == 0 {
                sumEven += value
            }
        }
        return sumEven
    }

    public func addEvenFilterReduce(array: [Int]) -> Int {
        return array.filter { $0 % 2 == 0 }.reduce(0, +)
    }

    public func addEvenInlineReduce(array: [Int]) -> Int {
        return array.reduce(0) { accumulator, value in
            return value % 2 == 0 ? accumulator + value : accumulator
        }
    }
}
