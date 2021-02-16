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
    
    func fetchAverageRent(forCity city: String, completion: @escaping (Result<Rent, NetworkError>) -> Void) {
        
        let averageRentForCityURL = baseDSURL.appendingPathComponent("rent_rate/\(city)")
        
        URLSession.shared.dataTask(with: averageRentForCityURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let rent = try self.jsonDecoder.decode(Rent.self, from: data)
                completion(.success(rent))
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
        }.resume()
    }
    
    
    func fetchWalkScore(forCity city: String, completion: @escaping (Result<WalkScore, NetworkError>) -> Void) {
        
        let walkScoreURL = baseDSURL.appendingPathComponent("walk_scr/\(city)")
        print(walkScoreURL)
        
        URLSession.shared.dataTask(with: walkScoreURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let walkScore = try self.jsonDecoder.decode(WalkScore.self, from: data)
                completion(.success(walkScore))
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
        }.resume()
    }
    
    func fetchCrimeScore(forCity city: String, completion: @escaping (Result<CrimeScore, NetworkError>) -> Void) {
        
        let crimeScoreCityURL = baseDSURL.appendingPathComponent("crime_scr/\(city)")
        
        URLSession.shared.dataTask(with: crimeScoreCityURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let crimeScore = try self.jsonDecoder.decode(CrimeScore.self, from: data)
                completion(.success(crimeScore))
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
        }.resume()
    }

    func fetchAirQuality(forCity city: String, completion: @escaping (Result<AirQuality, NetworkError>) -> Void) {
        
        let airQualityCityURL = baseDSURL.appendingPathComponent("air_qual_scr/\(city)")
        
        URLSession.shared.dataTask(with: airQualityCityURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let airQuality = try self.jsonDecoder.decode(AirQuality.self, from: data)
                completion(.success(airQuality))
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
        }.resume()
    }
    
    func fetchLifeScore(forCity city: String, completion: @escaping (Result<LifeScore, NetworkError>) -> Void) {
        
        let averageScoreCityURL = baseDSURL.appendingPathComponent("city_scr/\(city)")
        
        URLSession.shared.dataTask(with: averageScoreCityURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let lifeScore = try self.jsonDecoder.decode(LifeScore.self, from: data)
                completion(.success(lifeScore))
            } catch {
                print("Error unable to decode the data")
                completion(.failure(.noDecode))
            }
        }.resume()
    }
    
    func fetchPopulationForAGivenCity(forCity city: String, completion: @escaping (Result<Population, NetworkError>) -> Void) {
        
        let averageScoreCityURL = baseDSURL.appendingPathComponent("population_data/\(city)")
        
        URLSession.shared.dataTask(with: averageScoreCityURL) { (data, _, error) in
            if let error = error {
                print("Error \(error)")
            }
            
            guard let data = data else {
                print("No Data Returned from API")
                return
            }
            
            do {
                let lifeScore = try self.jsonDecoder.decode(Population.self, from: data)
                completion(.success(lifeScore))
            } catch let error {
                print("Error unable to decode the data \(error)")
                completion(.failure(.noDecode))
            }
        }.resume()
    }
    
}
