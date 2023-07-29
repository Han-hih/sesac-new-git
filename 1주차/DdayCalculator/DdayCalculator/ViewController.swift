//
//  ViewController.swift
//  DdayCalculator
//
//  Created by 황인호 on 2023/07/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var firstDdayLabel: UILabel!
    @IBOutlet var secondDdayLabel: UILabel!
    @IBOutlet var thirdDdayLabel: UILabel!
    @IBOutlet var fourthDdayLabel: UILabel!
    
    @IBOutlet var firstPlusDate: UILabel!
    @IBOutlet var secondPlusDate: UILabel!
    @IBOutlet var thirdPlusDate: UILabel!
    @IBOutlet var fourthPlusDate: UILabel!
    
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    @IBOutlet var fourthImageView: UIImageView!
    
    lazy var dayLabel = [firstDdayLabel, secondDdayLabel, thirdDdayLabel, fourthDdayLabel]
    lazy var plusDayLabel = [firstPlusDate, secondPlusDate, thirdPlusDate, fourthPlusDate]
    lazy var imageView = [firstImageView, secondImageView, thirdImageView, fourthImageView]
    
    let userDefault = UserDefaults.standard
    
    
    override func viewWillAppear(_ animated: Bool) {
        resultLabel()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    
    func setupUI() {
        for label in dayLabel {
            label?.text = ""
            label?.font = .boldSystemFont(ofSize: 20)
            label?.textColor = .white
        }
        for label in plusDayLabel {
            label?.text = ""
            label?.font = .italicSystemFont(ofSize: 20)
            label?.textColor = .white
            label?.textAlignment = .center
        }
        for image in imageView {
            image?.layer.cornerRadius = 20
            image?.clipsToBounds = true
            image?.layer.shadowColor = UIColor.red.cgColor
            image?.layer.shadowRadius = 10
            image?.layer.shadowOpacity = 0.5
        }
    }
    
    func resultLabel() {
        let dDay = userDefault.integer(forKey: "Dday")
        let result = Calendar.current.date(byAdding: .day, value: Int(dDay), to: self.datePicker.date)
        firstDdayLabel.text = "D + \(dDay)"
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        let dayValue = format.string(from: result!)
        firstPlusDate.text = dayValue
    }
    
    @IBAction func firstDayInputButton(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let popUp = storyboard.instantiateViewController(withIdentifier: "popupview")
        popUp.modalPresentationStyle = .fullScreen
        popUp.modalTransitionStyle = .crossDissolve
        
        self.present(popUp, animated: true)
    }
    //
    //    @IBAction func secondDayInputButton(_ sender: UIButton) {
    //        dayInput(Dday: secondDdayLabel,
    //                 plusResultDate: secondPlusDate)
    //    }
    //
    //    @IBAction func thirdDayInputButton(_ sender: UIButton) {
    //        dayInput(Dday: thirdDdayLabel, plusResultDate: thirdPlusDate)
    //    }
    //    @IBAction func fourthDdayLabel(_ sender: UIButton) {
    //        dayInput(Dday: fourthDdayLabel, plusResultDate: fourthPlusDate)
    //    }
    
    
    
    //    func dayInput(Dday: UILabel, plusResultDate: UILabel) {
    //
    //        let alert = UIAlertController(title: "D-Day", message: "값을 입력해주세요", preferredStyle: .alert)
    //
    //        let ok = UIAlertAction(title: "OK", style: .default) {
    //            (ok) in
    //            Dday.text = "D + \(alert.textFields![0].text!)"
    //            let plusDate = Int(alert.textFields![0].text!)
    //            let result = Calendar.current.date(byAdding: .day, value: plusDate ?? 0, to: self.datePicker.date)
    //            let format = DateFormatter()
    //            format.dateFormat = "yyyy년 MM월 dd일"
    //            let dayValue = format.string(from: result!)
    //            plusResultDate.text = dayValue
    //
    //        }
    //        let cancel = UIAlertAction(title: "cancel", style: .cancel)
    //        alert.addAction(cancel)
    //        alert.addAction(ok)
    //        alert.addTextField { (dayField) in dayField.keyboardType = .numberPad
    //            dayField.placeholder = "숫자만 입력해주세요"
    //        }
    //        self.present(alert, animated: true)
    //    }
    
    @IBAction func firstButtonTapped(_ sender: Any) {
        
        
        
    }
    
}




class PopUpViewConroller: UIViewController {
    private var titleText: String?
    private var messageText: String?
    private var attributedMessageText: NSAttributedString?
    private var contentView: UIView?
}

