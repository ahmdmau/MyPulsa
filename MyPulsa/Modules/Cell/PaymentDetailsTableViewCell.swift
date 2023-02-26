//
//  PaymentDetailsTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class PaymentDetailsTableViewCell: UITableViewCell, CellProtocol {

    static var identifier: String = "PaymentDetailsTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var nominal: UILabel!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    func setup(with data: OrderModel) {
        orderName.text = "\(data.orderName) \(data.nominal.formatToIDR())"
        nominal.text = "Rp\(data.nominal.formatToIDR())"
        totalLabel.text = "Rp\(data.nominal.formatToIDR())"
    }
}
