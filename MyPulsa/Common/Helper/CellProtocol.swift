//
//  CellProtocol.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var identifier: String { get }
    static func nib() -> UINib
}
