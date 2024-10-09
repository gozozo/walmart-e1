//
//  OperationTests.swift
//  walmart-e1Tests
//
//  Created by Luis Enrique Vazquez Escobar on 09/10/24.
//

import XCTest
@testable import walmart_e1

final class SOperationTests: XCTestCase {

    var operation: SOperation!

    override func setUpWithError() throws {
        operation = SOperation()
    }

    override func tearDownWithError() throws {
        operation = nil
    }

    func testAddEvenForLoop() throws {
        // Given
        let array = [1, 2, 3, 4, 5, 6]
        
        // When
        let result = operation.addEvenForLoop(array: array)
        
        // Then
        XCTAssertEqual(result, 12, "The sum of even numbers should be 12")
    }

    func testAddEvenFilterReduce() throws {
        // Given
        let array = [1, 2, 3, 4, 5, 6]
        
        // When
        let result = operation.addEvenFilterReduce(array: array)
        
        // Then
        XCTAssertEqual(result, 12, "The sum of even numbers should be 12")
    }

    func testAddEvenInlineReduce() throws {
        // Given
        let array = [1, 2, 3, 4, 5, 6]
        
        // When
        let result = operation.addEvenInlineReduce(array: array)
        
        // Then
        XCTAssertEqual(result, 12, "The sum of even numbers should be 12")
    }
}
