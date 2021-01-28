//
//  SearchViewController.swift
//  labs-ios-starter
//
//  Created by Chad Parker on 1/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
