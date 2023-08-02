//
//  DetailViewController.swift
//  BookWarmProject
//
//  Created by 황인호 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    var list = MovieInfo()
    
    var movie = Movie(title: "", releaseDate: "", runtime: 0, overview: "", rate: 0, like: false, gerne: "", color: UIColor.black)
    
    
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var opendateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dismissButton: UIButton!
    
    
    
    var contents: String = "빈공간"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = contents
        
        configure()
        if modalPresentationStyle == .fullScreen {
            dismissButton.isHidden = false
        } else {
            dismissButton.isHidden = true
        }
    }
    
    func configure() {
        movieImageView.image = UIImage(named: movie.title)
        movieTitleLabel.text = movie.title
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
    
}
