//
//  InfoOrderTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class InfoOrderTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "InfoOrderTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        infoLabel.text = "Have a problem? Email us at support@kredivo.com"
        infoLabel.halfTextColorChange(fullText: "Have a problem? Email us at support@kredivo.com", changeText: "support@kredivo.com", color: UIColor.primaryColor)
    }
    
}
