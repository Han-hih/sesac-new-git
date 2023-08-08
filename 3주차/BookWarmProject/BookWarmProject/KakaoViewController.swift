//
//  KakaoViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/08.
//

import UIKit

class KakaoViewController: UIViewController {

    @IBOutlet var kakaoTableView: UITableView!
    
    var bookArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTableView.dataSource = self
        kakaoTableView.delegate = self
        
    }
    

   

}

extension KakaoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoTableViewCell") as? KakaoTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
