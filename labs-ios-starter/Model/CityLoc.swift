//
//  CityLoc.swift
//  labs-ios-starter
//
//  Created by Chad Parker on 2/23/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

/// Holds data from `CityLocs.json`, cached geocoded coordinates we didn't get from the web/DS API
struct CityLoc: Codable {
    
    let city: String
    let state: String
    let latitude: Double
    let longitude: Double
}
