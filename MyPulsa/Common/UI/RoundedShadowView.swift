//
//  RoundedShadowView.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import UIKit

@IBDesignable
class RoundedShadowView: UIView {
    
    @IBInspectable
    var shadowColor: UIColor = .gray {
        didSet{
            setupAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupAppearance()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAppearance()
    }
    
    private func setupAppearance() {
        
        let path = UIBezierPath.init(rect: layer.bounds)
        layer.shadowPath = path.cgPath
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.25
        
        layer.cornerRadius = 6
    }
    
}
