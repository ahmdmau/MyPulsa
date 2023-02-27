//
//  PromoBannerTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import UIKit

class PromoBannerTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "PromoBannerTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func setup(with data: PromoModel) {
        bannerImageView.image = UIImage(named: data.bannerImage)
    }
    
}
