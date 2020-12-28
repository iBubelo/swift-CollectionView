//
//  Cell.swift
//  CollectionView
//
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    @IBOutlet weak var smileImage: UIImageView!
    
    func setImage(id: String, imageName: String) {
        switch id {
            case "temp":
                temperatureImage.image = UIImage(named: imageName)
            case "smile":
                smileImage.image = UIImage(named: imageName)
            default:
                break
        }
    }
}
