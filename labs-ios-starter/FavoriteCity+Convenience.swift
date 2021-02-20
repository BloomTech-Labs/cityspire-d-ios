//
//  FavoriteCity+Convenience.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/20/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation
import CoreData

extension FavoriteCity {
    
    convenience init(cityCode: String,
                     cityId: Double,
                     cityName: String,
                     stateAbreviation: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext
    ) {
        self.init(context: context)
        self.cityCode = cityCode
        self.cityId = cityId
        self.cityName = cityName
        self.stateAbreviation = stateAbreviation
    }
}
