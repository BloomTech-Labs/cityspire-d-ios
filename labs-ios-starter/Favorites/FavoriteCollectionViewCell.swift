//
//  FavoriteCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 1/26/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

protocol ProtocolDelegate {
    func refreshView(cell: FavoriteCollectionViewCell)
}

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Required Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    // MARK: - Properties
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "New York")
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .yellow
        
        return imageView
    }()
    
    let iconFavoriteButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .yellow
        
        return button
    }()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "New York City"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "USA"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let locationRating: UILabel = {
        let label = UILabel()
        label.text = "B+"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    let blurredContainerView: UIView = {
        let blurredView = UIView()
        let color = UIColor.gray.withAlphaComponent(0.8)
        blurredView.backgroundColor = color
        blurredView.layer.borderColor = color.cgColor
        blurredView.layer.borderWidth = 4
        
        return blurredView
        
    }()
    
    let cityNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .green
        
        return stackView
    }()
    
    let scoreAndBasicStackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .blue
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    var city: CityCoreData!
    
    let testView = UIView()
    let testViewTwo = UIView()
    let controller = CityController()
    var delegate : ProtocolDelegate?
    
    // MARK: - Private Functions
    @objc private func deleteFavorite() {
        let alert = UIAlertController(title: "Delete \(city.cityName ?? "this city")?", message: "are you sure?", preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss", style: .default, handler: nil))
        alert.addAction(.init(title: "Delete", style: .destructive, handler: { (action) in
            self.controller.deleteCityFromCoreData(cityToDelete: self.city, airQualityScore: self.city.airQualityScore!, crimeScore: self.city.crimeScore!, lifeScore: self.city.lifeScore!, populationScore: self.city.populationScore!, rentScore: self.city.rentScore!, walkScore: self.city.walkScore!)
            self.delegate?.refreshView(cell: self)
            
        }))
        
        //FavoriteDetailViewController().present(alert, animated: true, completion: nil)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func setupCell() {
        
        iconFavoriteButton.addTarget(self, action: #selector(self.deleteFavorite), for: .touchUpInside)
        self.addSubview(iconFavoriteButton)
        iconFavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconFavoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            iconFavoriteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            iconFavoriteButton.heightAnchor.constraint(equalToConstant: 30),
            iconFavoriteButton.widthAnchor.constraint(equalToConstant: 30)
            
        ])
        self.addSubview(blurredContainerView)
        blurredContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            blurredContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blurredContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blurredContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            blurredContainerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        blurredContainerView.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityNameLabel.leadingAnchor.constraint(equalTo: self.blurredContainerView.leadingAnchor, constant: 8),
            cityNameLabel.topAnchor.constraint(equalTo: self.blurredContainerView.topAnchor, constant: 4),
        ])
        
        blurredContainerView.addSubview(countryNameLabel)
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryNameLabel.leadingAnchor.constraint(equalTo: self.blurredContainerView.leadingAnchor, constant: 8),
            countryNameLabel.topAnchor.constraint(equalTo: self.cityNameLabel.bottomAnchor, constant: 4),
            
        ])
        
        blurredContainerView.addSubview(testView)
        testView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testView.trailingAnchor.constraint(equalTo: self.blurredContainerView.trailingAnchor, constant: -20),
            testView.leadingAnchor.constraint(equalTo: self.cityNameLabel.trailingAnchor, constant: 20),
            testView.topAnchor.constraint(equalTo: self.blurredContainerView.topAnchor, constant: 10),
            testView.heightAnchor.constraint(equalToConstant: 80)
            
        ])
        
        testView.addSubview(locationRating)
        locationRating.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationRating.centerXAnchor.constraint(equalTo: self.testView.centerXAnchor),
            locationRating.centerYAnchor.constraint(equalTo: self.testView.centerYAnchor)

        ])
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as? UIViewController
            }
        }
        return nil
    }
}
