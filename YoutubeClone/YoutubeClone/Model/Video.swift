//
//  Video.swift
//  YoutubeClone
//
//  Created by Sarin Swift on 1/12/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

// Model object that represents the entire single cell for a video
class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

// The Video has a relationship with the channel. So the video knows which channel it belongs to
class Channel: NSObject {
    
    var name: String?
    var profileImageName: String?
}
