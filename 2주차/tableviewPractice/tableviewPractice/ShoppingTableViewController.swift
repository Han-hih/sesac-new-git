//
//  ShoppingTableViewController.swift
//  tableviewPractice
//
//  Created by 황인호 on 2023/07/27.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var headView: UIView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    var purchaseList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setUI()
    }
    
    func setUI() {
        headView.backgroundColor = .lightGray
        headView.clipsToBounds = true
        headView.layer.cornerRadius = 5
        addButton.tintColor = .black
        
        addButton.backgroundColor = .gray
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 8
        
        inputTextField.backgroundColor = .lightGray
        
        
    }
  
    @IBAction func addButtonTapped(_ sender: UIButton) {
        purchaseList.append(inputTextField.text ?? "")
        tableView.reloadData()
    }
   
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopingCell")!
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = purchaseList[indexPath.row]
        
        return cell
    }
}
