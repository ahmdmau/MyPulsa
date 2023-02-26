//
//  DataPackageItemTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import UIKit

protocol DataPackageItemDelegate: AnyObject {
    func didSelect(data: DataPackageModel)
}

class DataPackageItemTableViewCell: UITableViewCell, CellProtocol {

    @IBOutlet weak var packageDataNameLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    var data: DataPackageModel?
    weak var delegate: DataPackageItemDelegate?
    static var identifier: String = "DataPackageItemTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.addTarget(self, action: #selector(didBuyButtonTapped), for: .touchUpInside)
    }
    
    func setup(with data: DataPackageModel) {
        self.data = data
        packageDataNameLabel.text = data.dataPackageName
        priceLabel.text = "\(data.nominal.formatToIDR())"
        buyButton.setTitle("Rp\(data.nominal.formatToIDR())", for: .normal)
    }
    
    @objc func didBuyButtonTapped() {
        guard let data = self.data else { return }
        delegate?.didSelect(data: data)
    }
    
}
