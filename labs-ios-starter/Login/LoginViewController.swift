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
            
            if exists {
                self.performSegue(withIdentifier: "ShowDetailProfileList", sender: nil)
            } else {
                self.performSegue(withIdentifier: "ModalAddProfile", sender: nil)
            }
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
