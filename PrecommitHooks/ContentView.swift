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

//    func add() {
//        let array: NSArray = NSArray(array: [5, 6, 7])
//        let numbers = array as! [Int]
//        print(numbers.reduce(0, +))
//    }
}

#Preview {
    ContentView()
}
