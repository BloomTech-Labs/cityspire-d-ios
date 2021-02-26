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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
}
