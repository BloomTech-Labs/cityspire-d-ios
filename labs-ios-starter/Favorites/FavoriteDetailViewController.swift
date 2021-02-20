//
//  FavoriteDetailViewController.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/3/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class FavoriteDetailViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var city: City!
    
    var sharedDetailVC: SharedDetailViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.isUserInteractionEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sharedDetailVC = segue.destination as? SharedDetailViewController {
            sharedDetailVC.city = self.city
            self.sharedDetailVC = sharedDetailVC
        }
    }
}
