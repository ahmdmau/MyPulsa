//
//  PromoInfoTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import UIKit

protocol PromoInfoDelegate: AnyObject {
    func didCopyVoucher(voucherCode: String)
}

class PromoInfoTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "PromoInfoTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    var voucherCode = ""
    weak var delegate: PromoInfoDelegate?

    @IBOutlet weak var voucherCodeLabel: UILabel!
    @IBOutlet weak var validDateLabel: UILabel!
    @IBOutlet weak var promoNameLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var promoCodeContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        promoCodeContainerView.layer.cornerRadius = 8
        promoCodeContainerView.layer.borderWidth = 1
        promoCodeContainerView.layer.borderColor = UIColor.shadowColor.cgColor
        copyButton.roundCorners(corners: [.topRight, .bottomRight], radius: 8)
        copyButton.addTarget(self, action: #selector(copyButtonTapped), for: .touchUpInside)
    }
    
    func setup(with data: PromoModel) {
        voucherCode = data.voucherCode
        promoNameLabel.text = data.promoTitle
        validDateLabel.text = data.validDate
        voucherCodeLabel.text = data.voucherCode
    }
    
    @objc func copyButtonTapped() {
        UIPasteboard.general.string = voucherCode
        delegate?.didCopyVoucher(voucherCode: voucherCode)
    }
}
