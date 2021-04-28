//
//  HelperFunctions.swift
//  Market
//
//  Created by Saher on 4/18/21.
//  Copyright © 2021 Saher. All rights reserved.
//

import Foundation

func convertToCurrency(_ number: Double) -> String {
    
    
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale.current
    
    let priceString = currencyFormatter.string(from: NSNumber(value: number))!
    
    return priceString 
}
