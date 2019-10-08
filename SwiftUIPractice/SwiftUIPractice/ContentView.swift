//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Sarin Swift on 10/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // Where we create something that looks like a tableView
        List(0..<5) { _ in
            // Creating a horizontal stackView encapsulated by a vertical stack view
            HStack {
                Image(systemName: "photo")
                // creating a vertical stack view
                VStack(alignment: .leading, spacing: 1) {
                    Text("Rooms")
                    Text("10 people")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
