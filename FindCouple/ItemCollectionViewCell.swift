//
//  ItemCollectionViewCell.swift
//  FindCouple
//
//  Created by Roman Shestopal on 11.02.2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    static let identifire = "ItemCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage){
        imageOutlet.image = image
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ItemCollectionViewCell", bundle: nil)
    }

}
