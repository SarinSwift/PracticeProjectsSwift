//
//  Product.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/16/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

struct Product: Codable {
    let title: String
    let image: ProductImage
    let variants: [Variant]
    
    struct ProductImage: Codable {
        let productId: Int
        let src: String
        
        enum CodingKeys: String, CodingKey {
            case src
            case productId = "product_id"
        }
    }
    
    struct Variant: Codable {
        let title: String
        let inventoryQuantity: Int
        
        enum CodingKeys: String, CodingKey {
            case title
            case inventoryQuantity = "inventory_quantity"
        }
    }
    
}
