//
//  TableViewCell.swift
//  MovieTableView0728
//
//  Created by 황인호 on 2023/07/28.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var titleTextField: UILabel!
    @IBOutlet var opendateTextField: UILabel!
    @IBOutlet var runningTimeTextField: UILabel!
    @IBOutlet var rateTitleLabel: UILabel!
    @IBOutlet var detailTextField: UILabel!
    

    
    func configure(row: Movie) {
        movieImageView.image = UIImage(named: row.title)
        titleTextField.text = row.title
        opendateTextField.text = row.releaseDate
        runningTimeTextField.text = "\(row.runtime)분"
        rateTitleLabel.text = "\(row.rate)점"
        detailTextField.text = row.overview
    }
    
    
    
}
