//
//  WarningTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class WarningTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "WarningTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }

}
