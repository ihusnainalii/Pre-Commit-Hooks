//
//  ContentViewModel.swift
//  PrecommitHooks
//
//  Created by Husnain Ali - ILI on 30/09/2024.
//

import SwiftUI

//protocol ContentViewModelProtocol: ObservableObject {
//    var sum: Int { get set }
//    func sum(_ ofArray: [Int])
//    func sum(_ a: Int, b: Int)
//}

class ContentViewModel: ObservableObject {
    
    var sum: Int = 0
    
    func sum(_ ofArray: [Int]) {
        let array: NSArray = NSArray(array: ofArray)
        if let numbers = array as? [Int] {
            sum = numbers.reduce(0, +)
        }
    }
    
    func sum(_ firstNumber: Int, _ secondNumber: Int) {
        sum = firstNumber + secondNumber
    }
}
