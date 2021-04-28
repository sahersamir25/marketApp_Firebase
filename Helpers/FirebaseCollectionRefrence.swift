//
//  FirebaseCollectionRef.swift
//  Market
//
//  Created by Saher on 4/2/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionRef: String {
    case User
    case Category
    case Items
    case Basket
}

func FirebaseRef(_ collectionRef: FCollectionRef) -> CollectionReference {
    return Firestore.firestore().collection(collectionRef.rawValue)
}
