//
//  CollectionTableViewCell.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CollectionCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5333333333, green: 0.5176470588, blue: 0.6352941176, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(collectionNameLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            collectionNameLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            collectionNameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            collectionNameLabel.heightAnchor.constraint(equalToConstant: 50),
            collectionNameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
