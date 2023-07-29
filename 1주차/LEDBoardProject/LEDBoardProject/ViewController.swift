//
//  ViewController.swift
//  LEDBoardProject
//
//  Created by 황인호 on 2023/07/19.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    @IBOutlet var textColorChangeButton: UIButton!
    
    @IBOutlet var resultLabel: UILabel!
    

    lazy var buttonArray = [sendButton, textColorChangeButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }

    func setUI() {
        view.backgroundColor = .black
        mainView.layer.cornerRadius = 8
        mainView.clipsToBounds = true
        
        for button in buttonArray {
            if let button {
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1
                button.layer.cornerRadius = 8
                button.clipsToBounds = true
            }
        }
        resultLabel.textColor = UIColor.red
        resultLabel.textAlignment = .center
        resultLabel.font = .boldSystemFont(ofSize: 50)
    }

    @IBAction func colorChangeButtonTapped(_ sender: UIButton) {
        changeColor()
    }
    
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        resultLabel.text = inputTextField.text
    }
    
    @IBAction func viewTapGesture(_ sender: UITapGestureRecognizer) {
        
        if inputTextField.isEditing {
            view.endEditing(true)
        } else {
            mainView.isHidden.toggle()
        }
    }
    
    @IBAction func inputTextFieldReturned(_ sender: UITextField) {
        resignFirstResponder()
    }
    
    func changeColor() {
        let r : CGFloat = CGFloat.random(in: 0...1)
        let g : CGFloat = CGFloat.random(in: 0...1)
        let b : CGFloat = CGFloat.random(in: 0...1)
        self.resultLabel.textColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    
}

