//
//  CityController.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

class CityController {
    
    @discardableResult func createFavoriteCity(cityPhoto: Data, cityCode: String, cityId: Double, cityName: String, stateAvreviation: String, airQualityScore: AirQualityCoreData, crimeScore: CrimeScoreCoreData, lifeScore: LifeScoreCoreData, populationScore: PopulationCoreData, rentScore: RentCoreData, walkScore: WalkScoreCoreData) -> CityCoreData {
        
        let newFavoriteCity = CityCoreData(cityPhoto: cityPhoto, cityCode: cityCode, cityId: cityId, cityName: cityName, stateAbreviation: stateAvreviation, airQualityScore: airQualityScore, crimeScore: crimeScore, lifeScore: lifeScore, populationScore: populationScore, rentScore: rentScore, walkScore: walkScore)
        
        CoreDataStack.shared.saveToPersistentStore()
        
        return newFavoriteCity
    }
    
}
