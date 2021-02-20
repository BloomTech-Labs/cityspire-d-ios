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
    let cityId: Int
    let stateAbreviation: String
    let latitude: Double?
    let longitude: Double?
    let rentAverage: Rent?
    let walkScore: WalkScore?
    let crimeScore: CrimeScore?
    let airQuality: AirQuality?
    let lifeScore: LifeScore?
    let population: Population?
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city"
        case cityCode = "city_code"
        case cityId = "id"
        case stateAbreviation = "state"
        case latitude
        case longitude
        case rentAverage
        case walkScore
        case crimeScore
        case airQuality
        case lifeScore
        case population
    }
}

struct Rent : Codable {
    let msg: String
    let score: Int
    let avg_rent: Int
}

struct WalkScore : Codable {
    let msg: String
    let score: Int
    
}

struct CrimeScore : Codable {
    let msg: String
    let score: Int
}

struct AirQuality : Codable {
    let msg: String
    let score: Int
}

struct LifeScore : Codable {
    let msg: String
    let score: Int
}

struct Population: Codable {
   let population: Double
}
