//
//  ViewController.swift
//  CollectionView
//
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    let arrayTemperature = [
        "temp.green",
        "temp.darkGreen",
        "temp.lightYellow",
        "temp.darkYellow",
        "temp.orange",
        "temp.red",
    ]
    
    let arraySmiles = [
        "favorite",
        "nice",
        "routine",
        "notPleasant",
        "bad",
        "hate",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else { return }
        var currentSelectedImage: String!
        
        if collectionView == collectionViewOne{
            currentSelectedImage = arrayTemperature[indexPath.row]
        }
        
        if collectionView == collectionViewTwo{
            currentSelectedImage = arraySmiles[indexPath.row]
        }
        
        vc.setImageName(name: currentSelectedImage)
        present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewOne {
            return arrayTemperature.count
        }
        
        if collectionView == collectionViewTwo {
            return arraySmiles.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let dataSet = [
            (view: collectionViewOne, cell: "cellOne", images: arrayTemperature, id: "temp"),
            (view: collectionViewTwo, cell: "cellTwo", images: arraySmiles, id: "smile")
        ]
        
        for item in dataSet {
            if collectionView == item.view {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cell, for: indexPath) as? Cell {
                    let imageName = item.images[indexPath.row]
                    cell.setImage(id: item.id, imageName: imageName)
                    return cell
                }
            }
        }
        
        return UICollectionViewCell()
    }
}

