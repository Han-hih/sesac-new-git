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
        let nib = UINib(nibName: "TestCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TestCollectionViewCell")
        setCollectionViewLayOut()
        
    }
    
    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return
        }
        
        let navigation = UINavigationController(rootViewController: viewcontroller)
        navigation.modalPresentationStyle = .fullScreen
        navigation.title = "검색화면"
        present(navigation, animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            
            return
        }
        
        navigationController?.pushViewController(viewcontroller, animated: true)
        self.navigationController?.navigationBar.topItem?.title = "영화목록"
    }
    
   
    
    func setCollectionViewLayOut() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        collectionView.collectionViewLayout = layout
    }
    
    // 1.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.movie.count
        
    }
    //    2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath) as? TestCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 20
        let row = list.movie[indexPath.row]
        cell.configure(row: row)
        
        return cell
    }
    
}

