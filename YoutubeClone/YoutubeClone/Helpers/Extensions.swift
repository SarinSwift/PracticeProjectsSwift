//
//  Extensions.swift
//  YoutubeClone
//
//  Created by Sarin Swift on 1/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    
    // narrowed down the huge mess of constraints. Neatly compacted to a couple of parameters.
    // gets rid of redundant code!! (translatesAutoresizingMasksIntoConstraints)
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            // prevent the images from getting in another cell!!
            // the url takes a bit time to render the images and that makes it load onto the cell quite slow
            // it's taking the data -> returning it to the iphone -> then refreshing it up
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
            }.resume()
    }
    
}
