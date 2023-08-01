//
//  DetailViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    @IBOutlet var contentsLabel: UILabel!
    
    var contents: String = "빈공간"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = contents
      
    }
    
    func setNavigationBar() {
        let backButton = UIImage(systemName: "chevron.backward")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButton, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.title = .none
        
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
