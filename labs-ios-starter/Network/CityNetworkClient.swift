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
}
