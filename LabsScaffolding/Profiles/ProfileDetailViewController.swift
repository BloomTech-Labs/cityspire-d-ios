//
//  ProfileDetailViewController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/27/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var profileController: ProfileController = ProfileController.shared
    var profile: Profile?

    override func viewDidAppear(_ animated: Bool) {
        updateViews()
    }
    
    private func updateViews() {
        
        guard let profile = profile,
            isViewLoaded else { return }
        
        nameLabel.text = profile.name
        emailLabel.text = profile.email
        
        if let avatarImage = profile.avatarImage {
            avatarImageView.image = avatarImage
        } else {
            profileController.image(for: profile.avatarURL, completion: { [weak self] (avatarImage) in
                self?.avatarImageView.image = avatarImage
            })
        }
    }
}
