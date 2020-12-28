//
//  Cell.swift
//  CollectionView
//
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    
    func setTemperatureImage(tempImage: String) {
        temperatureImage.image = UIImage(named: tempImage)
    }
}
