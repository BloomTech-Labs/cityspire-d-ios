//
//  MyProfileViewController.swift
//  labs-ios-starter
//
//  Created by Christian Lorenzo on 1/25/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    //TextField outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    //Button outlet
    @IBOutlet weak var editButtonOutlet: UIButton!
    
    //Image Outlet
    @IBOutlet weak var profileImageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ImageViewOutlet
        imageViewUpdate()
        
        //Keyboard dismiss func:
        dismissKeyboard()
    }
    
    //Built-in function will load customized images after viewDidLoad loads the originals:
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.async {
            self.imageViewUpdate()
        }
    }
    
    //Dismissing keyboard when user taps outside the texfields:
    func dismissKeyboardFunc() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func imageViewUpdate() {
        guard let myProfileView = profileImageOutlet else { return }
        myProfileView.layer.borderWidth = 1.0
        myProfileView.layer.masksToBounds = false
        myProfileView.layer.borderColor = UIColor.gray.cgColor
        myProfileView.layer.cornerRadius = profileImageOutlet.frame.size.width / 2
        myProfileView.clipsToBounds = true
    }
}


extension MyProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            address1TextField.becomeFirstResponder()
        } else if textField == address1TextField {
            address2TextField.becomeFirstResponder()
        } else if textField == address2TextField {
            cityTextField.becomeFirstResponder()
        } else if textField == cityTextField {
            stateTextField.becomeFirstResponder()
        } else if textField == stateTextField {
            zipCodeTextField.becomeFirstResponder()
        } else if textField == zipCodeTextField {
            phoneNumberTextField.becomeFirstResponder()
        } else {
            phoneNumberTextField.resignFirstResponder()
        }
        
        return true
    }
}
