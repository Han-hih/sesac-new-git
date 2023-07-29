//
//  popupWindowViewcontroller.swift
//  DdayCalculator
//
//  Created by 황인호 on 2023/07/27.
//

import UIKit

class popupWindowViewcontroller: UIViewController {
    
    @IBOutlet var popupView: UIView!
    @IBOutlet var inputTextField: UITextField!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUI()
        
        
    }
    
    
    func setUI() {
        
        inputTextField.delegate = self
        inputTextField.placeholder = "숫자를 입력해주세요."
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 10
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        view.isOpaque = false
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        userDefault.set(inputTextField.text!, forKey: "Dday")
    }
    
    
    //
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
}
class pasteResult: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
}

extension popupWindowViewcontroller: UITextFieldDelegate {
    //    글자를 입력할 때마다 받을지 말지 해주는 함수
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count < 5
    }
}

