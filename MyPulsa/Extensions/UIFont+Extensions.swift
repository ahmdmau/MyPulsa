//
//  UIFont+Extensions.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

extension UIFont {
    
    static func interBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    static func interRegularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Regular", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    static func interSemiBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-SemiBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    static func interMediumFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Medium", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
}
