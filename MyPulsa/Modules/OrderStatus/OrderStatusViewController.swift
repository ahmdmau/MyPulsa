//
//  OrderStatusViewController.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class OrderStatusViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orderModel: OrderModel
    init(orderModel: OrderModel) {
        self.orderModel = orderModel
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
    
}

extension OrderStatusViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailsTableViewCell.identifier, for: indexPath) as? OrderDetailsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: orderModel)
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentDetailsTableViewCell.identifier, for: indexPath) as? PaymentDetailsTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: orderModel)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoOrderTableViewCell.identifier, for: indexPath) as? InfoOrderTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        }
    }
    
}
