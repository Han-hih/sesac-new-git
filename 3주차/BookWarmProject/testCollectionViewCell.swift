//
//  testCollectionViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit

class testCollectionViewCell: UICollectionViewCell {

    static let identifier = "testCollectionViewCell"
    
    @IBOutlet var movieLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var likeButton: UIButton!
    
   
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
