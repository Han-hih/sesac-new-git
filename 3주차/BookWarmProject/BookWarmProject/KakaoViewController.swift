//
//  KakaoViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class KakaoViewController: UIViewController {
    
    @IBOutlet var kakaoTableView: UITableView!
    
    var bookList: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTableView.delegate = self
        kakaoTableView.dataSource = self
       
        callRequest()
        kakaoTableView.rowHeight = 100
        
        let nib = UINib(nibName: "KakaoTableViewCell", bundle: nil)
        kakaoTableView.register(nib, forCellReuseIdentifier: "KakaoTableViewCell")
        
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
                
                for item in json["documents"].arrayValue {
                    let author = item["authors"][0].stringValue
                    let thumbnail = item["thumbnail"].stringValue
                    let title = item["title"].stringValue
                    self.bookList.append(Book(title: title, thumbnail: thumbnail, author: author))
                    }
                    
                    
                self.kakaoTableView.reloadData()
    
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension KakaoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KakaoTableViewCell.identifier) as? KakaoTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = bookList[indexPath.row].title
        cell.authorLabel.text = bookList[indexPath.row].author
        if let imageURL = URL(string: bookList[indexPath.row].thumbnail) {
            cell.thumbnailImage.kf.setImage(with: imageURL)
        }
        
    
        
        return cell
    }
    
    
}
