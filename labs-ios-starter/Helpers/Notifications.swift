//
//  Notifications.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let oktaAuthenticationSuccessful = Notification.Name("oktaAuthenticationSuccessful")
    static let oktaAuthenticationFailed = Notification.Name("oktaAuthenticationFailed")
    static let oktaAuthenticationExpired = Notification.Name("oktaAuthenticationExpired")
}
