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
    
    var randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    func configure(row: Movie) {
        mainView.layer.cornerRadius = 20
        mainView.clipsToBounds = true
        mainView.backgroundColor = randomColor
        movieLabel.font = .boldSystemFont(ofSize: 20)
        movieLabel.textColor = .white
        movieLabel?.text = row.title
        movieImage?.image = UIImage(named: row.title)
        rateLabel?.text = "\(row.rate)"
        rateLabel.textColor = .white
    }
}
