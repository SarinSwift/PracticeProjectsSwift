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
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    // outside classes can not access
    @objc private func handleNext() {
        // min function to handle the app not crashing from invalid index count
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        // item:,section: is for collections view!
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // lazy var to access members within your class
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.9764705882, green: 0.8117647059, blue: 0.8784313725, alpha: 1)
        return pc
    }()
    
    // changes the dots as soon as ended dragging!
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // tells you were the animation is going to stop the animation of the drag
        let x = targetContentOffset.pointee.x
        // (x / view.frame.width) for each page will be basically the index of the collectionView!
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // snaps to a page
        collectionView.isPagingEnabled = true
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        setUpBottomControls()
    }
    
    private func setUpBottomControls() {
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
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
