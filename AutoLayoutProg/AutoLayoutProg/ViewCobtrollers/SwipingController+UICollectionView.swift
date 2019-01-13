//
//  SwipingController+UICollectionView.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 12/16/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

extension SwipingController {
    
    // 0 so when you drag to the next page, it won't show a bit of the other page
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // we get this cellId from the reUseIdentifier in the viewDidLoad
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        // setting the PageCell's variable page to be the page list above
        cell.page = page
        
        //        cell.bearImageView.image = UIImage(named: page.imageName)
        //        cell.descriptionTextView.text = page.headerText
        
        //        this following code may be in an interview question
        //        if it's divisible by 0, it will be red. If not divisible by 0, it will be green
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected at \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
}
