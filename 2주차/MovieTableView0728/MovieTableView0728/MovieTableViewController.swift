//
//  MovieTableViewController.swift
//  MovieTableView0728
//
//  Created by 황인호 on 2023/07/28.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let movie = MovieInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movie.movie.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
       
        let row = movie.movie[indexPath.row]
        cell.configure(row: row)
        
        return cell
    }
}
