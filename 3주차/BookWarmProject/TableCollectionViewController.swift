//
//  TableCollectionViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/08/02.
//

import UIKit

let movie = MovieInfo()

class TableCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var arountTableView: UITableView!
    
    @IBOutlet var aroundCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arountTableView.delegate = self
        arountTableView.dataSource = self
        
        let nib = UINib(nibName: AroundTableViewCell.identifier, bundle: nil)
        arountTableView.register(nib, forCellReuseIdentifier: AroundTableViewCell.identifier)
        
        arountTableView.rowHeight = 150
        


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

}
