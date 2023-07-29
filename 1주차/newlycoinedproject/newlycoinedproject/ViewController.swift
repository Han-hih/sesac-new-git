//
//  ViewController.swift
//  newlycoinedproject
//
//  Created by 황인호 on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var firstWordButton: UIButton!
    @IBOutlet var secondWordButton: UIButton!
    @IBOutlet var thirdWordButton: UIButton!
    @IBOutlet var fourthWordButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    
    let newlyConiedArray = ["알잘딱깔센": "알아서 잘 딱 깔끔하게 센스있게",
                            "별다줄": "별거 다 줄인다",
                            "버카충": "버스카드충전",
                            "삼귀자": "연애를 시작하기 전 썸 단계!",
                            "얼죽아": "얼어 죽어도 아이스커피",
                            "꾸안꾸": "꾸민 듯 안 꾸민듯",
                            "낄끼빠빠": "낄 때 끼고 빠질 때 빠지자"
    ]
    
    lazy var buttonArray : [UIButton] = [firstWordButton, secondWordButton, thirdWordButton, fourthWordButton]
    
    var buttonTextArray: [String] = ["button", "button", "button", "button"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
    }
    
    func setUI() {
        inputTextField.layer.borderColor = UIColor.black.cgColor
        inputTextField.layer.borderWidth = 3
        inputTextField.placeholder = "신조어를 입력해주세요"
        inputTextField.clearButtonMode = .always
        resultLabel.text = "안녕하세요"
        
        for button in buttonArray {
            
                    button.layer.cornerRadius = 10
                    button.layer.borderWidth = 2
                    button.layer.borderColor = UIColor.black.cgColor
                    button.tintColor = UIColor.black
                    button.isHidden = true
        }
    }
    
    
    
    @IBAction func inputFieldTapped(_ sender: Any) {
        getDictionaryResult()
    }
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        inputTextField.text = sender.currentTitle
    }
    
//    @IBAction func searchButtonTapped(_ sender: UIButton) {
//        getDictionaryResult()
//    }
    
    func getDictionaryResult() {
        let result = inputTextField.text!
        
        if newlyConiedArray[result] != nil && !buttonTextArray.contains(result) {
            resultLabel.text = newlyConiedArray[result]
            buttonTextArray.insert(inputTextField.text!, at: 0)
            buttonText()
            buttonTextArray.removeLast()
            print(buttonTextArray)
        } else if  newlyConiedArray[result] != nil && buttonTextArray.contains(result) {
            resultLabel.text = newlyConiedArray[result]
        }
        else {
            resultLabel.text = "찾으시는 단어가 없습니다."
        }
    }
    
    func buttonText() {
        for i in 0...3 {
            buttonArray[i].setTitle(buttonTextArray[i], for: .normal)
            if buttonTextArray[i] != "button" {
                            buttonArray[i].isHidden = false
                        }
        }
    }
    
    @IBAction func tpaGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    }
    

