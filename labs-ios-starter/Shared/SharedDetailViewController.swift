//
//  SharedDetailViewController.swift
//  labs-ios-starter
//
//  Created by Chad Parker on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class SharedDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var city: CityCoreData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if city != nil {
            cityNameLabel.text = city.cityName
        }
    }
}
