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
        guard let city = cityNormal,
              let population = city.population?.population,
              //let livingCostScore = city.rentAverage?.avg_rent,
              //let livabilityScore = city.lifeScore,
              let rentRates = city.rentAverage?.score,
              let airQuality = city.airQuality?.score,
              let walkScore = city.walkScore?.score else { return }

        cityNameLabel.text = city.cityName
        populationScoreLabel.text = "\(population)"
        //costOfLivingScoreLabel.text = "\(livingCostScore)"
        //livabilityScoreLabel.text = "\(livabilityScore)"
        rentRatesScoreLabel.text = "\(rentRates)"
        airQualityScoreLabel.text = "\(airQuality)"
        walkScoreLabel.text = "\(walkScore)"
    }
}
