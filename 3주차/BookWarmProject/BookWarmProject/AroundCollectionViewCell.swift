//
//  AroundCollectionViewCell.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/02.
//

import UIKit

class AroundCollectionViewCell: UICollectionViewCell {
    static let identifier = "AroundCollectionViewCell"
    
    @IBOutlet var movieImage: UIImageView!
    
    
    
    func configure(row: Movie) {
        movieImage.image = UIImage(named: row.title)
    }
    
   

}
