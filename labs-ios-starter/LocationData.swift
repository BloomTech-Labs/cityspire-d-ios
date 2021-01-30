//
//  LocationData.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 1/29/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

//7cc90139-bfec-4859-8f55-fca7bf666056
// get the aqi air quality index

struct LocationData : Codable {
    let cityName: String
    let latitude: Double
    let longitude: Double
    let population: String
    let rank: String
    let stateName: String
    let pollution: AirQualityData?
    
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city"
        case latitude
        case longitude
        case population
        case rank
        case stateName = "state"
        case pollution
    }
}

struct AirQualityData : Codable {
//    /http://api.airvisual.com/v2/city?city=Los Angeles&state=California&country=USA&key={{YOUR_API_KEY}}

    let pollution: Pollution
}

struct Pollution : Codable {
    let airQualityIndex: String
    
    enum CodingKeys: String, CodingKey {
        case airQualityIndex = "aqius"
    }
}
