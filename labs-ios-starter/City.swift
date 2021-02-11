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
    let rentAverage: Rent?
    let walkScore: WalkScore?
    let crimeScore: CrimeScore?
    let airQuality: AirQuality?
    let lifeScore: LifeScore?
    
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

struct Rent : Codable {
    let msg: String
    let score: Int
    let avg_rent: Int
}

struct WalkScore : Codable {
    let msg: String
    let score: Int
    let raw_score: Int
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
