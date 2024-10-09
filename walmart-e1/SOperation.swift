//
//  Sum.swift
//  walmart-e1
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import Foundation

/// A structure representing an operation in the system.
/// 
/// The `SOperation` struct is used to encapsulate the details and behavior
/// of a specific operation within the application. This can include various
/// properties and methods that define what the operation does and how it
/// interacts with other parts of the system.
struct SOperation {
    
    /// Adds all even numbers in the given array.
    /// 
    /// This function iterates through the provided array of integers and sums up
    /// all the even numbers. It returns the total sum of these even numbers.
    /// 
    /// - Parameter array: An array of integers to be processed.
    /// - Returns: The sum of all even integers in the array.
    public func addEvenForLoop(array: [Int]) -> Int {
        var sumEven = 0
        for value in array {
            if value % 2 == 0 {
                sumEven += value
            }
        }
        return sumEven
    }

    /// Adds all even numbers in the given array and returns the result.
    /// 
    /// This function filters out the even numbers from the provided array of integers,
    /// then reduces the filtered numbers by summing them up.
    /// 
    /// - Parameter array: An array of integers to be processed.
    /// - Returns: The sum of all even numbers in the array.
    public func addEvenFilterReduce(array: [Int]) -> Int {
        return array.filter { $0 % 2 == 0 }.reduce(0, +)
    }

    /// Adds all even numbers in the given array using the reduce function.
    ///
    /// - Parameter array: An array of integers.
    /// - Returns: The sum of all even integers in the array.
    public func addEvenInlineReduce(array: [Int]) -> Int {
        return array.reduce(0) { accumulator, value in
            return value % 2 == 0 ? accumulator + value : accumulator
        }
    }
}
