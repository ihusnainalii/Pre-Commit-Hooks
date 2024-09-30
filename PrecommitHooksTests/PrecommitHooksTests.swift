//
//  PrecommitHooksTests.swift
//  PrecommitHooksTests
//
//  Created by Husnain Ali - ILI on 30/09/2024.
//

import XCTest
@testable import PrecommitHooks

final class PrecommitHooksTests: XCTestCase {
    
    var sut: ContentViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ContentViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    // Test for summing an array of integers
    func testSumOfArraySuccess() async throws {
        // Given
        let numbers = [1, 2, 3, 4, 5]
        
        // When
        sut.sum(numbers)
        
        // Then
        XCTAssertEqual(sut.sum, 15, "The sum of the array should be 15.")
    }
    
    // Test for summing an empty array (should result in 0)
    func testSumOfEmptyArray() async throws {
        // Given
        let numbers: [Int] = []
        
        // When
        sut.sum(numbers)
        
        // Then
        XCTAssertEqual(sut.sum, 0, "The sum of an empty array should be 0.")
    }
    
    // Test for summing two integers
    func testSumOfTwoPositiveIntegersSuccess() async throws {
        // Given
        let firstNumber = 5
        let secondNumber = 10
        
        // When
        sut.sum(firstNumber, secondNumber)
        
        // Then
        XCTAssertEqual(sut.sum, 15, "The sum of \(firstNumber) and \(secondNumber) should be 15.")
    }
    
    // Test for summing two integers (negative case)
    func testSumOfTwoNegativeIntegersFailure() async throws {
        // Given
        let firstNumber = -5
        let secondNumber = -10
        
        // When
        sut.sum(firstNumber, secondNumber)
        
        // Then
        XCTAssertEqual(sut.sum, -15, "The sum of \(firstNumber) and \(secondNumber) should be -15.")
    }
    
    func testPerformanceExample() throws {
        self.measure {
            // Example of performance test (e.g., measure time taken for summing a large array)
            let largeArray = Array(1...1000)
            sut.sum(largeArray)
        }
    }
}
