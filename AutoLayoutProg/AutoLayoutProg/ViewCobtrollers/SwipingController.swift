//
//  SwipingController.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 12/13/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // we get this cellId from the reUseIdentifier in the viewDidLoad
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
//        this following code may be in an interview question
//        if it's divisible by 0, it will be red. If not divisible by 0, it will be green
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    
}
