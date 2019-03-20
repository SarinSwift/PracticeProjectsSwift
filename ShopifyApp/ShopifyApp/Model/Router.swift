//
//  Router.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/17/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation


enum Router {
    case getCollections
    case getSpecificData(collectionId: String)
    case getAllProducts(ids: String)
    
    var scheme: String {
        switch self {
        case .getCollections, .getSpecificData, .getAllProducts:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getCollections, .getSpecificData, .getAllProducts:
            return "shopicruit.myshopify.com"
        }
    }
    
    var path: String {
        switch self {
        case .getCollections:
            return "/admin/custom_collections.json"
        case .getSpecificData:
            return "/admin/collects.json"
        case .getAllProducts:
            return "/admin/products.json"
        }
    }
    
    var queries: [URLQueryItem] {
        switch self {
        case .getCollections:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: "c32313df0d0ef512ca64d5b336a0d7c6")]
        case .getSpecificData(let collectionId):
            return [URLQueryItem(name: "collection_id", value: collectionId),
                    URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: "c32313df0d0ef512ca64d5b336a0d7c6")]
        case .getAllProducts(let ids):
            return [URLQueryItem(name: "ids", value: ids),
                    URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: "c32313df0d0ef512ca64d5b336a0d7c6")]
        }
    }
    
}
