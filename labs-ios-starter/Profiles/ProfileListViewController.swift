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
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        refresh()
    }
    
    // MARK: - Private Methods
    
    private func refresh() {
        profileController.getAllProfiles {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProfileDetail" {
            
            guard let profileDetailVC = segue.destination as? ProfileDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else {
                    return
            }
            
            profileDetailVC.isUsersProfile = false
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
        cell.detailTextLabel?.text = profile.email
        
        return cell
    }
    
}
