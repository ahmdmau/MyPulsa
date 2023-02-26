//
//  UITextField+Extensions.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

extension UITextField {
    
    enum IconPosition {
        case left
        case right
    }
    
    func makeRightIcon(placeholder: String, image: UIImage, size: CGFloat = 18, view: UIViewController, selector: Selector?) {
        self.placeholder = placeholder
        let passwordVisibilityGesture = UITapGestureRecognizer(target: view, action: selector)
        setIcon(image: image, position: .right, size: size)
        makeUnderline()
        rightView?.addGestureRecognizer(passwordVisibilityGesture)
    }
    
    func makeRightIcon(placeholder: String, image: UIImage, size: CGFloat = 18, cell: UITableViewCell, selector: Selector?) {
        self.placeholder = placeholder
        let passwordVisibilityGesture = UITapGestureRecognizer(target: cell, action: selector)
        setIcon(image: image, position: .right, size: size)
        makeUnderline()
        rightView?.addGestureRecognizer(passwordVisibilityGesture)
    }
    
    func setIcon(image: UIImage, position: IconPosition, size: CGFloat = 18) {
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        let iconView = UIImageView(frame: CGRect(x: setIconPadding(position), y: 0, width: size, height: size))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        outerView.addSubview(iconView)
        
        switch position {
        case .left:
            leftViewMode = .always
            leftView = outerView
        case .right:
            rightViewMode = .always
            rightView = outerView
        }
        
    }
    
    private func setIconPadding(_ position: IconPosition) -> CGFloat {
        switch position {
        case .left:
            return 10.0
        case .right:
            return -10.0
        }
    }
    
    private func makeUnderline() {
        let bottomLine = CALayer()
        let width = CGFloat(1.0)
        bottomLine.frame = CGRect(x: 0.0, y: frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        bottomLine.borderColor = UIColor.lightGray.cgColor
        borderStyle = .none
        bottomLine.borderWidth = width
        layer.addSublayer(bottomLine)
        layer.masksToBounds = true
    }

}
