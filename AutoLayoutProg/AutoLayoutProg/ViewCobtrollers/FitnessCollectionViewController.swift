//
//  FitnessViewController.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 1/8/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class FitnessCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cards: [Card] = [
        Card(titleLabel: "Body fitness challenge", descriptionLabel: "Easy to follow 30 day challenges on health and diet", chalOne: "workoutttt", chalTwo: "drinkkkk"),
        Card(titleLabel: "Body fitness challenge 2", descriptionLabel: "Easy to follow 30 day challenges on exercise and diet", chalOne: "10 squats", chalTwo: "1 min plank"),
        Card(titleLabel: "Customized body fitness", descriptionLabel: "Create your own 30 day workout and diet challenges that fits for you!", chalOne: "no bobaaa", chalTwo: "Have a positive mindset!")
    ]
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.9764705882, green: 0.8117647059, blue: 0.8784313725, alpha: 1)
        return pc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.isPagingEnabled = true
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCellId")
        setUpBottomControls()
    }
    
    private func setUpBottomControls() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    // changes the dots as soon as ended dragging!
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // tells you were the animation is going to stop the animation of the drag
        let x = targetContentOffset.pointee.x
        // (x / view.frame.width) for each page will be basically the index of the collectionView!
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // we get this cellId from the reUseIdentifier in the viewDidLoad
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCellId", for: indexPath) as! CardCell
        
        let card = cards[indexPath.item]
        // setting the PageCell's variable page to be the page list above
        cell.card = card
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected at \(indexPath)")
    }

}
