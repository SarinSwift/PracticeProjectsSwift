//
//  Collect.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct Collect:  Codable {
    let productId: Int
    
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
    }
}


