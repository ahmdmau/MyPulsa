//
//  PromoItemCollectionViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

class PromoItemCollectionViewCell: UICollectionViewCell, CellProtocol {
    
    static var identifier: String = "PromoItemCollectionViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var promoImage: UIImageView!
    
    func setup(promo: PromoModel) {
        DispatchQueue.main.async {
            self.promoImage.image = UIImage(named: promo.bannerImage)
        }
    }
}
