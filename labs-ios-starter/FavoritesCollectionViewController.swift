//
//  FavoritesCollectionViewController.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 1/25/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class FavoritesCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cities = ["New York", "Rio", "Orlando", "Miami", "San Diego", "Houston", "Kansas City"]
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .lightGray
        collectionView.backgroundColor = .lightGray
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

// MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension FavoritesCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FavoriteCollectionViewCell
        
        cell.layer.cornerRadius = 10
        let currentObject = cities[indexPath.row]
        cell.cityNameLabel.text = currentObject
        cell.backgroundView = cell.backgroundImageView
        
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
