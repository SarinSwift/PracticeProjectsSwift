//
//  RoomDetail.swift
//  SwiftUIPractice
//
//  Created by Sarin Swift on 10/9/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room = testData[0]
    
    var body: some View {
        Image(room.imageName)
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetail()
    }
}
