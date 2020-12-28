//
//  ShowImageVC.swift
//  CollectionView
//
//

import UIKit

private let reuseIdentifier = "Cell"

class ShowImageVC: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentImage.image = UIImage(named: imageName)
    }
    
    func setImageName(name: String) {
        imageName = name
    }
}
