//
//  BookCollectionViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit



class BookCollectionViewController: UICollectionViewController {
    
    var list = MovieInfo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        3.
        let nib = UINib(nibName: testCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: testCollectionViewCell.identifier)
        setCollectionViewLayOut()
        title = "영화목록"
    }
    
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: ViewController.identifier) as? ViewController else { return
        }
        
        let navigation = UINavigationController(rootViewController: viewcontroller)
        navigation.modalPresentationStyle = .fullScreen
        navigation.title = "검색 화면"
        present(navigation, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {
            
            return
        }
        viewcontroller.contents = list.movie[indexPath.row].title
        navigationController?.pushViewController(viewcontroller, animated: true)
    
        
    }
    
    
    func setCollectionViewLayOut() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView.collectionViewLayout = layout
    }
    
    // 1.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.movie.count
        
    }
    //    2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testCollectionViewCell.identifier, for: indexPath) as? testCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        let row = list.movie[indexPath.row]
        cell.configure(row: row)
        
        return cell
    }
    
}

