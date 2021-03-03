//
//  LoginViewController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import OktaAuth

class LoginViewController: UIViewController {
    
    let profileController = ProfileController.shared
    
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationSuccessful,
                                               object: nil,
                                               queue: .main,
                                               using: checkForExistingProfile)
        
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationExpired,
                                               object: nil,
                                               queue: .main,
                                               using: alertUserOfExpiredCredentials)
        
        //Letter animation
        appNameLabel.text = ""
        var charIndex = 0.0
        let titleText = "CitySpire"
        
        for letter in titleText {
            print("-")
            print(0.1 * charIndex)
            print(letter)
            
            Timer.scheduledTimer(withTimeInterval: 0.15 * charIndex, repeats: false) { (timer) in
                self.appNameLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        //Corner radius
        let myBorderColor: UIColor = UIColor(displayP3Red: 184, green: 184, blue: 184, alpha: 0.15)
        signInButtonOutlet.layer.borderWidth = 1
        signInButtonOutlet.layer.borderColor = myBorderColor.cgColor
        signInButtonOutlet.layer.cornerRadius = 15
        signInButtonOutlet.layer.masksToBounds = true
    }
        
        // MARK: - Actions
        
        @IBAction func signIn(_ sender: Any) {
            UIApplication.shared.open(ProfileController.shared.oktaAuth.identityAuthURL()!)
        }
        
        // MARK: - Private Methods
        
        private func alertUserOfExpiredCredentials(_ notification: Notification) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentSimpleAlert(with: "Your Okta credentials have expired",
                                        message: "Please sign in again",
                                        preferredStyle: .alert,
                                        dismissText: "Dimiss")
            }
        }
        
        // MARK: Notification Handling
        
        private func checkForExistingProfile(with notification: Notification) {
            checkForExistingProfile()
        }
        
        private func checkForExistingProfile() {
            profileController.checkForExistingAuthenticatedUserProfile { [weak self] (exists) in
                
                guard let self = self,
                      self.presentedViewController == nil else { return }
                
                // This will perform a segue to our tab bar view if sucessfull and will show an alert if not.
                
                if exists {
                    self.performSegue(withIdentifier: "SegueToTabBarController", sender: nil)
                } else {
                    let alert = UIAlertController(title: "Login Failed", message: "Please try again", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
                
                // ATTENTION: ORIGINAL CODE
                //            if exists {
                //                self.performSegue(withIdentifier: "ShowDetailProfileList", sender: nil)
                //            } else {
                //                self.performSegue(withIdentifier: "ModalAddProfile", sender: nil)
                //            }
            }
        }
        
        // MARK: - Navigation
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ModalAddProfile" {
                guard let addProfileVC = segue.destination as? AddProfileViewController else { return }
                addProfileVC.delegate = self
            }
        }
    }

// MARK: - Add Profile Delegate

extension LoginViewController: AddProfileDelegate {
    func profileWasAdded() {
        checkForExistingProfile()
    }
}
