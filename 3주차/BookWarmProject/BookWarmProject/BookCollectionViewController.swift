//
//  BookCollectionViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit



class BookCollectionViewController: UICollectionViewController {

    //    1. 서치바
        let searchBar = UISearchBar()
    var searchList: [Movie] = []
    var list = MovieInfo() {
        didSet {
            print("didset")
            collectionView.reloadData()
        }
    }



        override func viewDidLoad() {
        super.viewDidLoad()
           
            searchBar.delegate = self
            searchBar.placeholder = "검색어를 입력해주세요"
            navigationItem.titleView = searchBar
            searchBar.showsCancelButton = true
            print("searchBar")
            
            
        //        3.
        let nib = UINib(nibName: testCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: testCollectionViewCell.identifier)
        setCollectionViewLayOut()
      //  title = "영화목록"
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
        viewcontroller.movie = list.movie[indexPath.row]
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
        
        if searchBar.text?.isEmpty == true {
            return list.movie.count
        } else {
            return searchList.count
        }
    }
    //    2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testCollectionViewCell.identifier, for: indexPath) as? testCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        var row = list.movie[indexPath.row]
        if searchBar.text?.isEmpty == true {
             row = list.movie[indexPath.row]
        } else {
             row = searchList[indexPath.row]
        }
//        let row = searchList[indexPath.row]
        cell.configure(row: row)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)

        
        
        return cell
    }
//    하트버튼 눌렀을 때 동작하는 함수
    @objc func likeButtonTapped(_ sender: UIButton) {
        print("clicked \(sender.tag)")
        list.movie[sender.tag].like.toggle()
        searchList[sender.tag].like.toggle()
        print()
    }
}
// MARK: - uiSearchBar

//2. 서치바
extension BookCollectionViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        for item in list.movie {
            if item.title.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        collectionView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        searchBar.text = ""
        searchList = list.movie
        collectionView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()
        for item in list.movie {
            if item.title.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        collectionView.reloadData()
        
        }
        
    }
    

