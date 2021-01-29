//
//  LocationDataModelController.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 1/29/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation


class LocationDataModelController {
    
    private let baseURLBaseLocationData = URL(string: "https://gist.githubusercontent.com/Miserlou/c5cd8364bf9b2420bb29/raw/2bf258763cdddd704f8ffd3ea9a3e81d25e2c6f6/cities.json")
    private let baseURLPollutionData = URL(string: "https://api.airvisual.com/v2")!
    
    private let pollutionDataApiKey = "7cc90139-bfec-4859-8f55-fca7bf666056"
    
    
    
    func fetchAllCities() {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func url(forPollutionData fromCity: String, fromState: String) -> URL {
        var url = baseURLPollutionData
        url.appendPathComponent("city")
        
        let urlComponents = NSURLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [URLQueryItem(name: "city", value: fromCity),
                                    URLQueryItem(name: "state", value: fromState),
                                    URLQueryItem(name: "country", value: "USA"),
                                    URLQueryItem(name: "key", value: pollutionDataApiKey)]
        
        return urlComponents.url!
    }
}
