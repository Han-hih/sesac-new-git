//
//  DetailViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    var list = MovieInfo()
    var book = BookList(bookTitle: "", bookThumb: "", bookAuthor: "", bookMemo: "")
    
    var movie = Movie(title: "", releaseDate: "", runtime: 0, overview: "", rate: 0, like: false, gerne: "", color: UIColor.black)
    
    
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var opendateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var reviewTextField: UITextView!
    @IBOutlet var dismissButton: UIButton!
    
    var contents: String = "빈공간"
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = contents
        setToolBar()
        self.navigationController?.isToolbarHidden = false
        
//        tasks = realm.objects(BookList.self).sorted(byKeyPath: "bookTitle", ascending: false)
        configure()
        if modalPresentationStyle == .fullScreen {
            dismissButton.isHidden = false
        } else {
            dismissButton.isHidden = true
        }
        placeholderSetting()
    }
    
    @objc func deleteCell() {
        
        let task = book
        removeImageFromDocument(fileName: "Han_\(task._id).jpg")
        try! realm.write {
            realm.delete(task)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func updateReview() {
        
        
    }
    
    func setToolBar() {
        let deleteButton = UIBarButtonItem(title: "삭제", style: .plain, target: self, action: #selector(deleteCell))
        let updateButton = UIBarButtonItem(title: "업데이트", style: .plain, target: self, action: #selector(updateReview))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        self.toolbarItems = [deleteButton, flexibleSpace, updateButton]
        
    }
    func configure() {
        movieImageView.load(url: URL(string: book.bookThumb)!)
        movieTitleLabel.text = book.bookTitle
        runtimeLabel.text = "\(movie.runtime)분"
        rateLabel.text = "\(movie.rate)점"
        opendateLabel.text = movie.releaseDate
        
        descriptionLabel.text = movie.overview
        descriptionLabel.numberOfLines = 0
        
        dismissButton.setTitle("뒤로가기", for: .normal)
    }
   
    func setNavigationBar() {
        let backButton = UIImage(systemName: "chevron.backward")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButton, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.title = .none
        
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dissmisButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
    }

    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}



extension DetailViewController: UITextViewDelegate {
    
    func placeholderSetting() {
        reviewTextField.delegate = self
        reviewTextField.text = "후기를 입력해 주세요"
        reviewTextField.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if reviewTextField.textColor == UIColor.lightGray {
            reviewTextField.text = ""
            reviewTextField.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if reviewTextField.text.isEmpty {
            reviewTextField.text = "후기를 입력해 주세요"
            reviewTextField.textColor = UIColor.lightGray
        }
    }
    
}
