//
//  ConfirmationViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

enum ConfirmationCellType {
    case warning
    case paymentDetails(orderModel: OrderModel)
    case pinDetails
}

class ConfirmationViewController: BaseViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    
    var orderModel: OrderModel
    var pin = ""
    var cellType: [ConfirmationCellType] = []
    
    init(orderModel: OrderModel) {
        self.orderModel = orderModel
        cellType = [.warning, .paymentDetails(orderModel: orderModel), .pinDetails]
        super.init(nibName: "ConfirmationViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Loan Confirmation"
        self.configureNavBar(colorType: .solid, style: .backOnly)
        self.addKeyboardObserver(scrollView: tableView)
        self.hideKeyboardWhenTappedAround()
        setupTableView()
        setupLabel()
        topView.addShadowRegular()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardObserver()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WarningTableViewCell.nib(), forCellReuseIdentifier: WarningTableViewCell.identifier)
        tableView.register(PaymentDetailsTableViewCell.nib(), forCellReuseIdentifier: PaymentDetailsTableViewCell.identifier)
        tableView.register(PinTableViewCell.nib(), forCellReuseIdentifier: PinTableViewCell.identifier)
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setupLabel() {
        phoneNumberLabel.text = orderModel.phoneNumber
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        if pin.isEmpty {
            self.showErrorToast(message: "Pin is required, please input your pin")
        } else {
            self.navigationController?.pushViewController(OrderStatusViewController(orderModel: orderModel), animated: true)
        }
    }
}

extension ConfirmationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellType[indexPath.row] {
        case .warning:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WarningTableViewCell.identifier, for: indexPath) as? WarningTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case .paymentDetails(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentDetailsTableViewCell.identifier, for: indexPath) as? PaymentDetailsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: data)
            return cell
        case .pinDetails:
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
