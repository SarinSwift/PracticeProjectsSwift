//
//  CollectionDetailCell.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CollectionDetailCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5333333333, green: 0.5176470588, blue: 0.6352941176, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont(name: "Arial", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalVariantLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Variants: ___"
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let variantNames: UITextView = {
        let textView = UITextView()
        textView.text = "Violet: quantity 115 \nCyan: quantity223"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textView.layer.borderWidth = 1
        textView.textAlignment = .center
        textView.font = UIFont(name: "Arial", size: 16.5)
        return textView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(cellView)
        cellView.addSubview(imageProduct)
        cellView.addSubview(titleLabel)
        cellView.addSubview(totalVariantLabel)
        cellView.addSubview(variantNames)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
            ])
        
        // Image constraints
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: imageProduct, attribute: .top, relatedBy: .equal, toItem: cellView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: imageProduct, attribute: .left, relatedBy: .equal, toItem: cellView, attribute: .left, multiplier: 1, constant: 0)
            ])
        imageProduct.addConstraints([
            NSLayoutConstraint(item: imageProduct, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140),
            NSLayoutConstraint(item: imageProduct, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140),
            ])
        // Title label constraints
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: imageProduct.rightAnchor, constant: 5),
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 40),
            titleLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10)
            ])
        titleLabel.addConstraints([
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
            ])
        // TotalVariant label constraints
        NSLayoutConstraint.activate([
            totalVariantLabel.leftAnchor.constraint(equalTo: imageProduct.leftAnchor, constant: 20),
            totalVariantLabel.topAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: 5),
            totalVariantLabel.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10)
            ])
        totalVariantLabel.addConstraint(
            NSLayoutConstraint(item: totalVariantLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 25))
        // Text field constraints
        NSLayoutConstraint.activate([
            variantNames.topAnchor.constraint(equalTo: totalVariantLabel.bottomAnchor, constant: 0),
            variantNames.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -5),
            variantNames.leftAnchor.constraint(equalTo: imageProduct.leftAnchor, constant: 10),
            variantNames.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -10)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
