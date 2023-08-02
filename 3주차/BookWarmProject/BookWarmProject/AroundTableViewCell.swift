//
//  AroundTableViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/02.
//

import UIKit

class AroundTableViewCell: UITableViewCell {
static let identifier = "AroundTableViewCell"
   
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var opendateGenreLabel: UILabel!
    
    func configure(row: Movie) {
        movieImageView.image = UIImage(named: row.title)
        movieTitleLabel.text = row.title
        opendateGenreLabel.text = "\(row.rate) | \(row.gerne)"
    }
    
}
