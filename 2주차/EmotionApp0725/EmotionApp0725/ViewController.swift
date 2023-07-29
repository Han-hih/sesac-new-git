//
//  ViewController.swift
//  EmotionApp0725
//
//  Created by 황인호 on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var veryHappyButton: UIButton!
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var sosoButton: UIButton!
    @IBOutlet var notGoodButton: UIButton!
    @IBOutlet var badButton: UIButton!
    
 
    @IBOutlet var pulldownButton: UIButton!
    
    lazy var buttonArray = [veryHappyButton, happyButton, sosoButton, notGoodButton, badButton]
    
    var plus = 1
    

    
    var tappedCount = [0, 0, 0, 0, 0]
    
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupMenu()
      
    }
//    @IBAction func buttonTapped(_ sender: UIButton) {
//        tappedCount[resultNum.RawValue]
//        }
    
    @IBAction func veryHappyButtonTapped(_ sender: UIButton) {
        tappedCount[0] += plus
        print(tappedCount)
        userDefault.set(tappedCount[0], forKey: "veryHappy")
    
    }
    
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        tappedCount[1] += plus
        print(tappedCount)
        userDefault.set(tappedCount[1], forKey: "happy")
        
    }
    
    @IBAction func sosoButtonTapped(_ sender: UIButton) {
        tappedCount[2] += plus
        print(tappedCount)
        userDefault.set(tappedCount[2], forKey: "soso")
    }
    
    @IBAction func notgoodButtonTapped(_ sender: UIButton) {
        tappedCount[3] += plus
        print(tappedCount)
        userDefault.set(tappedCount[3], forKey: "notgood")
    }
    
    @IBAction func badButtonTapped(_ sender: UIButton) {
        tappedCount[4] += plus
        print(tappedCount)
        userDefault.set(tappedCount[4], forKey: "bad")
    }
    
    
    
    func setupMenu() {
        let addOne = UIAction(title: "+1") { _ in
            self.plus = 1
        }
        let addFive = UIAction(title: "+5") { _ in
            self.plus = 5
        }
        let addTen = UIAction(title: "+10") { _ in
            self.plus = 10
        }
        let reset = UIAction(title: "reset") { _ in
            self.buttonArray.forEach { (button) in
                button?.tag = 0
                self.plus = 1
            }
        }
        
        let menu = UIMenu(title: "", children: [addOne, addFive, addTen, reset])
        pulldownButton.menu = menu
        
    }
    
}
