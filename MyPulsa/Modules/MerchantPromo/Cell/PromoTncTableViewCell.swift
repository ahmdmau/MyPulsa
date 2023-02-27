//
//  PromoTncTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import UIKit
import WebKit

class PromoTncTableViewCell: UITableViewCell, CellProtocol {
    
    @IBOutlet weak var tncLabel: UILabel!
    
    static var identifier: String = "PromoTncTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with data: String) {
        if let htmlString = data.data(using: .utf8) {
            let attributedOptions = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
            do {
                let attributedString = try NSAttributedString(data: htmlString, options: attributedOptions, documentAttributes: nil)
                let font = UIFont.interRegularFont(size: 14.0)
                let attributes: [NSAttributedString.Key: Any] = [.font: font as Any]
                let attributedStringWithFont = NSMutableAttributedString(attributedString: attributedString)
                attributedStringWithFont.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))
                
                tncLabel.attributedText = attributedStringWithFont
            } catch {
                print("Error displaying HTML string: \(error.localizedDescription)")
            }
        }
    }
}
