//
//  SearchViewController.swift
//  labs-ios-starter
//
//  Created by Chad Parker on 1/27/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var detailContainerView: UIView!
    
    var toastVC: ToastViewController!
    var detailVC: SharedDetailViewController!
    
    let cityNetworkClient = CityNetworkClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailContainerView.isHidden = true
        loadAllCities()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doGeoCode(searchBar.text ?? "")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toastVC = segue.destination as? ToastViewController {
            self.toastVC = toastVC
        } else if let detailVC = segue.destination as? SharedDetailViewController {
            self.detailVC = detailVC
        }
    }
    
    private func loadAllCities() {
        cityNetworkClient.fetchAllCities { result in
            switch result {
            case .success(_):
                
                guard let url = Bundle.main.url(forResource: "CityLocs", withExtension: "json") else {
                    fatalError("couldn't load file")
                }
                
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let cityLocs = try decoder.decode([CityLoc].self, from: data)
                    
                    var citiesWithCoordinates = [City]()
                    for city in self.cityNetworkClient.cities {
                        let matchingCityLoc = cityLocs.filter { $0.city == city.cityName && $0.state == city.stateAbreviation }[0]
                        var cityCopy = city
                        cityCopy.latitude = matchingCityLoc.latitude
                        cityCopy.longitude = matchingCityLoc.longitude
                        citiesWithCoordinates.append(cityCopy)
                    }
                    self.cityNetworkClient.cities = citiesWithCoordinates
                    
                    DispatchQueue.main.async {
                        self.placeAllCityPins()
                    }
                } catch {
                    print("error:\(error)")
                }

            case .failure(let networkError):
                print("Error from CityNetworkClient: \(networkError.localizedDescription)")
            }
        }
    }
    
    private func placeAllCityPins() {
        for city in self.cityNetworkClient.cities {
            guard let latitude = city.latitude,
                  let longitude = city.longitude else { continue }
            
            let annotation = MKPointAnnotation()
            annotation.title = city.cityName
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            self.mapView.addAnnotation(annotation)
        }
    }

    private func doGeoCode(_ query: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(query) { placemarks, error in
            guard error == nil else {
                guard let clError = error as? CLError else {
                    NSLog("Geocode error was not a CLError: \(error!)")
                    return
                }
                
                let message: String
                switch clError.code {
                case .network:
                    message = "Network error. Please connect device to internet."
                case .geocodeFoundNoResult:
                    message = "No result found."
                case .locationUnknown:
                    message = "Location unknown."
                default:
                    message = "Error occured. Please try again."
                    NSLog("Unknown error occured: \((clError as NSError).localizedDescription)")
                }
                self.toastVC.showMessage(message)
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
                self.toastVC.showMessage("Data is only available for the United States.")
                return
            }

            self.mapView.removeAnnotations(self.mapView.annotations)

            let annotation = MKPointAnnotation()
            annotation.title = placemark.name
            annotation.coordinate = location.coordinate
            self.mapView.addAnnotation(annotation)

            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let radius = circularRegion.radius
            let region = MKCoordinateRegion(center: center, latitudinalMeters: radius*2, longitudinalMeters: radius*2)
            self.mapView.setRegion(region, animated: true)

            self.searchBar.resignFirstResponder()
        }
    }
    
    private func showDetailContainerView() {
        detailContainerView.isHidden = false
    }
    
    private func hideDetailContainerView() {
        detailContainerView.isHidden = true
    }
}

extension SearchViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard
            let annotation = view.annotation,
            let title = annotation.title
        else {
            return
        }
        
        detailVC.cityNameLabel.text = title
        
        showDetailContainerView()
    }
}
