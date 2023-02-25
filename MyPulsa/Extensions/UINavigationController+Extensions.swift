//
//  UINavigationController+Extensions.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

extension UINavigationController {
    
    func configureSolidNavigationBar(color: UIColor = .primaryColor,
                                     titleColor: UIColor = .white,
                                     titleFontStyle: UIFont = UIFont.interMediumFont(size: 16)) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                              NSAttributedString.Key.font: titleFontStyle]
        
        guard #available(iOS 15, *) else {
            navigationBar.titleTextAttributes = textAttributes
            navigationBar.setBackgroundImage(UIImage.image(color: .primaryColor), for: .default)
            navigationBar.shadowImage = UIImage()
            
            return
        }
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        appearance.titleTextAttributes = textAttributes
        appearance.shadowColor = nil
        appearance.shadowImage = nil
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}

