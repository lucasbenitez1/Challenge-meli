//
//  Utils.swift
//  Challenge
//
//  Created by Lucas Emiliano Benitez Joncic on 28/02/2024.
//

import Foundation

class Utils {
    static func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: price)) ?? ""
    }
}
