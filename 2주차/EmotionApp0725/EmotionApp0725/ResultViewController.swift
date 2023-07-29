//
//  ResultViewController.swift
//  EmotionApp0725
//
//  Created by 황인호 on 2023/07/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var firstEmotionLabel: UILabel!
    @IBOutlet var secondEmotionLabel: UILabel!
    @IBOutlet var thirdEmotionLabel: UILabel!
    @IBOutlet var fourthEmotionLabel: UILabel!
    @IBOutlet var fifthEmotionLabel: UILabel!
    
    @IBOutlet var veryHappyrResultLabel: UILabel!
    @IBOutlet var happyResultLabel: UILabel!
    @IBOutlet var sosoResultLabel: UILabel!
    @IBOutlet var notGoodResultLabel: UILabel!
    @IBOutlet var badResultLabel: UILabel!
    
    let userDefault = UserDefaults.standard
    lazy var emotionLabel: [UILabel] = [firstEmotionLabel, secondEmotionLabel, thirdEmotionLabel, fourthEmotionLabel, fifthEmotionLabel]
    lazy var resultLabel: [UILabel] = [veryHappyrResultLabel, happyResultLabel, sosoResultLabel, notGoodResultLabel, badResultLabel]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        resultCount()
    }
//
//        override func viewDidDisappear(_ animated: Bool) {
//            resultCount()
//        }
//
    
    func setUI() {
        firstEmotionLabel.text = emotion.veryHappy.rawValue
        secondEmotionLabel.text = emotion.happy.rawValue
        thirdEmotionLabel.text = emotion.soso.rawValue
        fourthEmotionLabel.text = emotion.notGood.rawValue
        fifthEmotionLabel.text = emotion.bad.rawValue
    }
    
    func resultCount() {
        veryHappyrResultLabel.text = "\(userDefault.integer(forKey: resultNum.firstResult.rawValue))점"
        happyResultLabel.text = "\(userDefault.integer(forKey: resultNum.secondResult.rawValue))점"
        sosoResultLabel.text = "\(userDefault.integer(forKey: resultNum.thirdResult.rawValue))점"
        notGoodResultLabel.text = "\(userDefault.integer(forKey: resultNum.fourthResult.rawValue))점"
        badResultLabel.text = "\(userDefault.integer(forKey: resultNum.fifthResult.rawValue))점"
    }
    
    @IBAction func userDefaultResetButtonTapped(_ sender: UIButton) {
        resultNum.allCases.forEach{ userDefault.removeObject(forKey: $0.rawValue)}
        for label in resultLabel {
            label.text = "\(0)점"
        }
    }
    
    
}
