//
//  EmptyTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

class EmptyTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "EmptyTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
}
