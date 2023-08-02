//
//  AroundCollectionReusableView.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/02.
//

import UIKit

class AroundCollectionReusableView: UICollectionReusableView {
        static let identifier = "AroundCollectionReusableView"

    @IBOutlet var collectionViewHeadLabel: UILabel!
    
    func configure() {
        collectionViewHeadLabel.text = "최신 영화"
        collectionViewHeadLabel.font = .systemFont(ofSize: 10)
        collectionViewHeadLabel.textColor = .black
        
        
    }
}
