//
//  ProfileController.swift
//  LabsScaffolding
//
//  Created by Spencer Curtis on 7/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import OktaAuth

class ProfileController {
    
    static let shared = ProfileController()
    
    var profiles: [Profile] = []
    
    private let baseURL = URL(string: "https://labs-api-starter.herokuapp.com/")!
    
    private init() {
   
    }
    
    func getAllProfiles(completion: @escaping () -> Void) {
        
        guard let oktaCredentials = OktaAuth.shared.oktaCredentials else {
            completion()
            NSLog("Credentials do not exist. Unable to get profiles from API")
            return
        }
        
        let requestURL = baseURL.appendingPathComponent("profiles")
        var request = URLRequest(url: requestURL)
        
        request.addValue("Bearer \(oktaCredentials.accessToken)", forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                NSLog("Error getting all profiles: \(error)")
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Returned status code is not the expected 200. Instead it is \(response.statusCode)")
            }
            
            guard let data = data else {
                NSLog("No data returned from getting all profiles")
                DispatchQueue.main.async {
                    completion()
                }
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let profiles = try decoder.decode([Profile].self, from: data)
                
                DispatchQueue.main.async {
                    self.profiles = profiles
                    completion()
                }
            } catch {
                NSLog("Unable to decode [Profile] from data: \(error)")
            }
        }
        
        dataTask.resume()
    }
    
    func checkForExistingLoggedInUserProfile(completion: @escaping (Bool) -> Void) {
        guard let userID = OktaAuth.shared.oktaCredentials?.userID else {
            completion(false)
            NSLog("UserID does not exist. Unable to get logged in profile from API")
            return
        }
        
        getSingleProfile(userID) { (profile) in
            DispatchQueue.main.async {            
                completion(profile != nil)
            }
        }
    }
    
    func getSingleProfile(_ userID: String, completion: @escaping (Profile?) -> Void) {
        
        guard let oktaCredentials = OktaAuth.shared.oktaCredentials else {
            completion(nil)
            NSLog("Credentials do not exist. Unable to get profile from API")
            return
        }
        
        let requestURL = baseURL
            .appendingPathComponent("profiles")
            .appendingPathComponent(userID)
        var request = URLRequest(url: requestURL)
        
        request.addValue("Bearer \(oktaCredentials.accessToken)", forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                NSLog("Error getting all profiles: \(error)")
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Returned status code is not the expected 200. Instead it is \(response.statusCode)")
            }
            
            guard let data = data else {
                NSLog("No data returned from getting all profiles")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let profile = try decoder.decode(Profile.self, from: data)
                
                DispatchQueue.main.async {
                    completion(profile)
                }
            } catch {
                NSLog("Unable to decode Profile from data: \(error)")
            }
        }
        
        dataTask.resume()
    }
    
    func createProfile(with email: String, name: String, avatarURL: URL) -> Profile? {
        guard let oktaCredentials = OktaAuth.shared.oktaCredentials,
            let userID = oktaCredentials.userID else {
                NSLog("Credentials do not exist. Unable to create profile")
                return nil
        }
        return Profile(id: userID, email: email, name: name, avatarURL: avatarURL)
    }
    
    func addProfile(_ profile: Profile, completion: @escaping () -> Void) {
        
        guard let oktaCredentials = OktaAuth.shared.oktaCredentials else {
            DispatchQueue.main.async {
                completion()
            }
            NSLog("Credentials do not exist. Unable to add profile to API")
            return
        }
        
        let requestURL = baseURL.appendingPathComponent("profiles")
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        request.addValue("Bearer \(oktaCredentials.accessToken)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONEncoder().encode(profile)
        } catch {
            NSLog("Error encoding profile: \(profile)")
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error adding profile: \(error)")
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Returned status code is not the expected 200. Instead it is \(response.statusCode)")
                DispatchQueue.main.async {
                    completion()
                }
                return
            }
            
            self.profiles.append(profile)
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
        dataTask.resume()
    }
    
    func image(for url: URL, completion: @escaping (UIImage?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching image for url: \(url.absoluteString), error: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
            }
            completion(image)
        }
        
        dataTask.resume()
    }
}
