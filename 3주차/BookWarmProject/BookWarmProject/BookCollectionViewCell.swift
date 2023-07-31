//
//  BookCollectionViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet var movieLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var mainView: BookCollectionViewCell!
    
    var randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    func configure(row: Movie) {
        mainView.backgroundColor = randomColor
        movieLabel?.text = row.title
        movieImage?.image = UIImage(named: row.title)
        rateLabel?.text = "\(row.rate)"
    }
    

}
