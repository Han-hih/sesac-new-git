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
    
    @IBOutlet var searchBar: UISearchBar!
    
    var bookList: [Book] = []
    var page = 1
    var isEnd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTableView.delegate = self
        kakaoTableView.dataSource = self
        searchBar.delegate = self
        kakaoTableView.prefetchDataSource = self
        callRequest(query: "swift", page: 1)
        kakaoTableView.rowHeight = 100
        
        
        let nib = UINib(nibName: "KakaoTableViewCell", bundle: nil)
        kakaoTableView.register(nib, forCellReuseIdentifier: "KakaoTableViewCell")
        
        
    }

    func callRequest(query: String, page: Int) {
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //        if text.isEmpty == false {
        //                text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        //            } else {
        //                text = "스위프트".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        //            }
        let url = "https://dapi.kakao.com/v3/search/book?query=\(text)&size=30&page=\(page)"
        let header: HTTPHeaders = ["Authorization": APIKey.kakaoKey]
        print(url)
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                
                let statusCode = response.response?.statusCode ?? 500
                
                if statusCode == 200 {
                    self.isEnd = json["meta"]["is_end"].boolValue
                    for item in json["documents"].arrayValue {
                        let author = item["authors"][0].stringValue
                        let thumbnail = item["thumbnail"].stringValue
                        let title = item["title"].stringValue
                        let data = Book(title: title, thumbnail: thumbnail, author: author)
                        self.bookList.append(data)
                    }
                    print(self.bookList)
                    self.kakaoTableView.reloadData()
                } else {
                    print(statusCode)
                print("문제발생")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension KakaoViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
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
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if bookList.count - 1 == indexPath.row && page < 15 && isEnd == false {
                page += 1
                callRequest(query: searchBar.text!, page: page)
            }
        }
    }
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    
    
}




extension KakaoViewController: UISearchBarDelegate {
    func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        bookList.removeAll()
        dismissKeyboard()
        guard let query = searchBar.text else { return }
        callRequest(query: query, page: page)
        kakaoTableView.reloadData()
        
//        searchBar.text = ""
    }
    
    
}
