//
//  CategoryCell.swift
//  Market
//
//  Created by Saher on 4/2/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    func configCell(category: Category) {
        categoryName.text = category.name
        categoryImage.image = category.image
    }
    
}
