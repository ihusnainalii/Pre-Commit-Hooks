//
//  ContentView.swift
//  PrecommitHooks
//
//  Created by Husnain Ali - ILI on 30/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

    func sumUpArray(_ array: [Int] = [5, 6, 7]) {
        let array: NSArray = NSArray(array: array)
        let numbers = array as! [Int]
        print(numbers.reduce(0, +))
    }
    
    func sumupArray(_ array: [Int] = [5, 6, 7]) {
        let array: NSArray = NSArray(array: array)
        let numbers = array as! [Int]
        print(numbers.reduce(0, +))
    }
}

#Preview {
    ContentView()
}
