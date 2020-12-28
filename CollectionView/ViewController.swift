//
//  ViewController.swift
//  CollectionView
//
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    let arrayTemperature = [
        "temp.green",
        "temp.darkGreen",
        "temp.lightYellow",
        "temp.darkYellow",
        "temp.orange",
        "temp.red",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else { return }
        var currentSelectedImage: String!
        
        currentSelectedImage = arrayTemperature[indexPath.row]
        vc.setImageName(name: currentSelectedImage)
        present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTemperature.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell {
            let imageName = arrayTemperature[indexPath.row]
            cell.setTemperatureImage(tempImage: imageName)
            return cell
        }
        return UICollectionViewCell()
    }
}

