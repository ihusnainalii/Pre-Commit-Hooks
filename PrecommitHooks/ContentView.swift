//
//  ContentView.swift
//  PrecommitHooks
//
//  Created by Husnain Ali - ILI on 30/09/2024.
//

import SwiftUI
import SkeletonUI

struct ContentView: View {
    
    @State var users = [String]()
    
    var body: some View {
        VStack {
            Text("Finished requesting \(users.count) users!")
                .skeleton(with: users.isEmpty)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.users = ["John Doe", "Jane Doe", "James Doe", "Judy Doe"]
                    }
                }
                .frame(height: 40)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
