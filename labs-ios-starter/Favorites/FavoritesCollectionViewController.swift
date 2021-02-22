//
//  FavoritesCollectionViewController.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 1/25/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit
import CoreData

class FavoritesCollectionViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let cityNetworkClient = CityNetworkClient()
    let cityController = CityController()
    
    lazy var fetchResultsController: NSFetchedResultsController<CityCoreData> = {
       
        let fetchRequest: NSFetchRequest<CityCoreData> = CityCoreData.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "cityName", ascending: true)]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.mainContext, sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            print("Error fetching cities from core data.")
        }
        
        return frc
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = UIColor(named: "BackgroundCollection")
        collectionView.backgroundColor = UIColor(named: "BackgroundCollection")
        
//        cityNetworkClient.fetchAllCities { (result) in
//            do {
//                if try result.get() {
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData()
//                    }
//                }
//            } catch {
//                print("Error unable to fetch cities.")
//            }
//        }
        
        let crimeUrl =  cityNetworkClient.urlFor(city: "Chicago", score: .crime)
        
        cityNetworkClient.fetch(from: crimeUrl) { (rent: CrimeScore?, error: Error?) in
            print(rent?.score)
        }
        
        if let image = UIImage(named: "New York") {
            print("DADDY")
        }
        
        guard let cityPhoto = UIImage(named: "rio"), let cityPhotoData = cityPhoto.pngData() else { fatalError() }
        
//        cityController.createCityInCoreData(cityPhoto: cityPhotoData, cityCode: "New_York_City", cityId: 1, cityName: "New York City", stateAvreviation: "NY", airQualityScore: AirQualityCoreData(score: 5), crimeScore: CrimeScoreCoreData(score: 4), lifeScore: LifeScoreCoreData(score: 10), populationScore: PopulationCoreData(population: 10), rentScore: RentCoreData(score: 10, averageRent: 3000), walkScore: WalkScoreCoreData(score: 3))
        
        //deleteAllRecords()
        
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func deleteAllRecords() {
           //delete all data
        let context = CoreDataStack.shared.mainContext

           let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CityCoreData")
           let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

           do {
               try context.execute(deleteRequest)
               try context.save()
           } catch {
               print ("There was an error")
           }
       }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let favoriteDetailVC = segue.destination as? FavoriteDetailViewController {
            guard let cell = sender as? FavoriteCollectionViewCell else { return }
            favoriteDetailVC.city = cell.city
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension FavoritesCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FavoriteCollectionViewCell
        
        cell.layer.cornerRadius = 10
        let city = fetchResultsController.object(at: indexPath)
        cell.city = city
        cell.cityNameLabel.text = city.cityName
        var imageTwo = UIImage()
        if let imageData = city.cityPhoto {
            imageTwo = UIImage(data: imageData)!
            print("TESTES")
        }
        
        cell.backgroundView = UIImageView(image: imageTwo)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (5 / 6) * self.collectionView.bounds.width
        //let cellSpacing = (1/16) * self.collectionView.bounds.width
                
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionSpacing = (1/2) * self.collectionView.bounds.width
        
        return UIEdgeInsets(top: 20, left: sectionSpacing, bottom: 20, right: sectionSpacing)
    }
}
