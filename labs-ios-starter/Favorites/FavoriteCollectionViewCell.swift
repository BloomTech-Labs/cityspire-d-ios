//
//  FavoriteCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Kelson Hartle on 1/26/21.
//  Copyright © 2021 Spencer Curtis. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "New York")
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Star")
        imageView.contentMode = .scaleToFill
        
        return imageView
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
    
    let testView = UIView()
    let testViewTwo = UIView()
    
    
    fileprivate func setupCell() {
        
        self.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30)
            
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
        //testView.backgroundColor = .blue
        
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
