//
//  PulsaItemTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

protocol PulsaItemDelegate: AnyObject {
    func didSelect(data: PulsaModel)
}

class PulsaItemTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "PulsaItemTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    weak var delegate: PulsaItemDelegate?
    var data: PulsaModel?
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var nominalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.addTarget(self, action: #selector(didBuyButtonTapped), for: .touchUpInside)
    }
    
    func setup(with data: PulsaModel) {
        self.data = data
        nominalLabel.text = "\(data.nominal.formatToIDR())"
        buyButton.setTitle("Rp\(data.nominal.formatToIDR())", for: .normal)
    }
    
    @objc func didBuyButtonTapped() {
        guard let data = self.data else { return }
        delegate?.didSelect(data: data)
    }
}
