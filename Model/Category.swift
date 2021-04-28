//
//  Category.swift
//  Market
//
//  Created by Saher on 4/2/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(name: String, imageName: String) {
        self.id = ""
        self.name = name
        self.imageName = imageName
        self.image = UIImage(named: imageName)
    }
    
    init(dictionary: NSDictionary) {
        id = dictionary[KOBJECTID] as! String
        name = dictionary[KNAME] as! String
        image = UIImage(named: dictionary[KIMAGENAME] as? String ?? "")
    }
}


//MARK: Save category function
func saveCategoryToFirebase(_ category: Category){
    
    let id = UUID().uuidString
    category.id = id
    
    FirebaseRef(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String: Any])
}

//MARK: Services
func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
    return NSDictionary(objects: [category.id, category.name, category.imageName as Any], forKeys: [KOBJECTID as NSCopying, KNAME as NSCopying, KIMAGENAME as NSCopying])
}

//Mark: Download Data
func downloadData(complation: @escaping (_ categoryArray: [Category]) -> ()) {
    var categoryArray: [Category] = []
    
    FirebaseRef(.Category).getDocuments { (snapshot, error) in
        guard let snapshot = snapshot else { complation(categoryArray)
            return
        }
        
        if !snapshot.isEmpty {
            for categoryData in snapshot.documents {
                categoryArray.append(Category(dictionary: categoryData.data() as NSDictionary))
            }
        }
        complation(categoryArray)
    }
}

/*
//USE ONLY ONE TIME
 
 func createCategorySet() {
    
    let womenClothing = Category(_name: "Women Clothing", _imageName: "dress")
    let footWear = Category(_name: "Foot Wear", _imageName: "shoe")
    let electronics = Category(_name: "Electronics", _imageName: "telephone")
    let health = Category(_name: "Health", _imageName: "health")
    let baby = Category(_name: "Baby Stuff", _imageName:"baby-boy")
    let home = Category(_name: "Home & Kitchen", _imageName: "home")
    let car = Category(_name: "AutoMobiles", _imageName: "car")
    let luggahe = Category(_name: "Luggage", _imageName: "backpack")
    let jewlery = Category(_name: "Jewlery", _imageName: "jewellery")
    let hobby = Category(_name: "Hobby", _imageName: "bye")
    let pet = Category(_name: "Pet products", _imageName: "pet")
    let industry = Category(_name: "Indusry", _imageName: "factory")
    let homeSuppies = Category(_name: "Home Supplies", _imageName: "food")
    let camera = Category(_name: "Camera", _imageName: "camera")
    let men = Category(_name: "Men Clothing", _imageName: "underwear")
    
    
    let arrayOfCategories = [womenClothing , footWear , electronics , health , baby , home , car , luggahe , jewlery , hobby , pet , industry , homeSuppies , camera , men]
    
    for category in arrayOfCategories {
        saveCategoryToFirebase(category)
    }
 }
 */

    
