//
//  Profile.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

struct Profile: Codable {
    
    let id: String
    let email: String
    let name: String
    let avatarURL: URL?
    
    /// Storing the `avatarImage` on the model object itself is fine up to a point due to potentially using too much memory. If you know you will be storing a large amount of images, using a cache and clearing it out after you hit a certain amount of information in it would be better.
    var avatarImage: UIImage? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case name
        case avatarURL = "avatarUrl"
    }
}

struct ProfileWithMessage: Codable {
    let profile: Profile
    let message: String?
}
