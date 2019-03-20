//
//  Provider.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/17/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

class Service {

    class func fetchRequest<T: Codable>(router: Router, completion: @escaping ([String: [T]]) -> Void) {
        
        let session = URLSession(configuration: .default)
        guard let url = urlBuilder(router: router) else { return }
        print(url)
        let urlRequest = URLRequest(url: url)
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                print(error?.localizedDescription as Any)
                return
            }
            
            do {
                print([String: [T]].self)
                let jsonObject = try JSONDecoder().decode([String: [T]].self, from: data)
                print(jsonObject)
                
                DispatchQueue.main.async {
                    completion(jsonObject)
                }
                
            } catch {
                print("json decoder failed \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    class func urlBuilder(router: Router) -> URL? {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.queries
        
        guard let url = components.url else {
            return nil
        }
        return url
    }
}
