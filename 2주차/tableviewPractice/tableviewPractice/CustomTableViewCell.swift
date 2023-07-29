//
//  CustomTableViewCell.swift
//  tableviewPractice
//
//  Created by 황인호 on 2023/07/28.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    @IBOutlet var backView: UIView!
    @IBOutlet var checkBoxImageView: UIImageView!
    
    @IBOutlet var mainTitleLabel: UILabel!
    @IBOutlet var subtTitleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    
    func configureCell(row: ToDo) {
        
        mainTitleLabel.text = row.main
        subtTitleLabel.text = row.sub
        
        if row.done {
            checkBoxImageView.image = UIImage(systemName: "checkmark.square.fill")
        } else {
            checkBoxImageView.image = UIImage(systemName: "checkmark.square" )
        }
            
        if row.like {
            likeButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
}
