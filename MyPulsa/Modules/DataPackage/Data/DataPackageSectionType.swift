//
//  DataPackageSectionType.swift
//  MyPulsa
//
//  Created by Ahmad Maulana on 27/02/23.
//

import Foundation
import RxDataSources

enum DataPackageItemView {
    case listDataPackage(data: DataPackageModel)
    case promos(data: [PromoModel])
    case empty
}

enum DataPackageViewSection {
    case listDataPackage(items: [DataPackageItemView])
    case promoSection(item: [DataPackageItemView])
    case emptySection(item: DataPackageItemView)
}

extension DataPackageViewSection: SectionModelType {
    
    typealias Item = DataPackageItemView
    
    var items: [DataPackageItemView] {
        switch self {
        case .listDataPackage(let items):
            return items
        case .promoSection(let items):
            return items
        case .emptySection(let item):
            return [item]
        }
    }
    
    init(original: DataPackageViewSection, items: [DataPackageItemView]) {
        self = original
    }
    
}
