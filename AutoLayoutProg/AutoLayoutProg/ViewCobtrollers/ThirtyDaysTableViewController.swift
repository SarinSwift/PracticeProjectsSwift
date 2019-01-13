//
//  ThirtyDaysTableViewController.swift
//  AutoLayoutProg
//
//  Created by Sarin Swift on 1/12/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import UIKit

class ThirtyDaysTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tableView.register(ThirtyDaysCell.self, forCellReuseIdentifier: "TDCId")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TDCId", for: indexPath) as! ThirtyDaysCell
        for i in 1...30 {
            cell.dayLabel.text = "Day \(i)"
        }
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class ThirtyDaysCell: UITableViewCell {
    // creating the view
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0.3921568627, blue: 0.3921568627, alpha: 0.89)
        
        
        view.layer.cornerRadius = 10
        
        // these shadows aren't working!!!
        view.layer.masksToBounds = true
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.3
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: 60, height: 60)).cgPath
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day 1"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    
    func setupView() {
        
        addSubview(cellView)
        cellView.addSubview(dayLabel)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        self.selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
