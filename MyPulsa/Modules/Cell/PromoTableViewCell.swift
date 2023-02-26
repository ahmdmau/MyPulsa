//
//  PromoTableViewCell.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 25/02/23.
//

import UIKit

class PromoTableViewCell: UITableViewCell, CellProtocol {
    
    static var identifier: String = "PromoTableViewCell"
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }

    var promos: [PromoModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionViewCell()
    }
    
    private func setupCollectionViewCell() {
        collectionView.register(PromoItemCollectionViewCell.nib(), forCellWithReuseIdentifier: PromoItemCollectionViewCell.identifier)
        let layout = SnappingLayout()
        layout.snapPosition = .center
        layout.scrollDirection = .horizontal
        let cardWidth = UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.8)
        let width = UIScreen.main.bounds.width - cardWidth - 16
        let height = width / 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: cardWidth)
        layout.itemSize = CGSize(width: width, height: height)
        collectionHeight.constant = height
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .fast
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
}

extension PromoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoItemCollectionViewCell.identifier, for: indexPath) as? PromoItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(promo: promos[indexPath.row])
        return cell
    }
}
