//
//  BaseViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit
import RxSwift

var currentScrollView: UIScrollView?

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    func addKeyboardObserver(scrollView: UIScrollView) {
        currentScrollView = scrollView
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let scrollView = currentScrollView else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide() {
        guard let scrollView = currentScrollView else { return }
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = 0
        scrollView.contentInset = contentInset
    }
}

extension BaseViewController: NavigationBarButtonClickable {
    
    @objc func leftButtonClicked(button: AnyObject) {
        guard let navigationController = navigationController else {
            return
        }
        
        if navigationController.viewControllers.count == 1 {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController.popViewController(animated: true)
        }
    }
    
    @objc func closeButtonClicked(button: AnyObject) {
        guard let navigationController = navigationController else {
            return
        }
        
        navigationController.popToRootViewController(animated: true)
    }
}
