//
//  OrderDetailsTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class OrderDetailsTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "OrderDetailsTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var providerImage: UIImageView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var orderIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusLabel.textColor = .green
        providerImage.layer.cornerRadius = 18.0
        providerImage.layer.borderWidth = 1
        providerImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setup(with data: OrderModel) {
        phoneNumber.text = data.phoneNumber
        orderIdLabel.text = data.id
    }
}
