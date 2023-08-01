//
//  TestCollectionViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var movieTitleText: UILabel!
    
    @IBOutlet var rateTextLabel: UILabel!
    
    @IBOutlet var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    var randomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    func configure(row: Movie) {
        mainView.backgroundColor = randomColor
        movieTitleText.font = .boldSystemFont(ofSize: 20)
        movieTitleText.textColor = .white
        movieTitleText?.text = row.title
        movieImageView?.image = UIImage(named: row.title)
        rateTextLabel?.text = "\(row.rate)"
        rateTextLabel.textColor = .white
    }
}
