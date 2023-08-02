//
//  TableCollectionViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/02.
//

import UIKit

let movie = MovieInfo()

class TableCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    
    
    @IBOutlet var arountTableView: UITableView!
    
    @IBOutlet var aroundCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arountTableView.delegate = self
        arountTableView.dataSource = self
        
        aroundCollectionView.delegate = self
        aroundCollectionView.dataSource = self
        
        let nib = UINib(nibName: AroundTableViewCell.identifier, bundle: nil)
        arountTableView.register(nib, forCellReuseIdentifier: AroundTableViewCell.identifier)
        let collectionNib = UINib(nibName: AroundCollectionViewCell.identifier, bundle: nil)
        aroundCollectionView.register(collectionNib, forCellWithReuseIdentifier: AroundCollectionViewCell.identifier)
        
        arountTableView.rowHeight = 150
    
        configureCollectionViewLayout()
    }
    
//1.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.movie.count
    }
//    2.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AroundTableViewCell.identifier) as? AroundTableViewCell else {
            return UITableViewCell()
        }
        let row = movie.movie[indexPath.row]
        cell.configure(row: row)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AroundCollectionViewCell.identifier, for: indexPath) as? AroundCollectionViewCell else {
            return AroundCollectionViewCell()
        }
        
        let row = movie.movie[indexPath.row]
        cell.configure(row: row)
        
        return cell
    }
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        aroundCollectionView.collectionViewLayout = layout
    }
}
