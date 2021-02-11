//
//  CityNetworkClient.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 2/7/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noIdentifier
    case otherError
    case noData
    case noDecode
    case noEncode
    case noRep
    
}


class CityNetworkClient {
    
    var cities: [City] = []
    var baseDSURL = URL(string: "https://cityspire.dananderson.dev")!
    let jsonDecoder = JSONDecoder()
    
    
    func fetchAllCities(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let allCitiesURL = baseDSURL.appendingPathComponent("cities")
        
        URLSession.shared.dataTask(with: allCitiesURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let decodedCities = try self.jsonDecoder.decode([City].self, from: data)
                self.cities = decodedCities
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
            
            completion(.success(true))
        }.resume()
    }
    
//    // fetch rent
//    {
//      "msg": "average rent",
//      "score": 4,
//      "avg_rent": 2100
//    }
    func fetchAverageRent(forCity city: String, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        
        let averageRentForCityURL = baseDSURL.appendingPathComponent("city_scr/\(city)")
        
        URLSession.shared.dataTask(with: averageRentForCityURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let decodedCities = try self.jsonDecoder.decode([City].self, from: data)
                self.cities = decodedCities
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
            
            completion(.success(true))
        }.resume()
    }
    
    
//
//    // fetch walk score
//    {
//      "msg": "city walk score",
//      "score": 4,
//      "raw_score": 75
//    }
//    // crime score
//    {
//      "msg": "crime score",
//      "score": 4,
//    }
//
//    // airquality score
//    {
//      "msg": "air quality score",
//      "score": 5,
//    }
//
//    // overall score
//    {
//      "msg": "overall quality of life score",
//      "score": 4,
//    }
    
}
