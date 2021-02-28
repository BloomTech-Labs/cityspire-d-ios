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
    var latitude: Double?
    var longitude: Double?
    var rentAverage: Rent?
    var walkScore: WalkScore?
    var crimeScore: CrimeScore?
    var airQuality: AirQuality?
    var lifeScore: LifeScore?
    var population: Population?
    
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
    let score: Double
}

struct Population: Codable {
   let population: Double
}
