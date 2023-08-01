//
//  ViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {
    
    static let identifier = "ViewController"
    @IBOutlet var searchLabelResult: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }

    func setNavigationBar() {
        let xmark = UIImage(systemName: "xmark")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closedButtonClicked))
        navigationItem.title = "검색 화면"
        searchLabelResult.text = "검색 화면"
    }
    
    
    @objc func closedButtonClicked() {
        dismiss(animated: true)
    }
}

