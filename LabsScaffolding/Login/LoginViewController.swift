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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(checkForExistingProfile),
                                               name: .oktaAuthenticationSuccessful,
                                               object: nil)
    }
    

    @IBAction func signIn(_ sender: Any) {
        UIApplication.shared.open(OktaAuth.shared.identityAuthURL()!)
    }
    
    @objc func checkForExistingProfile() {
        
        ProfileController.shared.checkForExistingLoggedInUserProfile { [weak self] (exists) in
            
            guard let self = self,
                self.presentedViewController == nil else { return }
            
            if exists {
                self.performSegue(withIdentifier: "ShowDetailProfileList", sender: nil)
            } else {
                self.performSegue(withIdentifier: "ModalAddProfile", sender: nil)
            }
        }
    }
}
