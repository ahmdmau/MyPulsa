//
//  PulsaItemTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

class PulsaItemTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "PulsaItemTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var nominalLabel: UILabel!
    
    func setup(with data: PulsaModel) {
        nominalLabel.text = "\(data.nominal.formatToIDR())"
        buyButton.setTitle("Rp\(data.nominal.formatToIDR())", for: .normal)
    }
    
    
}
