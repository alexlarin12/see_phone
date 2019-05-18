//
//  LaunchController.swift
//  Project7
//
//  Created by пользователь on 16/05/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var Project7Label: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBAction func LoginButtonPassed(_ sender: UIButton) {
        if UsernameTextField.text == "name",
            PasswordTextField.text == "qwerty"{
            print("Успешный вход")
        }else{
            print("неверный логин или пароль")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        ScrollView?.addGestureRecognizer(hideKeyboardGesture)
    NotificationCenter.default.addObserver(self, selector:  #selector(self.keyboardWasShown(notification:)),name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)),name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWasShown(notification: Notification) {
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey)as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        
        self.ScrollView?.contentInset = contentInsets
    }
    @objc func keyboardWillBeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
        
    }
    @objc func hideKeyboard(){
        self.ScrollView.endEditing(true)
        
    }
}
