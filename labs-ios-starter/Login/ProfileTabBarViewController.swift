//
//  ProfileTabBarViewController.swift
//  labs-ios-starter
//
//  Created by Spencer Curtis on 7/31/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ProfileTabBarViewController: UITabBarController {
    
    @IBOutlet weak var profileImageOutlet: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //ProfileView
        imageViewUpdate()
        
        NotificationCenter.default.addObserver(forName: .oktaAuthenticationExpired,
                                                             object: nil,
                                                             queue: .main,
                                                             using: dismissToLogin)
    }
    
    func imageViewUpdate() {
        guard let myProfileView = profileImageOutlet else { return }
        myProfileView.layer.borderWidth = 1.0
        myProfileView.layer.masksToBounds = false
        myProfileView.layer.borderColor = UIColor.white.cgColor
        myProfileView.layer.cornerRadius = profileImageOutlet.frame.size.width / 2
        myProfileView.clipsToBounds = true
        
    }
    
    func dismissToLogin(_ notification: Notification)  {
        dismiss(animated: true, completion: nil)
    }
}
