//
//  OrderStatusViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

enum OrderStatusCellType {
    case paymentDetails(orderModel: OrderModel)
    case orderDetails(orderModel: OrderModel)
    case infoOrder
}

class OrderStatusViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orderModel: OrderModel
    var cellType: [OrderStatusCellType] = []
    
    init(orderModel: OrderModel) {
        self.orderModel = orderModel
        self.cellType = [
            .orderDetails(orderModel: orderModel),
            .paymentDetails(orderModel: orderModel),
            .infoOrder
        ]
        super.init(nibName: "OrderStatusViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Payment Details"
        self.configureNavBar(colorType: .solid, style: .toRoot)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PaymentDetailsTableViewCell.nib(), forCellReuseIdentifier: PaymentDetailsTableViewCell.identifier)
        tableView.register(OrderDetailsTableViewCell.nib(), forCellReuseIdentifier: OrderDetailsTableViewCell.identifier)
        tableView.register(InfoOrderTableViewCell.nib(), forCellReuseIdentifier: InfoOrderTableViewCell.identifier)
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension OrderStatusViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellType[indexPath.row] {
        case .orderDetails(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailsTableViewCell.identifier, for: indexPath) as? OrderDetailsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: data)
            return cell
        case .paymentDetails(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentDetailsTableViewCell.identifier, for: indexPath) as? PaymentDetailsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: data)
            return cell
        case .infoOrder:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoOrderTableViewCell.identifier, for: indexPath) as? InfoOrderTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        }
    }
    
}
