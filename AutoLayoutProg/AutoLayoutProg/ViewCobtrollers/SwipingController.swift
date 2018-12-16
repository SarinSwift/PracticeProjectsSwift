//
//  SwipingController.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 12/13/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

// Controller: coordinating all the view and the models so they know about the correct object it needs to display
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages: [Page] = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon"),
        Page(imageName: "heart_second", headerText: "Subscribe and get couponson our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you also have"),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon")
    ]
    // don't use these seperate codes because it can cause problems when you don't have equal counts on both
//    let imageNames = ["bear_first", "heart_second", "leaf_third"]
//    let headerString = ["Join us today in our fun and games!", "Subscribe and get couponson our daily events", "VIP members special services"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // snaps to a page
        collectionView.isPagingEnabled = true
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    
}
