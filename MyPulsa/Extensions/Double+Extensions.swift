//
//  Double+Extensions.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import Foundation

extension Double {
    
    func removeZero() -> String {
        let tempVar = String(format: "%g", self)
        return tempVar
    }
    
    func formatToIDR() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }

}
