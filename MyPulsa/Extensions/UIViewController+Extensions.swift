//
//  UIViewController+Extensions.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit
import Toast

extension UIViewController {

    func showErrorToast(message: String) {
        var style = ToastStyle()
        style.backgroundColor = .systemRed
        style.messageColor = .white
        self.view.makeToast(message, duration: 3.0, position: .bottom, style: style)
    }
    
    func showPrimaryToast(message: String) {
        var style = ToastStyle()
        style.backgroundColor = .primaryColor
        style.messageColor = .white
        self.view.makeToast(message, duration: 3.0, position: .bottom, style: style)
    }
    
}
