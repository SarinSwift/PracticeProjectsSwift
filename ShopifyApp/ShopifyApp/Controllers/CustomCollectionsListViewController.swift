//
//  ViewController.swift
//  ShopifyApp
//
//  Created by Sarin Swift on 3/15/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class CustomCollectionsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var collections: [CollectionItem] = []
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        Service.fetchRequest(router: Router.getCollections) { (result: [String : [CollectionItem]]) in
            guard let collectionItemArr = result["custom_collections"] else {
                print("no path of 'custom_collections'")
                return
            }
            self.collections = collectionItemArr
            self.tableView.reloadData()
        }
        
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CollectionCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CollectionCell
        let collection = collections[indexPath.row]
        cell.collectionNameLabel.text = collection.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collection = collections[indexPath.row]
        let specificId = String(collection.id)
        
        print("SpecificDataaaa \(specificId)")
        Service.fetchRequest(router: Router.getSpecificData(collectionId: specificId)) { (result: ([String : [Collect]])) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "collectionDetailPage") as! CollectionDetailsPage
            vc.collectProducts = result["collects"]!
            vc.tableView.reloadData()
            let vcNav = UINavigationController(rootViewController: vc)
            vc.navigationItem.title = collection.title
            self.present(vcNav, animated: true, completion: nil)
        }
        
    }
    
}

