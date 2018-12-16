//
//  SwipingController+Extensions.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 12/16/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // notified of the size change, it will invalidate the entire collectionviews layout
        
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (bear_) in
        }
    } 
}
