//
//  ProfileDetailViewController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/27/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    // MARK: - Properties and Outlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var profileController: ProfileController = ProfileController.shared
    var profile: Profile?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Private Methods
    
    
    // MARK: View Setup
    
    private func updateViews() {
        
        guard let profile = profile,
            isViewLoaded else { return }
        
        title = "Details"
        
        nameLabel.text = profile.name
        emailLabel.text = profile.email
        
        if let avatarImage = profile.avatarImage {
            avatarImageView.image = avatarImage
        } else if let avatarURL = profile.avatarURL {
            profileController.image(for: avatarURL, completion: { [weak self] (avatarImage) in
                
                guard let self = self else { return }
                
                self.profile?.avatarImage = avatarImage
                self.avatarImageView.image = avatarImage
            })
        }
    }
}
