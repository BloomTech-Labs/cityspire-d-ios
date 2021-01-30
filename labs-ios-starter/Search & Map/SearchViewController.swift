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
        doGeoCode(searchBar.text ?? "")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    private func doGeoCode(_ query: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(query) { placemarks, error in
            guard error == nil else {
                print("geocode error: \(error!)")
                return
            }
            guard
                let placemark = placemarks?.first,
                let location = placemark.location,
                let circularRegion = placemark.region as? CLCircularRegion
            else {
                fatalError("placemark problem")
            }
            guard
                let country = placemark.country,
                country == "United States"
            else {
                print("Data is only available for the United States.")
                return
            }

            self.mapView.removeAnnotations(self.mapView.annotations)

            let annotation = MKPointAnnotation()
            annotation.title = placemark.name
            annotation.coordinate = location.coordinate
            self.mapView.addAnnotation(annotation)

            let center = circularRegion.center
            let radius = circularRegion.radius
            let multiplier = 4.0
            let region = MKCoordinateRegion(center: center, latitudinalMeters: radius*multiplier, longitudinalMeters: radius*multiplier)
            self.mapView.setRegion(region, animated: true)

            self.searchBar.resignFirstResponder()
        }
    }
}
