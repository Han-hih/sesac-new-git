//
//  KakaoViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

class KakaoViewController: UIViewController {

    @IBOutlet var kakaoTableView: UITableView!
    
    var bookArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTableView.dataSource = self
        kakaoTableView.delegate = self
        
    }
    

    func callRequest() {
        let text = "swift".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)"
        let header: HTTPHeaders = ["Authorization": APIKey.kakaoKey]
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
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
