//
//  SharedDetailViewController.swift
//  labs-ios-starter
//
//  Created by Chad Parker on 2/15/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class SharedDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var populationScoreLabel: UILabel!
    @IBOutlet weak var costOfLivingScoreLabel: UILabel!
    @IBOutlet weak var livabilityScoreLabel: UILabel!
    @IBOutlet weak var rentRatesScoreLabel: UILabel!
    @IBOutlet weak var airQualityScoreLabel: UILabel!
    @IBOutlet weak var walkScoreLabel: UILabel!
    
    
    var city: CityCoreData?
    var cityNormal: City?
    let controller = CityController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    @IBAction func didTapClose(_ sender: UIButton) {
        self.view.isHidden = true
    }
    
    
    
    @IBAction func saveAsFavorite(_ sender: Any) {
        guard let cityPhoto = UIImage(named: "rio"),
              let cityPhotoData = cityPhoto.pngData(),
              let city = cityNormal,
              let air = cityNormal?.airQuality?.score,
              let crime = cityNormal?.crimeScore?.score,
              let life = cityNormal?.lifeScore?.score,
              let population = cityNormal?.population?.population,
              let rent = cityNormal?.rentAverage?.score,
              let avgRent = cityNormal?.rentAverage?.avg_rent,
              let walk = cityNormal?.walkScore?.score
              
        else { return }
        
        let airSc = AirQualityCoreData(score: Double(air))
        let crimSc = CrimeScoreCoreData(score: Double(crime))
        let lifeSc = LifeScoreCoreData(score: life)
        let populationSc = PopulationCoreData(population: population)
        let rentSc = RentCoreData(score: Double(rent), averageRent: Double(avgRent))
        let walkSc = WalkScoreCoreData(score: Double(walk))
        
        
        controller.createCityInCoreData(cityPhoto: cityPhotoData, cityCode: city.cityCode, cityId: Double(city.cityCode) ?? 0, cityName: city.cityName, stateAvreviation: city.stateAbreviation, airQualityScore: airSc, crimeScore: crimSc, lifeScore: lifeSc, populationScore: populationSc, rentScore: rentSc, walkScore: walkSc)
    }
    
    
    func updateViews() {
        guard let city = cityNormal else { return }
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.maximumFractionDigits = 0
        
        
        cityNameLabel.text = city.cityName
        
        if let livingCost = city.rentAverage?.avg_rent {
            if let averageRentPrice = numberFormatter.string(from: livingCost as NSNumber) {
                costOfLivingScoreLabel.text = "\(averageRentPrice)"
            }
        } else {
            costOfLivingScoreLabel.text = "?"
        }
        
        if let population = city.population?.population {
            numberFormatter.numberStyle = .decimal
            if let populationFormatted = numberFormatter.string(from: population as NSNumber) {
                populationScoreLabel.text = "\(populationFormatted)"
            }
        } else {
            populationScoreLabel.text = "?"
        }
        
        if let livability = city.lifeScore?.score {
            livabilityScoreLabel.text = "\(livability)"
        } else {
            livabilityScoreLabel.text = "?"
        }
        
        if let rentRates = city.rentAverage?.score {
            rentRatesScoreLabel.text = "\(rentRates)"
        } else {
            rentRatesScoreLabel.text = "?"
        }
        
        if let airQuality = city.airQuality?.score {
            airQualityScoreLabel.text = "\(airQuality)"
        } else {
            airQualityScoreLabel.text = "?"
        }
        
        if let walkScore = city.walkScore?.score {
            walkScoreLabel.text = "\(walkScore)"
        } else {
            walkScoreLabel.text = "?"
        }
    }
    
    func updateLivability() {
        guard let city = cityNormal else { return }
        
        if let livability = city.lifeScore?.score {
            DispatchQueue.main.async {
                self.livabilityScoreLabel.text = "\(livability)"
            }
        } else {
            DispatchQueue.main.async {
                self.livabilityScoreLabel.text = "?"
            }
        }
    }
}
