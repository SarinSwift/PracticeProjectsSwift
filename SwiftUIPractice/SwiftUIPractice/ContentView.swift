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
        NavigationView {
            List(rooms) { room in
                RoomCell(room: room)
            }
            .navigationBarTitle("Rooms")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
    }
}

struct RoomCell: View {
    var room: Room
    
    var body: some View {
        return NavigationLink(destination: RoomDetail(room: room)) {
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
