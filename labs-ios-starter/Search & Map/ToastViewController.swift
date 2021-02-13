//
//  ToastViewController.swift
//  labs-ios-starter
//
//  Created by Chad Parker on 2/8/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class ToastViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var closeButtonArea: UIView!
    @IBOutlet weak var progressView: UIView!
    
    let startPositionY: CGFloat = -100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.alpha = 0
    }
    
    func showMessage(_ message: String) {
        messageLabel.text = message
        
        view.frame.origin.y = startPositionY
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.view.frame.origin.y = 0
            self.view.alpha = 1
        }
        
        progressView.frame.size.width = 0
        UIView.animate(withDuration: 5.0, delay: 0, options: .curveLinear) {
            self.progressView.frame.size.width = self.closeButtonArea.frame.size.width
        } completion: { finished in
            self.hide()
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.hide()
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.view.frame.origin.y = self.startPositionY
            self.view.alpha = 0
        }
    }
}
