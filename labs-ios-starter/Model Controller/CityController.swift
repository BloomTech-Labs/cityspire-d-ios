//
//  CityController.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

class CityController {
    
    @discardableResult func createCityInCoreData(cityPhoto: Data, cityCode: String, cityId: Double, cityName: String, stateAvreviation: String, airQualityScore: AirQualityCoreData, crimeScore: CrimeScoreCoreData, lifeScore: LifeScoreCoreData, populationScore: PopulationCoreData, rentScore: RentCoreData, walkScore: WalkScoreCoreData) -> CityCoreData {
        
        let newFavoriteCity = CityCoreData(cityPhoto: cityPhoto, cityCode: cityCode, cityId: cityId, cityName: cityName, stateAbreviation: stateAvreviation, airQualityScore: airQualityScore, crimeScore: crimeScore, lifeScore: lifeScore, populationScore: populationScore, rentScore: rentScore, walkScore: walkScore)
        
        CoreDataStack.shared.saveToPersistentStore()
        
        return newFavoriteCity
    }
    
    func updateCityInCoreData(cityCoreData: CityCoreData, cityPhoto: Data, cityCode: String, cityId: Double, cityName: String, stateAbvreviation: String, airQualityScore: AirQualityCoreData, crimeScore: CrimeScoreCoreData, lifeScore: LifeScoreCoreData, populationScore: PopulationCoreData, rentScore: RentCoreData, walkScore: WalkScoreCoreData) {
        
        cityCoreData.cityPhoto = cityPhoto
        cityCoreData.cityCode = cityCode
        cityCoreData.cityId = cityId
        cityCoreData.cityName = cityName
        cityCoreData.stateAbreviation = stateAbvreviation
        cityCoreData.airQualityScore = airQualityScore
        cityCoreData.crimeScore = crimeScore
        cityCoreData.lifeScore = lifeScore
        cityCoreData.populationScore = populationScore
        cityCoreData.rentScore = rentScore
        cityCoreData.walkScore = walkScore
    }
    
    func deleteCityFromCoreData(cityToDelete: NSManagedObject, airQualityScore: AirQualityCoreData,crimeScore: CrimeScoreCoreData, lifeScore: LifeScoreCoreData, populationScore: PopulationCoreData, rentScore: RentCoreData, walkScore: WalkScoreCoreData ) {
        CoreDataStack.shared.mainContext.delete(airQualityScore)
        CoreDataStack.shared.mainContext.delete(crimeScore)
        CoreDataStack.shared.mainContext.delete(lifeScore)
        CoreDataStack.shared.mainContext.delete(populationScore)
        CoreDataStack.shared.mainContext.delete(rentScore)
        CoreDataStack.shared.mainContext.delete(walkScore)
        CoreDataStack.shared.mainContext.delete(cityToDelete)
        CoreDataStack.shared.saveToPersistentStore()
    }
}
