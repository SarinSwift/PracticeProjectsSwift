//
//  CardCell.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 1/8/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class CardCell: UICollectionViewCell {
    
    var card: Card? {
        didSet {
            guard let card = card else { return }
            
            let attributedText = NSMutableAttributedString(string: card.titleLabel, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(card.descriptionLabel)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionLabel.attributedText = attributedText
            descriptionLabel.textAlignment = .center
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Body fitness challenge"
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9333333333, green: 0.3529411765, blue: 0.3764705882, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy to follow 30 day challenges on exercise and diet"
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 4
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9333333333, green: 0.3529411765, blue: 0.3764705882, alpha: 0.89)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    func setUpLayout() {
        let topContainerView = UIView()
        addSubview(topContainerView)
        
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        // add the imageView inside the top half invisible view
        topContainerView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
