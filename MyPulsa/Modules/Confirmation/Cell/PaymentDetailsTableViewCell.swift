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
    
}
