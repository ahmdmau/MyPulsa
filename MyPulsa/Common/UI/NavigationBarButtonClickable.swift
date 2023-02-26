//
//  NavigationBarButtonClickable.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

protocol NavigationBarButtonClickable {
    func leftButtonClicked(button: AnyObject)
    func rightButtonClicked(button: AnyObject)
}

extension NavigationBarButtonClickable {
    func leftButtonClicked(button: AnyObject) {}
    func rightButtonClicked(button: AnyObject) {}
}

enum NavigationBarStyle {
    case backOnly
    case titleOnly
}

enum NavigationBarColorType {
    case solid
}

extension NavigationBarButtonClickable where Self: BaseViewController {
    
    func configureNavBar(colorType: NavigationBarColorType,
                         style: NavigationBarStyle) {
        configureNavBarColor(type: colorType)
        configureNavBarStyle(style: style)
    }
    
    private func configureNavBarColor(type: NavigationBarColorType) {
        switch type {
        case .solid:
            navigationController?.configureSolidNavigationBar(color: .primaryColor,
                                                              titleColor: .white)
        }
    }
    
    private func configureNavBarStyle(style: NavigationBarStyle) {
        switch style {
        case .backOnly:
            navigationItem.leftBarButtonItem = getWhiteBackButton()
            navigationItem.rightBarButtonItem = nil
        case .titleOnly:
            break
        }
    }
    
    private func getWhiteBackButton() -> UIBarButtonItem {
        let backButton = CustomBarButton(frame: .zero,
                                         rectInsets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8),
                                         size: CGSize(width: 44, height: 44))
        
        backButton.imageEdgeInsets.left = -15
        backButton.setImage(UIImage(named: "ic-back"), for: .normal)
        backButton.rx.controlEvent(.touchUpInside).bind { [weak self] in
            self?.leftButtonClicked(button: backButton)
        }.disposed(by: disposeBag)
        
        let barButtonItem = UIBarButtonItem(customView: backButton)
        return barButtonItem
    }
}
