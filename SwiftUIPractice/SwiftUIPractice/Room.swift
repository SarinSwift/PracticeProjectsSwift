//
//  Room.swift
//  SwiftUIPractice
//
//  Created by Sarin Swift on 10/7/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import SwiftUI

// To use this in a list in swiftui, you'll need to conform to Identifiable. This lets List know which objects are coming and going.
struct Room: Identifiable {
    var id = UUID() // all you need is the id, which is right here
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailImage: String { return name + "Thumb" }
}

let testData = [
    Room(name: "Observation Deck", capacity: 6, hasVideo: true),
    Room(name: "Executive Suite", capacity: 8, hasVideo: false),
    Room(name: "Charter Jet", capacity: 16, hasVideo: true),
    Room(name: "Dungeon", capacity: 10, hasVideo: true)
]
