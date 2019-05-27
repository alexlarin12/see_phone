//
//  LaunchController.swift
//  Project7
//
//  Created by пользователь on 16/05/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var Project7Label: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    //MARK:-Actions
    
    @IBAction func unwindSegue(unwindSegue:UIStoryboardSegue) {
    }
    
    @IBAction func LogInButtonPassed(_ sender: UIButton) {
     checkTextFields()
        
    }
    
    func checkTextFields() {
        if UsernameTextField.text == "",
        PasswordTextField.text == "" {
        print("Успешный вход.")
        performSegue(withIdentifier: "showFriendsController", sender: nil)
        } else {
        let alert = UIAlertController(title: "Error", message: "Incorrect login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
        self.PasswordTextField.text = ""
            }
            
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
           ScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:  #selector(self.keyboardWasShown(notification:)),name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK:- Keyboard
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
    //MARK:- Segues
 
    
    
}

