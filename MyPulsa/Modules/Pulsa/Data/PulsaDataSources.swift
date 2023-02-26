//
//  PulsaDataSources.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 26/02/23.
//

import Foundation
import RxDataSources
import UIKit

struct PulsaDataSources {
    typealias DataSource = RxTableViewSectionedReloadDataSource
    
    static func dataSource() -> DataSource<PulsaViewSection> {
        return .init { dataSource, tableView, indexPath, item -> UITableViewCell in
            switch dataSource[indexPath] {
            case .listPulsa(let data):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PulsaItemTableViewCell.identifier, for: indexPath) as? PulsaItemTableViewCell else {
                    return UITableViewCell()
                }
                cell.setup(with: data)
                return cell
            case .promos(let promoData):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PromoTableViewCell.identifier, for: indexPath) as? PromoTableViewCell else {
                    return UITableViewCell()
                }
                cell.promos = promoData
                return cell
            case .empty:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier, for: indexPath) as? EmptyTableViewCell else {
                    return UITableViewCell()
                }
                
                return cell
            }
        }
    }
    
}
