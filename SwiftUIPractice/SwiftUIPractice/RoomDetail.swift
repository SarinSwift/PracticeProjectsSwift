//
//  RoomDetail.swift
//  SwiftUIPractice
//
//  Created by Sarin Swift on 10/9/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import SwiftUI

/*
 Notes: The View type in SwiftUI is a struct that conforms to the View Protocol rather than a class (ex. UIView). This means that the View does not inherit any stored property -- allocated on the Stack -- and passed by value.
 RoomDetail stores the only property: room of type Room. Meaning that this struct will only have the size of a Room object!
 
 Views in SwiftUI are incredibly light weight. Extractign a subview has no runtime ahead.
 The View protocol only has a single requirement: body. The renderign of any view you build is just the rendering of it's body. And in SwiftUI a view defines a set of dependencies
 
 State variables - source of truth. Because SwiftUI can tell when state variables are read and written. So when the state changes it knows which state to render. This rendering knows when to refresh by asking for a new body
*/

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        Image(room.imageName)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            // inline sets the title to look likee what it would normally look like on a navigation controller bar
            .navigationBarTitle(Text(room.name), displayMode: .inline)
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetail(room: testData[0])
    }
}
