//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Sarin Swift on 10/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var rooms: [Room] = testData
    
    var body: some View {
        
        // Where we create something that looks like a tableView
        List(rooms) { room in
            // Creating a horizontal stackView encapsulated by a vertical stack view
            Image(systemName: "photo")
            
            // creating a vertical stack view
            VStack(alignment: .leading, spacing: 1) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline).foregroundColor(.secondary)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // NOTE: this testData will only be showed on the side canvas
        ContentView(rooms: testData)
    }
}
