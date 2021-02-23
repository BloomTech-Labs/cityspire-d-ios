//
//  Scores+Convenience.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

extension AirQualityCoreData {
    convenience init(score: Double,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.score = score
    }
    
}

extension CrimeScoreCoreData {
    convenience init(score: Double,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.score = score
    }
    
}

extension LifeScoreCoreData {
    convenience init(score: Double,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.score = score
    }
    
}

extension PopulationCoreData {
    convenience init(population: Double,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.population = population
    }
    
}

extension RentCoreData {
    convenience init(score: Double,
                     averageRent: Double,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.score = score
        self.averageRent = averageRent
    }
    
}

extension WalkScoreCoreData {
    convenience init(score: Double,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.score = score
    }
    
}
