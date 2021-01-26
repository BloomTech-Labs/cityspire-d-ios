//
//  MyProfileViewController.swift
//  labs-ios-starter
//
//  Created by Christian Lorenzo on 1/25/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ImageViewOutlet
        imageViewUpdate()
    }
    
    func imageViewUpdate() {
        guard let myProfileView = profileImageOutlet else { return }
        myProfileView.layer.borderWidth = 1.0
        myProfileView.layer.masksToBounds = false
        myProfileView.layer.borderColor = UIColor.black.cgColor
        myProfileView.layer.cornerRadius = profileImageOutlet.frame.size.width / 2
        myProfileView.clipsToBounds = true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
