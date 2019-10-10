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
        // Wraping the list in a navigation controller
        NavigationView {
            List(rooms) { room in
                // Makes the cell selectable and pushes to a new page
                RoomCell(room: room)
            }
            .navigationBarTitle("Rooms")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // NOTE: this testData will only be showed on the side canvas
        ContentView(rooms: testData)
    }
}

struct RoomCell: View {
    // NOTE: variables declared here must be passed upon instantiating this RoomCell struct
    var room: Room
    
    var body: some View {
        return NavigationLink(destination: Text(room.name)) {
            Image(systemName: "photo")
                .cornerRadius(3)
            
            VStack(alignment: .leading, spacing: 1) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline).foregroundColor(.secondary)
            }
        }
    }
}
