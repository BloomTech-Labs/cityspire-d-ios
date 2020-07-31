//
//  ProfileTabBarViewController.swift
//  labs-ios-starter
//
//  Created by Spencer Curtis on 7/31/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ProfileTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationExpired,
                                                             object: nil,
                                                             queue: .main,
                                                             using: dismissToLogin)
    }
    
    func dismissToLogin(_ notification: Notification)  {
        dismiss(animated: true, completion: nil)
    }
}
