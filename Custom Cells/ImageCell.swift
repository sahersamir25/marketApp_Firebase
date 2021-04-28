//
//  ImageCell.swift
//  Market
//
//  Created by Saher on 4/26/21.
//  Copyright © 2021 Saher. All rights reserved.
//


import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func configCell(itemImage: UIImage) {
        image.image = itemImage
    }
}
