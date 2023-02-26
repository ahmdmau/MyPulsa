//
//  CustomBarButton.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

final class CustomBarButton: UIButton {
    
    private let rectInsets: UIEdgeInsets
    
    init(frame: CGRect, rectInsets: UIEdgeInsets, size: CGSize) {
        self.rectInsets = rectInsets
        super.init(frame: frame)
        
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var alignmentRectInsets: UIEdgeInsets {
        return rectInsets
    }
}
