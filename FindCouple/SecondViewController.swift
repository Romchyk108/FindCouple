//
//  SecondViewController.swift
//  FindCouple
//
//  Created by Roman Shestopal on 11.02.2022.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var imageOutlet: UIImageView!
    
    let firstVC = ViewController()
    var arrayForImage: [String] = []
    var numberImages: Int = ViewController.numberImages
    var chooseImage: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(ItemCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemCollectionViewCell.identifire)
        collection.delegate = self
        collection.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imageOutlet.image = UIImage(named: randomeImage())
//        print("\(imageOutlet.)")
        for _ in 1...(numberImages * numberImages) + 1 {
            arrayForImage.append(randomeImage())
        }

    }
    
    func randomeImage() -> String{
        var random = Int.random(in: 1...8)
//        print("random = \(random)")
        return String(random)
    }
    
}

extension SecondViewController: UICollectionViewDelegate{
    
}

extension SecondViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (numberImages * numberImages)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifire, for: indexPath) as! ItemCollectionViewCell
        
        cell.configure(with: UIImage(named: arrayForImage[indexPath.row])!)
              
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayForImage[indexPath.row])
        
        // don`t work
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifire, for: indexPath) as! ItemCollectionViewCell
        if cell.imageOutlet != imageOutlet{
            cell.imageOutlet.image = UIImage(systemName: "xmark")
            collectionView.reloadData()
        }
        else {
            cell.imageOutlet.image = UIImage(systemName: "checkmark.seal")
            collectionView.reloadData()
        }
    }
    
}

extension SecondViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch ViewController.numberImages {
        case 4:
            return CGSize(width: 85, height: 85)
        case 5:
            return CGSize(width: 67, height: 67)
        case 6:
            return CGSize(width: 55, height: 55)
        case 7:
            return CGSize(width: 50, height: 50)
        default:
            return CGSize(width: 40, height: 40)
        }
    }
    
}
