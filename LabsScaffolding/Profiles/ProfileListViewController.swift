//
//  ProfileListViewController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import OktaAuth

class ProfileListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var profileController = ProfileController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(refresh), name: .oktaAuthenticationSuccessful, object: nil)
        
    }
    
    @objc func refresh() {
        profileController.getAllProfiles {
            print("Finished")
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProfileDetail" {
            
            guard let profileDetailVC = segue.destination as? ProfileDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else {
                    return
            }
            
            profileDetailVC.profile = profileController.profiles[indexPath.row]
        }
    }
}

extension ProfileListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileController.profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        
        let profile = profileController.profiles[indexPath.row]
        cell.textLabel?.text = profile.name
        
        return cell
    }
    
}
