//
//  UIViewController+SimpleAlert.swift
//  labs-ios-starter
//
//  Created by Spencer Curtis on 7/30/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentSimpleAlert(with title: String?,
                            message: String?,
                            preferredStyle: UIAlertController.Style,
                            dismissText: String,
                            completionUponDismissal: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let dismissAction = UIAlertAction(title: dismissText, style: .cancel, handler: completionUponDismissal)
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
    }
}
