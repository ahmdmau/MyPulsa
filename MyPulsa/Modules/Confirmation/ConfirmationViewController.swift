//
//  ConfirmationViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class ConfirmationViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    var pin = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Loan Confirmation"
        self.configureNavBar(colorType: .solid, style: .backOnly)
        self.addKeyboardObserver(scrollView: tableView)
        self.hideKeyboardWhenTappedAround()
        setupTableView()
        topView.addShadowRegular()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardObserver()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //        sectionBackgroundView.roundCorners(corners: [.topLeft, .topRight], radius: 6)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WarningTableViewCell.nib(), forCellReuseIdentifier: WarningTableViewCell.identifier)
        tableView.register(PaymentDetailsTableViewCell.nib(), forCellReuseIdentifier: PaymentDetailsTableViewCell.identifier)
        tableView.register(PinTableViewCell.nib(), forCellReuseIdentifier: PinTableViewCell.identifier)
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        if pin.isEmpty {
            print("Empty")
        } else {
            print("False")
        }
    }
}

extension ConfirmationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WarningTableViewCell.identifier, for: indexPath) as? WarningTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentDetailsTableViewCell.identifier, for: indexPath) as? PaymentDetailsTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PinTableViewCell.identifier, for: indexPath) as? PinTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        }
    }

}

extension ConfirmationViewController: PinTableViewCellDelegate {
    
    func didPinChanged(pin: String) {
        self.pin = pin
    }
    
}
