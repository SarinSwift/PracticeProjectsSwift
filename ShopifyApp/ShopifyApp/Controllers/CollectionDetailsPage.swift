//
//  CollectionDetailsPage.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CollectionDetailsPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var collectProducts: [Collect] = []
    var allIds = ""
    var productInformation: [Product] = []
    var totalVariantCount = 0
    var specificVariants: String = ""
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
        // appending all ids into a single string
        for i in 0..<collectProducts.count {
            let id = collectProducts[i].productId
            allIds.append("\(id),")
        }
        Service.fetchRequest(router: Router.getAllProducts(ids: self.allIds), completion: { (result: [String : [Product]]) in
            self.productInformation = result["products"]!
            self.setupTableView()
            self.tableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.2470588235, blue: 0.3725490196, alpha: 1)
    }
    
    func setupNavbar() {
        let backBtn = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backBtnTapped))
        backBtn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.leftBarButtonItem = backBtn
    }
    @objc func backBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionDetailCell.self, forCellReuseIdentifier: "detailCellId")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectProducts.count
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellId", for: indexPath) as! CollectionDetailCell
        cell.titleLabel.text = productInformation[indexPath.row].title
        
        // Looping through all variants within a product
        for i in 0..<self.productInformation[indexPath.row].variants.count {
            let variant = self.productInformation[indexPath.row].variants[i]
            self.totalVariantCount += variant.inventoryQuantity
            specificVariants += "\(variant.title). Quantity: \(variant.inventoryQuantity)\n"
        }
        cell.variantNames.text = self.specificVariants
        self.specificVariants = ""
        cell.totalVariantLabel.text = "Total Number of Variants: \(self.totalVariantCount)"
        self.totalVariantCount = 0
        do {
            let imageUrl = URL(string: productInformation[indexPath.row].image.src)
            let data = try Data(contentsOf: imageUrl!)
            cell.imageProduct.image = UIImage(data: data)
        } catch {
            print("error: no image")
        }
        return cell
    }
    
}
