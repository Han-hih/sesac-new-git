//
//  BookCollectionViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit
import RealmSwift
import Kingfisher


class BookCollectionViewController: UICollectionViewController {

    //    1. 서치바
        let searchBar = UISearchBar()
    var searchList: [Movie] = []
    var secondSearchList: [BookList] = []
    var list = MovieInfo() {
        didSet {
            print("didset")
            collectionView.reloadData()
        }
    }
    //realm에서 읽어온 데이터 담을 배열
    var tasks: Results<BookList>!

    //realm가져오기
        let realm = try! Realm()
        override func viewDidLoad() {
        super.viewDidLoad()
           
            searchBar.delegate = self
            searchBar.placeholder = "검색어를 입력해주세요"
            navigationItem.titleView = searchBar
            searchBar.showsCancelButton = true
            print("searchBar")
            
      
            tasks = realm.objects(BookList.self).sorted(byKeyPath: "bookTitle", ascending: true)
            print(realm.configuration.fileURL)
        //        3.
        let nib = UINib(nibName: testCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: testCollectionViewCell.identifier)
        setCollectionViewLayOut()
      //  title = "영화목록"
            collectionView.reloadData()

    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        collectionView.reloadData()
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
        if searchBar.text?.isEmpty == true {
            viewcontroller.data = tasks[indexPath.row]
        } else {
//            viewcontroller.movie = searchList[indexPath.row]
            
        }
        
        viewcontroller.hidesBottomBarWhenPushed = true
        viewcontroller.contents = tasks[indexPath.row].bookTitle
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
            return tasks.count
        } else {
            return secondSearchList.count
        }
//        if searchBar.text?.isEmpty == true {
//            return list.movie.count
//        } else {
//            return searchList.count
//        }
    }
    //    2.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testCollectionViewCell.identifier, for: indexPath) as? testCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        
        var data = tasks[indexPath.row]
        if searchBar.text?.isEmpty == true {
            data = tasks[indexPath.row]
        } else {
            data = secondSearchList[indexPath.row]
        }
//        cell.movieImage = data.bookThumb
       
        cell.configureBook(row: data)
        
        
//        var row = list.movie[indexPath.row]
//        if searchBar.text?.isEmpty == true {
//             row = list.movie[indexPath.row]
//        } else {
//             row = searchList[indexPath.row]
//        }
//        let row = searchList[indexPath.row]
//        cell.configure(row: row)
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
        secondSearchList.removeAll()
        for item in tasks {
            if item.bookTitle.contains(searchBar.text!) {
                secondSearchList.append(item)
                print(secondSearchList)
            }
        }
        collectionView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        secondSearchList.removeAll()
        searchBar.text = ""
//        secondSearchList = list.movie
        collectionView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()
        for item in tasks {
            if item.bookTitle.contains(searchBar.text!) {
                secondSearchList.append(item)
//                searchList.append(item)
                print(secondSearchList)
            }
        }
        collectionView.reloadData()
        
        }
        
    }
    

