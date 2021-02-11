//
//  City.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

struct City : Codable {
    let cityName: String
    let cityCode: String
    let cityId: String
    let stateAbreviation: String
    let rentAverage: String?
    let walkScore: String?
    let crimeScore: String?
    let airQuality: String?
    let lifeScore: String?
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city"
        case cityCode = "city_code"
        case cityId = "id"
        case stateAbreviation = "state"
        case rentAverage
        case walkScore
        case crimeScore
        case airQuality
        case lifeScore
    }
}
