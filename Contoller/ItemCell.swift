//
//  ItemCell.swift
//  Market
//
//  Created by Saher on 4/27/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemPrice: UILabel!

    
    func cellConfig(item: Items)
    {
        itemName.text = item.name
        itemDesc.text = item.description
        itemPrice.text = convertToCurrency(item.price ?? 0)
        itemPrice.adjustsFontSizeToFitWidth = true
        
        if item.imageLinks != nil && item.imageLinks.count > 0 {
            downloadImages(imageUrls: [item.imageLinks.first!]) { (image) in
                self.itemImage.image = image.first as? UIImage
            }
        }
    }
}
