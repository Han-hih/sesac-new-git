//
//  testCollectionViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit
import Kingfisher

class testCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "testCollectionViewCell"
    
    @IBOutlet var movieLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var likeButton: UIButton!
    
    
    func configureBook(row: BookList) {
        mainView.layer.cornerRadius = 20
        mainView.clipsToBounds = true
        movieLabel.font = .boldSystemFont(ofSize: 14)
        movieLabel.textColor = .green
        movieLabel?.text = row.bookTitle
//        movieImage?.image = UIImage(named: row.bookThumb)
        let imageUrl = row.bookThumb
           if let url = URL(string: imageUrl) {
            movieImage.load(url: url)
            
        }
                
        rateLabel?.text = row.bookAuthor
        rateLabel.textColor = .blue
    }
    
    
    
    
    func configure(row: Movie) {
        mainView.layer.cornerRadius = 20
        mainView.clipsToBounds = true
        mainView.backgroundColor = row.color
        movieLabel.font = .boldSystemFont(ofSize: 20)
        movieLabel.textColor = .white
        movieLabel?.text = row.title
        movieImage?.image = UIImage(named: row.title)
        rateLabel?.text = "\(row.rate)"
        rateLabel.textColor = .white
        
        if row.like {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
