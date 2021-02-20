//
//  FavoriteCity+Convenience.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

extension CityCoreData {
    
    convenience init(cityCode: String,
                     cityId: Double,
                     cityName: String,
                     stateAbreviation: String,
                     airQualityScore: AirQualityCoreData,
                     crimeScore: CrimeScoreCoreData,
                     lifeScore: LifeScoreCoreData,
                     populationScore: PopulationCoreData,
                     rentScore: RentCoreData,
                     walkScore: WalkScoreCoreData,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.cityCode = cityCode
        self.cityId = cityId
        self.cityName = cityName
        self.stateAbreviation = stateAbreviation
        self.airQualityScore = airQualityScore
        self.crimeScore = crimeScore
        self.lifeScore = lifeScore
        self.populationScore = populationScore
        self.rentScore = rentScore
        self.walkScore = walkScore
    }
}
