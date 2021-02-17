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
    var baseDSURL = URL(string: "http://cityspire-d-ds-01.eba-5qfhebrw.us-east-1.elasticbeanstalk.com/")!
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
    
    func fetch<T : Codable>(from url: URL, using session: URLSession = URLSession.shared, completion: @escaping (T?, Error?) -> Void) {
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "com.CitySpire.labs-ios-starter.ErrorDomain", code: -1, userInfo: nil))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let decodedObject = try jsonDecoder.decode(T.self, from: data)
                completion(decodedObject, nil)
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
    
    func urlFor(city: String, score: ScoreKeys) -> URL {
        switch score {
        case .rent:
            return baseDSURL.appendingPathComponent("rent_rate/\(city)")
            
        case .walk:
            return baseDSURL.appendingPathComponent("walk_scr/\(city)")
            
        case .crime:
            return baseDSURL.appendingPathComponent("crime_scr/\(city)")
            
        case .air:
            return baseDSURL.appendingPathComponent("air_qual_scr/\(city)")
            
        case .life:
            return baseDSURL.appendingPathComponent("city_scr/\(city)")
        
        case .population:
            return baseDSURL.appendingPathComponent("population_data/\(city)")
        }
    }
}
