//
//  KakaoTableViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/08.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire

struct Book {
    var title: String
    var thumbnail: String
    var author: String
}


class KakaoTableViewCell: UITableViewCell {
    
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    static let identifier = "KakaoTableViewCell"
    
    
}
