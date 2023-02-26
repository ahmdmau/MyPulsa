//
//  PinTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

protocol PinTableViewCellDelegate: AnyObject {
    func didPinChanged(pin: String)
}

class PinTableViewCell: UITableViewCell, CellProtocol {
    
    @IBOutlet weak var tncLabel: UILabel!
    @IBOutlet weak var pinTextField: UITextField!
    
    static var identifier: String = "PinTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    var isPasswordVisible: Bool = false
    weak var delegate: PinTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pinTextField.isSecureTextEntry = !isPasswordVisible
        tncLabel.text = "By continuing, I agree with loan agreement of Kredivo"
        tncLabel.halfTextColorChange(fullText: "By continuing, I agree with loan agreement of Kredivo", changeText: "loan agreement of Kredivo", color: UIColor.primaryColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pinTextField.makeRightIcon(placeholder: "PIN",
                                   image: UIImage(named: "visibility")!,
                                   cell: self,
                                selector: #selector(passwordVisibilityPressed))
    }
    
    @objc private func passwordVisibilityPressed() {
        if isPasswordVisible {
            isPasswordVisible = false
            pinTextField.makeRightIcon(placeholder: "PIN",
                                       image: UIImage(named: "visibility")!,
                                       cell: self,
                                    selector: #selector(passwordVisibilityPressed))
            pinTextField.isSecureTextEntry = true
        } else {
            isPasswordVisible = true
            pinTextField.makeRightIcon(placeholder: "PIN",
                                       image: UIImage(named: "visibility-off")!,
                                       cell: self,
                                    selector: #selector(passwordVisibilityPressed))
            pinTextField.isSecureTextEntry = false
        }
    }
    
    
    @IBAction func pinEditingChanged(_ sender: UITextField) {
        guard let pin = sender.text else { return }
        delegate?.didPinChanged(pin: pin)
    }
    
}
