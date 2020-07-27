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
    let avatarURL: URL
    var avatarImage: UIImage? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case name
        case avatarURL = "avatarUrl"
    }
}
